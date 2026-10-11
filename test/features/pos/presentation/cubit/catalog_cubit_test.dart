import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pos.dart';

class _MockPos extends Mock implements PosRepository;

const _network = ApiException(code: 'network', message: '');

void main() {
  late _MockPos pos;

  setUp(() => pos = _MockPos());

  blocTest<CatalogCubit, CatalogState>(
    'loads the catalog',
    setUp: () =>
        when(() => pos.catalog()).thenAnswer((_) async => testCatalog()),
    build: () => CatalogCubit(pos),
    act: (cubit) => cubit.start(),
    expect: () => [CatalogState.ready(testCatalog())],
  );

  blocTest<CatalogCubit, CatalogState>(
    "fails when it can't load, and loads on retry",
    setUp: () {
      var calls = 0;
      when(() => pos.catalog()).thenAnswer((_) async {
        if (calls++ == 0) throw _network;
        return testCatalog();
      });
    },
    build: () => CatalogCubit(pos),
    act: (cubit) async {
      await cubit.start();
      await cubit.retry();
    },
    expect: () => [
      const CatalogState.failed(_network),
      const CatalogState.loading(),
      CatalogState.ready(testCatalog()),
    ],
  );

  blocTest<CatalogCubit, CatalogState>(
    'keeps the catalog in hand when a reload fails',
    setUp: () => when(() => pos.catalog()).thenThrow(_network),
    build: () => CatalogCubit(pos),
    seed: () => CatalogState.ready(testCatalog()),
    act: (cubit) => cubit.refresh(),
    expect: () => <CatalogState>[],
  );

  test('shares one request between reloads that overlap', () async {
    when(() => pos.catalog()).thenAnswer((_) async => testCatalog());
    final cubit = CatalogCubit(pos);
    addTearDown(cubit.close);

    await Future.wait([cubit.refresh(), cubit.refresh(), cubit.refresh()]);

    verify(() => pos.catalog()).called(1);
  });

  // testWidgets' fake clock drives the timer.
  testWidgets('loads again every 30 seconds while the app is in front', (
    tester,
  ) async {
    when(() => pos.catalog()).thenAnswer((_) async => testCatalog());
    final cubit = CatalogCubit(pos);

    await cubit.start();
    await tester.pump(const Duration(seconds: 30));
    await tester.pump(const Duration(seconds: 30));
    verify(() => pos.catalog()).called(3);

    // In the background: no loading until the app is back.
    cubit.paused();
    await tester.pump(const Duration(minutes: 5));
    verifyNever(() => pos.catalog());

    await cubit.resumed();
    verify(() => pos.catalog()).called(1);
    await tester.pump(const Duration(seconds: 30));
    verify(() => pos.catalog()).called(1);

    await cubit.close();
    await tester.pump(const Duration(minutes: 1));
    verifyNever(() => pos.catalog());
  });
}
