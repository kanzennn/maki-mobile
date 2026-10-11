import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/floor_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pos.dart';

class _MockPos extends Mock implements PosRepository;

const _network = ApiException(code: 'network', message: '');

void main() {
  late _MockPos pos;

  setUp(() => pos = _MockPos());

  blocTest<FloorCubit, FloorState>(
    'loads the floor, and says whether the outlet has tables',
    setUp: () => when(() => pos.floor()).thenAnswer((_) async => testFloor()),
    build: () => FloorCubit(pos),
    act: (cubit) => cubit.start(),
    expect: () => [FloorState.ready(testFloor())],
    verify: (cubit) => expect(cubit.hasTables, isTrue),
  );

  test(
    'has no tables while it has not loaded, or the outlet has none',
    () async {
      when(() => pos.floor()).thenAnswer((_) async => const Floor(areas: []));
      final cubit = FloorCubit(pos);
      addTearDown(cubit.close);
      expect(cubit.hasTables, isFalse);
      await cubit.refresh();
      expect(cubit.state, const FloorState.ready(Floor(areas: [])));
      expect(cubit.hasTables, isFalse);
    },
  );

  blocTest<FloorCubit, FloorState>(
    "fails when it can't load, and loads on retry",
    setUp: () {
      var calls = 0;
      when(() => pos.floor()).thenAnswer((_) async {
        if (calls++ == 0) throw _network;
        return testFloor();
      });
    },
    build: () => FloorCubit(pos),
    act: (cubit) async {
      await cubit.start();
      await cubit.retry();
    },
    expect: () => [
      const FloorState.failed(_network),
      const FloorState.loading(),
      FloorState.ready(testFloor()),
    ],
  );

  blocTest<FloorCubit, FloorState>(
    'keeps the floor in hand when a reload fails',
    setUp: () => when(() => pos.floor()).thenThrow(_network),
    build: () => FloorCubit(pos),
    seed: () => FloorState.ready(testFloor()),
    act: (cubit) => cubit.refresh(),
    expect: () => <FloorState>[],
  );

  test('releases a table, then loads again to show it free', () async {
    when(() => pos.releaseTable(any())).thenAnswer((_) async {});
    when(() => pos.floor()).thenAnswer((_) async => testFloor());
    final cubit = FloorCubit(pos);
    addTearDown(cubit.close);

    await cubit.release('t-a2');

    verifyInOrder([() => pos.releaseTable('t-a2'), () => pos.floor()]);
    expect(cubit.state, FloorState.ready(testFloor()));
  });

  test("says why a release was refused, and doesn't load", () async {
    const gone = ApiException(
      code: 'table_not_found',
      message: '',
      statusCode: 404,
    );
    when(() => pos.releaseTable(any())).thenThrow(gone);
    final cubit = FloorCubit(pos);
    addTearDown(cubit.close);

    await expectLater(cubit.release('t-a2'), throwsA(gone));
    verifyNever(() => pos.floor());
  });

  test('shares one request between reloads that overlap', () async {
    when(() => pos.floor()).thenAnswer((_) async => testFloor());
    final cubit = FloorCubit(pos);
    addTearDown(cubit.close);

    await Future.wait([cubit.refresh(), cubit.refresh(), cubit.refresh()]);

    verify(() => pos.floor()).called(1);
  });

  // testWidgets' fake clock drives the timer.
  testWidgets('loads again every 30 seconds while the app is in front', (
    tester,
  ) async {
    when(() => pos.floor()).thenAnswer((_) async => testFloor());
    final cubit = FloorCubit(pos);

    await cubit.start();
    await tester.pump(const Duration(seconds: 30));
    await tester.pump(const Duration(seconds: 30));
    verify(() => pos.floor()).called(3);

    // In the background: no loading until the app is back.
    cubit.paused();
    await tester.pump(const Duration(minutes: 5));
    verifyNever(() => pos.floor());

    await cubit.resumed();
    verify(() => pos.floor()).called(1);

    await cubit.close();
    await tester.pump(const Duration(minutes: 1));
    verifyNever(() => pos.floor());
  });
}
