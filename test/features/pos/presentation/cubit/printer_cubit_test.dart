import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/features/pos/data/receipt_printer.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/printer_cubit.dart';

import '../../../../helpers/printer.dart';

/// A printer that takes its time, for what happens meanwhile.
class _SlowPrinter extends FakePrinter {
  _SlowPrinter({super.settings});

  final gate = Completer<void>();

  @override
  Future<void> send(String address, Uint8List bytes) async {
    await gate.future;
    await super.send(address, bytes);
  }
}

void main() {
  const chosen = PrinterSettings(printer: testPrinter);
  Uint8List ticket(PaperWidth paper) => Uint8List.fromList([paper.columns]);

  test('loads what the phone remembers', () async {
    final printer = FakePrinter(
      settings: const PrinterSettings(
        printer: testPrinter,
        paper: PaperWidth.mm80,
        auto: true,
      ),
    );
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.settings.printer, testPrinter);
    expect(cubit.state.settings.paper, PaperWidth.mm80);
    expect(cubit.state.settings.auto, isTrue);
  });

  test('saves each change, keeping the rest', () async {
    final printer = FakePrinter();
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);

    await cubit.choose(testPrinter);
    await cubit.setPaper(PaperWidth.mm80);
    await cubit.setAuto(auto: true);

    expect(printer.saves, 3);
    expect(printer.settings.printer, testPrinter);
    expect(printer.settings.paper, PaperWidth.mm80);
    expect(printer.settings.auto, isTrue);
  });

  test('lists what is paired, and says why it could not', () async {
    final printer = FakePrinter();
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);

    await cubit.listPaired();
    expect(cubit.state.paired, [testPrinter]);
    expect(cubit.state.listProblem, isNull);

    printer.listProblem = PrinterProblem.bluetoothOff;
    await cubit.listPaired();
    expect(cubit.state.paired, isEmpty);
    expect(cubit.state.listProblem, PrinterProblem.bluetoothOff);
    expect(cubit.state.listing, isFalse);
  });

  test('prints for the roll, to the chosen printer', () async {
    final printer = FakePrinter(
      settings: const PrinterSettings(
        printer: testPrinter,
        paper: PaperWidth.mm80,
      ),
    );
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);
    await cubit.load();

    expect(await cubit.print(ticket), isNull);

    expect(printer.sent.single.$1, testPrinter.address);
    expect(printer.sent.single.$2, [48]);
    expect(cubit.state.printing, isFalse);
  });

  test('says there is no printer, and sends nothing', () async {
    final printer = FakePrinter();
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);

    expect(await cubit.print(ticket), PrinterProblem.noPrinter);
    expect(printer.sent, isEmpty);
  });

  test('answers with the problem, and is ready for another try', () async {
    final printer = FakePrinter(settings: chosen);
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);
    await cubit.load();
    printer.sendProblem = PrinterProblem.connectFailed;

    expect(await cubit.print(ticket), PrinterProblem.connectFailed);
    expect(cubit.state.printing, isFalse);

    printer.sendProblem = null;
    expect(await cubit.print(ticket), isNull);
    expect(printer.sent, hasLength(1));
  });

  test('sends one ticket at a time', () async {
    final printer = _SlowPrinter(settings: chosen);
    final cubit = PrinterCubit(printer, printer);
    addTearDown(cubit.close);
    await cubit.load();

    final first = cubit.print(ticket);
    expect(cubit.state.printing, isTrue);
    expect(await cubit.print(ticket), isNull);
    printer.gate.complete();
    await first;

    expect(printer.sent, hasLength(1));
  });

  test('settings read back what was written, and survive a bad store', () {
    const settings = PrinterSettings(
      printer: testPrinter,
      paper: PaperWidth.mm80,
      auto: true,
    );
    final back = PrinterSettings.fromJson(settings.toJson());
    expect(back.printer, testPrinter);
    expect(back.paper, PaperWidth.mm80);
    expect(back.auto, isTrue);

    final odd = PrinterSettings.fromJson(const {'paper': 7, 'auto': 'yes'});
    expect(odd.printer, isNull);
    expect(odd.paper, PaperWidth.mm58);
    expect(odd.auto, isFalse);
  });
}
