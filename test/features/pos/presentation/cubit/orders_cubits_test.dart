import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/order_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/today_orders_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _MockPos extends Mock implements PosRepository;

const _network = ApiException(code: 'network', message: '');

OrderSummary _summary(int n) => OrderSummary(
  orderId: 'ord$n',
  orderNo: 'BDG01-K01-20261001-${n.toString().padLeft(4, '0')}',
  type: OrderType.dineIn,
  status: OrderStatus.paid,
  total: 41580,
  itemCount: 2,
  method: PaymentMethod.cash,
  cashierName: 'Budi',
  clientCreatedAt: DateTime.utc(2026, 10, 1, 3),
);

Order _order({OrderStatus status = OrderStatus.paid, String? reason}) => Order(
  orderId: 'ord1',
  orderNo: 'BDG01-K01-20261001-0001',
  type: OrderType.dineIn,
  status: status,
  cashierName: 'Budi',
  lines: const [],
  subtotal: 36000,
  discount: 0,
  serviceBps: 500,
  service: 1800,
  taxBps: 1000,
  tax: 3780,
  total: 41580,
  payment: const OrderPayment(
    method: PaymentMethod.cash,
    amount: 41580,
    received: 50000,
    change: 8420,
  ),
  clientCreatedAt: DateTime.utc(2026, 10, 1, 3),
  voidReason: reason,
);

void main() {
  late _MockPos pos;

  setUp(() => pos = _MockPos());

  group('TodayOrdersCubit', () {
    final first = [for (var n = 25; n > 5; n--) _summary(n)];

    blocTest<TodayOrdersCubit, TodayOrdersState>(
      'loads the first page for a search',
      setUp: () =>
          when(() => pos.todayOrders(search: '0012'))
              .thenAnswer((_) async => (orders: [_summary(12)], total: 1)),
      build: () => TodayOrdersCubit(pos),
      act: (cubit) => cubit.load('0012'),
      expect: () => [
        const TodayOrdersState.loading(search: '0012'),
        TodayOrdersState.ready(
          search: '0012',
          orders: [_summary(12)],
          total: 1,
        ),
      ],
    );

    blocTest<TodayOrdersCubit, TodayOrdersState>(
      'adds the next page, showing an order pushed down to it once',
      setUp: () {
        when(() => pos.todayOrders())
            .thenAnswer((_) async => (orders: first, total: 25));
        // A new order came meanwhile: the first page's last is now the
        // second's first.
        when(() => pos.todayOrders(page: 2)).thenAnswer(
          (_) async =>
              (orders: [for (var n = 6; n > 0; n--) _summary(n)], total: 26),
        );
      },
      build: () => TodayOrdersCubit(pos),
      act: (cubit) async {
        await cubit.load();
        await cubit.loadMore();
        // Both pages loaded: the order made meanwhile is on the first,
        // which a reload brings.
        await cubit.loadMore();
      },
      skip: 2,
      expect: () => [
        TodayOrdersState.ready(
          search: '',
          orders: first,
          total: 25,
          loadingMore: true,
        ),
        TodayOrdersState.ready(
          search: '',
          orders: [...first, for (var n = 5; n > 0; n--) _summary(n)],
          total: 26,
          pages: 2,
        ),
      ],
      verify: (_) {
        verify(() => pos.todayOrders(page: 2)).called(1);
      },
    );

    blocTest<TodayOrdersCubit, TodayOrdersState>(
      'keeps the list when the next page fails',
      setUp: () {
        when(() => pos.todayOrders())
            .thenAnswer((_) async => (orders: first, total: 25));
        when(() => pos.todayOrders(page: 2)).thenThrow(_network);
      },
      build: () => TodayOrdersCubit(pos),
      act: (cubit) async {
        await cubit.load();
        await cubit.loadMore();
      },
      skip: 3,
      expect: () => [
        TodayOrdersState.ready(
          search: '',
          orders: first,
          total: 25,
          moreError: _network,
        ),
      ],
    );

    test("drops the answer to a search that isn't the last", () async {
      final slow = Completer<OrderPage>();
      when(() => pos.todayOrders(search: '1')).thenAnswer((_) => slow.future);
      when(() => pos.todayOrders(search: '12'))
          .thenAnswer((_) async => (orders: [_summary(12)], total: 1));
      final cubit = TodayOrdersCubit(pos);
      addTearDown(cubit.close);

      final older = cubit.load('1');
      await cubit.load('12');
      slow.complete((orders: first, total: 25));
      await older;

      expect(
        cubit.state,
        TodayOrdersState.ready(search: '12', orders: [_summary(12)], total: 1),
      );
    });

    blocTest<TodayOrdersCubit, TodayOrdersState>(
      "says when today's orders can't load, and reloads the same search",
      setUp: () {
        var calls = 0;
        when(() => pos.todayOrders(search: '7')).thenAnswer((_) async {
          if (calls++ == 0) throw _network;
          return (orders: [_summary(7)], total: 1);
        });
      },
      build: () => TodayOrdersCubit(pos),
      act: (cubit) async {
        await cubit.load('7');
        await cubit.reload();
      },
      expect: () => [
        const TodayOrdersState.loading(search: '7'),
        const TodayOrdersState.failed(search: '7', error: _network),
        const TodayOrdersState.loading(search: '7'),
        TodayOrdersState.ready(search: '7', orders: [_summary(7)], total: 1),
      ],
    );
  });

  group('OrderCubit', () {
    blocTest<OrderCubit, OrderState>(
      'loads the order, and voids it for a reason',
      setUp: () {
        when(() => pos.order('ord1')).thenAnswer((_) async => _order());
        when(() => pos.voidOrder('ord1', 'Salah input')).thenAnswer(
          (_) async =>
              _order(status: OrderStatus.voided, reason: 'Salah input'),
        );
      },
      build: () => OrderCubit(pos, 'ord1'),
      act: (cubit) async {
        await cubit.load();
        await cubit.voidOrder('Salah input');
        // Voided: nothing more to void.
        await cubit.voidOrder('Salah input');
      },
      expect: () => [
        const OrderState.loading(),
        OrderState.ready(_order()),
        OrderState.ready(_order(), voiding: true),
        OrderState.ready(
          _order(status: OrderStatus.voided, reason: 'Salah input'),
        ),
      ],
      verify: (_) =>
          verify(() => pos.voidOrder('ord1', 'Salah input')).called(1),
    );

    blocTest<OrderCubit, OrderState>(
      'says why a void was refused',
      setUp: () => when(() => pos.voidOrder(any(), any())).thenThrow(
        const ApiException(code: 'forbidden', message: '', statusCode: 403),
      ),
      build: () => OrderCubit(pos, 'ord1'),
      seed: () => OrderState.ready(_order()),
      act: (cubit) => cubit.voidOrder('Salah input'),
      expect: () => [
        OrderState.ready(_order(), voiding: true),
        OrderState.ready(
          _order(),
          voidError: const ApiException(
            code: 'forbidden',
            message: '',
            statusCode: 403,
          ),
        ),
      ],
    );

    blocTest<OrderCubit, OrderState>(
      'shows an order voided meanwhile as it is now',
      setUp: () {
        when(() => pos.voidOrder(any(), any())).thenThrow(
          const ApiException(
            code: 'order_already_void',
            message: '',
            statusCode: 409,
          ),
        );
        when(() => pos.order('ord1')).thenAnswer(
          (_) async => _order(status: OrderStatus.voided, reason: 'Retur'),
        );
      },
      build: () => OrderCubit(pos, 'ord1'),
      seed: () => OrderState.ready(_order()),
      act: (cubit) => cubit.voidOrder('Salah input'),
      expect: () => [
        OrderState.ready(_order(), voiding: true),
        OrderState.ready(
          _order(status: OrderStatus.voided, reason: 'Retur'),
          voidError: const ApiException(
            code: 'order_already_void',
            message: '',
            statusCode: 409,
          ),
        ),
      ],
    );

    blocTest<OrderCubit, OrderState>(
      "fails when the order can't load",
      setUp: () => when(() => pos.order('ord1')).thenThrow(_network),
      build: () => OrderCubit(pos, 'ord1'),
      act: (cubit) => cubit.load(),
      expect: () => const [OrderState.loading(), OrderState.failed(_network)],
    );
  });
}
