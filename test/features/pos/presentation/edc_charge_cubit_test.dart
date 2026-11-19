import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/data/manual_edc_terminal.dart';
import 'package:maki_mobile/features/pos/domain/edc.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/edc_charge_cubit.dart';

const EdcRequest _request = (orderNo: 'BDG01-K01-20261001-0001', amount: 41580);

class _Machine implements EdcTerminal {
  _Machine(this.answers);

  final List<Future<EdcResult> Function()> answers;
  int asked = 0;

  @override
  Future<EdcResult> charge(EdcRequest request) => answers[asked++]();
}

Future<EdcResult> Function() _says(EdcResult result) =>
    () async => result;

void main() {
  group('checkReference', () {
    test('keeps a reference in capitals', () {
      expect(checkReference(' ab-123456 ').reference, 'AB-123456');
      expect(checkReference('123456789012').reference, '123456789012');
    });

    for (final (typed, problem) in [
      ('', ReferenceProblem.required),
      ('   ', ReferenceProblem.required),
      ('123', ReferenceProblem.format),
      ('12 34!', ReferenceProblem.format),
      ('-1234', ReferenceProblem.format),
      ('1' * 33, ReferenceProblem.format),
      ('4111111111111', ReferenceProblem.cardNumber),
      ('4111111111111111', ReferenceProblem.cardNumber),
      ('4111-1111-1111-1111', ReferenceProblem.cardNumber),
    ]) {
      test('refuses "$typed" as ${problem.name}', () {
        final checked = checkReference(typed);
        expect(checked.reference, isNull);
        expect(checked.problem, problem);
      });
    }
  });

  group('EdcChargeCubit', () {
    test('is paid by an approved charge, and asks no more', () async {
      final machine = _Machine([_says(const EdcApproved('ab-1234'))]);
      final cubit = EdcChargeCubit(machine);
      addTearDown(cubit.close);
      await cubit.charge(_request);
      await cubit.charge(_request);
      expect((cubit.state as EdcPaid).reference, 'AB-1234');
      expect(machine.asked, 1);
    });

    test('charges again only after the money did not move', () async {
      final machine = _Machine([
        _says(const EdcNotChargedResult(EdcNotCharged.declined)),
        _says(const EdcApproved('1234')),
      ]);
      final cubit = EdcChargeCubit(machine);
      addTearDown(cubit.close);
      await cubit.charge(_request);
      expect((cubit.state as EdcFailed).reason, EdcNotCharged.declined);
      await cubit.charge(_request);
      expect((cubit.state as EdcPaid).reference, '1234');
    });

    test('never charges twice at once', () async {
      final answer = Completer<EdcResult>();
      final machine = _Machine([() => answer.future]);
      final cubit = EdcChargeCubit(machine);
      addTearDown(cubit.close);
      final first = cubit.charge(_request);
      expect(cubit.state, isA<EdcCharging>());
      await cubit.charge(_request);
      answer.complete(const EdcApproved('1234'));
      await first;
      expect(machine.asked, 1);
    });

    for (final (name, answer) in [
      (
        'says it had no answer',
        _says(const EdcByHandResult(EdcByHand.noAnswer)),
      ),
      ('fails', () async => throw StateError('socket closed')),
      (
        'approves with a number the server would refuse',
        _says(const EdcApproved('4111111111111111')),
      ),
    ]) {
      test(
        'asks the cashier, never the machine again, when it $name',
        () async {
          final machine = _Machine([answer]);
          final cubit = EdcChargeCubit(machine);
          addTearDown(cubit.close);
          await cubit.charge(_request);
          await cubit.charge(_request);
          expect((cubit.state as EdcAwaitingSlip).reason, EdcByHand.noAnswer);
          expect(machine.asked, 1);
        },
      );
    }

    test(
      'takes the number off the slip from a machine not connected',
      () async {
        final cubit = EdcChargeCubit(const ManualEdcTerminal());
        addTearDown(cubit.close);
        await cubit.charge(_request);
        expect((cubit.state as EdcAwaitingSlip).reason, EdcByHand.manual);
        expect(cubit.enter('4111111111111111'), ReferenceProblem.cardNumber);
        expect(cubit.state, isA<EdcAwaitingSlip>());
        expect(cubit.enter(' ab-1234 '), isNull);
        expect((cubit.state as EdcPaid).reference, 'AB-1234');
      },
    );

    test('takes no number before the machine was asked', () {
      final cubit = EdcChargeCubit(const ManualEdcTerminal());
      addTearDown(cubit.close);
      expect(cubit.enter('1234'), isNull);
      expect(cubit.state, isA<EdcIdle>());
    });
  });
}
