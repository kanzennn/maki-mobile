import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pos.dart';

class _MockPos extends Mock implements PosRepository;

/// 10:00 in Bandung on 1 October.
final _now = DateTime.utc(2026, 10, 1, 3);

const _network = ApiException(code: 'network', message: '');

ApiException _refusal(
  String code, {
  int status = 409,
  Map<String, dynamic> details = const {},
}) => ApiException(
  code: code,
  message: 'server: $code',
  statusCode: status,
  details: details,
);

/// The order the server answers with.
Order _taken(NewOrder order) => Order(
  orderId: order.orderId,
  orderNo: order.orderNo,
  type: order.type,
  status: OrderStatus.paid,
  cashierName: 'Budi',
  lines: const [],
  subtotal: 36000,
  discount: 0,
  serviceBps: 500,
  service: 1800,
  taxBps: 1000,
  tax: 3780,
  total: order.total,
  payment: OrderPayment(
    method: PaymentMethod.cash,
    amount: order.total,
    received: order.received,
    change: order.received! - order.total,
  ),
  clientCreatedAt: order.clientCreatedAt,
);

void main() {
  setUpAll(() {
    initializeTimeZones();
    registerFallbackValue(
      NewOrder(
        orderId: 'x',
        orderNo: 'x',
        type: OrderType.dineIn,
        clientCreatedAt: DateTime.utc(2026),
        lines: const [],
        total: 0,
        method: PaymentMethod.cash,
      ),
    );
  });

  late _MockPos pos;
  final catalog = testCatalog();
  final kopi = catalog.menus.first;
  final teh = catalog.menus[1];

  setUp(() => pos = _MockPos());

  SaleCubit build() => SaleCubit(
    pos,
    resendDelays: const [Duration.zero, Duration.zero],
    now: () => _now,
  );

  /// Two Kopi susu: 36.000, service 1.800, tax 3.780, 41.580 in all.
  SaleCubit withTwoKopi() => build()
    ..add(kopi)
    ..add(kopi);

  const twoKopi = [CartLine(menuId: 'kopi', name: 'Kopi susu', qty: 2)];

  List<NewOrder> sent() => [
    for (final call in verify(() => pos.createOrder(captureAny())).captured)
      call as NewOrder,
  ];

  group('the cart', () {
    blocTest<SaleCubit, SaleState>(
      'takes menus up to their stock, notes and types',
      build: build,
      act: (cubit) => cubit
        ..add(kopi)
        ..setQty(kopi, 10)
        ..add(teh)
        ..setNote('teh', 'less sugar')
        ..remove('kopi')
        ..setType(OrderType.takeaway),
      skip: 5,
      expect: () => [
        const SaleState(
          type: OrderType.takeaway,
          lines: [
            CartLine(menuId: 'teh', name: 'Es teh', qty: 1, note: 'less sugar'),
          ],
        ),
      ],
    );

    blocTest<SaleCubit, SaleState>(
      'follows the catalog as it loads, and says what it changed',
      build: build,
      seed: () => const SaleState(
        lines: [
          CartLine(menuId: 'kopi', name: 'Kopi susu', qty: 3),
          CartLine(menuId: 'teh', name: 'Es teh', qty: 2),
          CartLine(menuId: 'roti', name: 'Roti bakar', qty: 1),
        ],
        notices: [SaleNotice.check()],
      ),
      act: (cubit) => cubit.follow(
        testCatalog(
          menus: [testMenu(stockQty: 1), catalog.menus[1], catalog.menus[2]],
        ),
      ),
      expect: () => [
        const SaleState(
          lines: [
            CartLine(menuId: 'kopi', name: 'Kopi susu', qty: 1),
            CartLine(menuId: 'teh', name: 'Es teh', qty: 2),
          ],
          notices: [
            SaleNotice.unavailable(['Roti bakar']),
            SaleNotice.stockCut(['Kopi susu']),
            SaleNotice.check(),
          ],
        ),
      ],
    );

    blocTest<SaleCubit, SaleState>(
      "doesn't change when the catalog still fits",
      build: build,
      seed: () => const SaleState(lines: twoKopi),
      act: (cubit) => cubit.follow(catalog),
      expect: () => <SaleState>[],
    );
  });

  group('paying', () {
    blocTest<SaleCubit, SaleState>(
      'sends one order, numbered by the device, and keeps its receipt',
      setUp: () => when(() => pos.createOrder(any())).thenAnswer(
        (call) async => _taken(call.positionalArguments.single as NewOrder),
      ),
      build: withTwoKopi,
      act: (cubit) =>
          cubit.pay(catalog: catalog, device: testTill(), received: 50000),
      verify: (cubit) {
        final order = sent().single;
        expect(order.orderId, matches(RegExp(r'^[a-z][a-z0-9]{23}$')));
        expect(
          order,
          NewOrder(
            orderId: order.orderId,
            orderNo: 'BDG01-K01-20261001-0005',
            type: OrderType.dineIn,
            clientCreatedAt: _now,
            lines: const [NewOrderLine(menuId: 'kopi', qty: 2, price: 18000)],
            total: 41580,
            method: PaymentMethod.cash,
            received: 50000,
          ),
        );
        expect(cubit.state.sold?.payment.change, 8420);
        expect(cubit.state.lines, isEmpty);
        expect(cubit.state.pending, isNull);
      },
    );

    test('locks the cart while the order is on its way', () async {
      when(() => pos.createOrder(any())).thenAnswer((call) async {
        await Future<void>.delayed(Duration.zero);
        return _taken(call.positionalArguments.single as NewOrder);
      });
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      final paying = cubit.pay(
        catalog: catalog,
        device: testTill(),
        received: 50000,
      );
      expect(cubit.state.sending, isTrue);
      expect(cubit.state.pending, isNotNull);
      cubit
        ..add(teh)
        ..setType(OrderType.takeaway);
      // A second tap while it is on its way.
      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);
      expect(cubit.state.lines, twoKopi);
      expect(cubit.state.type, OrderType.dineIn);
      await paying;

      verify(() => pos.createOrder(any())).called(1);
      expect(cubit.state.sold, isNotNull);
    });

    blocTest<SaleCubit, SaleState>(
      "doesn't charge less than the total, or an empty cart",
      build: withTwoKopi,
      act: (cubit) async {
        await cubit.pay(catalog: catalog, device: testTill(), received: 41579);
        cubit.remove('kopi');
        await cubit.pay(catalog: catalog, device: testTill(), received: 50000);
      },
      expect: () => [const SaleState()],
      verify: (_) => verifyNever(() => pos.createOrder(any())),
    );

    blocTest<SaleCubit, SaleState>(
      'turns to the next customer once the receipt is seen',
      build: build,
      seed: () => SaleState(
        sold: _taken(
          NewOrder(
            orderId: 'a',
            orderNo: 'n',
            type: OrderType.dineIn,
            clientCreatedAt: _now,
            lines: const [],
            total: 0,
            method: PaymentMethod.cash,
            received: 0,
          ),
        ),
      ),
      act: (cubit) => cubit.nextCustomer(),
      expect: () => [const SaleState()],
    );
  });

  group('without an answer', () {
    test('sends a 5xx order again, exactly as it was', () async {
      var calls = 0;
      when(() => pos.createOrder(any())).thenAnswer((call) async {
        if (calls++ == 0) throw _refusal('internal_error', status: 502);
        return _taken(call.positionalArguments.single as NewOrder);
      });
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      final orders = sent();
      expect(orders, hasLength(2));
      expect(orders.last, orders.first);
      expect(cubit.state.sold, isNotNull);
    });

    test('waits for the cashier after two resends, cart locked', () async {
      when(() => pos.createOrder(any())).thenThrow(_network);
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      verify(() => pos.createOrder(any())).called(3);
      expect(cubit.state.unanswered, isTrue);
      final pending = cubit.state.pending;
      cubit.add(teh);
      expect(cubit.state.lines, twoKopi);

      // The cashier sends it again: the same order, which is taken.
      when(() => pos.createOrder(any())).thenAnswer(
        (call) async => _taken(call.positionalArguments.single as NewOrder),
      );
      await cubit.resend();

      final again = verify(() => pos.createOrder(captureAny())).captured;
      expect(again.single, pending);
      expect(cubit.state.sold?.orderId, pending!.orderId);
      expect(cubit.state.pending, isNull);
    });

    test('lets the order go, saying it may have been taken', () async {
      when(() => pos.createOrder(any())).thenThrow(_network);
      final cubit = withTwoKopi();
      addTearDown(cubit.close);
      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      cubit.abandon();

      expect(cubit.state.pending, isNull);
      expect(cubit.state.lines, twoKopi);
      expect(cubit.state.notices, [const SaleNotice.abandoned()]);
      cubit.add(teh);
      expect(cubit.state.lines, hasLength(2));
    });

    test("doesn't follow the catalog while the order is on its way", () async {
      when(() => pos.createOrder(any())).thenThrow(_network);
      final cubit = withTwoKopi();
      addTearDown(cubit.close);
      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      // The stock ran out meanwhile: the order stays as it was sent.
      cubit.follow(testCatalog(menus: [testMenu(stockQty: 0)]));

      expect(cubit.state.lines, twoKopi);
      expect(cubit.state.notices, isEmpty);
    });

    test('says a let-go order once, however many times', () async {
      when(() => pos.createOrder(any())).thenThrow(_network);
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);
      cubit.abandon();
      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);
      cubit.abandon();

      expect(cubit.state.notices, [const SaleNotice.abandoned()]);
    });

    test("doesn't let an order on its way go", () async {
      when(() => pos.createOrder(any())).thenAnswer((call) async {
        await Future<void>.delayed(Duration.zero);
        throw _network;
      });
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      final paying = cubit.pay(
        catalog: catalog,
        device: testTill(),
        received: 50000,
      );
      cubit.abandon();
      expect(cubit.state.pending, isNotNull);
      await paying;
    });
  });

  group('a refusal', () {
    test('renumbers a taken receipt number, keeping the ID', () async {
      var calls = 0;
      when(() => pos.createOrder(any())).thenAnswer((call) async {
        if (calls++ == 0) throw _refusal('order_no_taken');
        return _taken(call.positionalArguments.single as NewOrder);
      });
      when(() => pos.device()).thenAnswer((_) async => testTill(nextNumber: 9));
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      final [first, second] = sent();
      expect(first.orderNo, 'BDG01-K01-20261001-0005');
      expect(second, first.copyWith(orderNo: 'BDG01-K01-20261001-0009'));
      expect(cubit.state.sold?.orderNo, 'BDG01-K01-20261001-0009');
    });

    test('gives up renumbering after twice', () async {
      when(() => pos.createOrder(any())).thenThrow(_refusal('order_no_taken'));
      when(() => pos.device()).thenAnswer((_) async => testTill());
      final cubit = withTwoKopi();
      addTearDown(cubit.close);

      await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

      verify(() => pos.createOrder(any())).called(3);
      expect(cubit.state.pending, isNull);
      expect(cubit.state.refused?.code, 'order_no_taken');
    });

    final inactive = _refusal('outlet_inactive', status: 403);
    final cases = {
      'prices_changed': (
        _refusal(
          'prices_changed',
          details: {
            'menus': [
              {'menu_id': 'kopi', 'price': 20000},
            ],
          },
        ),
        const [
          SaleNotice.pricesChanged(['Kopi susu']),
          SaleNotice.check(),
        ],
      ),
      'total_changed': (
        _refusal('total_changed', details: {'total': 42000}),
        const [SaleNotice.totalChanged(), SaleNotice.check()],
      ),
      'payment_method_unavailable': (
        _refusal('payment_method_unavailable'),
        const [SaleNotice.methodUnavailable()],
      ),
      'menu_unavailable': (
        _refusal('menu_unavailable'),
        const [SaleNotice.check()],
      ),
      'order_stock_insufficient': (
        _refusal('order_stock_insufficient'),
        const [SaleNotice.check()],
      ),
      "the phone's clock": (
        _refusal(
          'validation_failed',
          status: 422,
          details: {
            'fields': {'client_created_at': 'range'},
          },
        ),
        const [SaleNotice.clock()],
      ),
      'outlet_inactive': (inactive, [SaleNotice.error(inactive)]),
    };

    for (final MapEntry(key: name, value: (error, notices)) in cases.entries) {
      test('says what $name means, and frees the cart', () async {
        when(() => pos.createOrder(any())).thenThrow(error);
        final cubit = withTwoKopi();
        addTearDown(cubit.close);

        await cubit.pay(catalog: catalog, device: testTill(), received: 50000);

        verify(() => pos.createOrder(any())).called(1);
        expect(cubit.state.notices, notices);
        expect(cubit.state.refused, error);
        expect(cubit.state.pending, isNull);
        expect(cubit.state.sending, isFalse);
        expect(cubit.state.lines, twoKopi);
        cubit.add(teh);
        expect(cubit.state.lines, hasLength(2));
      });
    }

    blocTest<SaleCubit, SaleState>(
      'forgets its notices when dismissed',
      build: build,
      seed: () => const SaleState(notices: [SaleNotice.check()]),
      act: (cubit) => cubit.dismissNotices(),
      expect: () => [const SaleState()],
    );
  });
}
