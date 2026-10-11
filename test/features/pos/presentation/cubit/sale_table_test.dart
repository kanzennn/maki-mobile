import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pos.dart';

class _MockPos extends Mock implements PosRepository;

const _a1 = OrderTable(tableId: 't-a1', name: 'A1');

/// The order the server answers with, at the table it was sent with.
Order _taken(NewOrder order) => Order(
  orderId: order.orderId,
  orderNo: order.orderNo,
  type: order.type,
  status: OrderStatus.paid,
  cashierName: 'Budi',
  lines: const [],
  subtotal: 18000,
  discount: 0,
  serviceBps: 500,
  service: 900,
  taxBps: 1000,
  tax: 1890,
  total: order.total,
  payment: OrderPayment(
    method: PaymentMethod.cash,
    amount: order.total,
    received: order.received,
    change: order.received! - order.total,
  ),
  clientCreatedAt: order.clientCreatedAt,
  tableId: order.tableId,
  tableName: order.tableId == null ? null : 'A1',
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

  setUp(() => pos = _MockPos());

  /// One Kopi susu: 18.000, 20.790 with service and tax.
  SaleCubit withKopi() {
    final cubit = SaleCubit(
      pos,
      resendDelays: const [Duration.zero, Duration.zero],
      now: () => DateTime.utc(2026, 10, 1, 3),
    );
    addTearDown(cubit.close);
    return cubit..add(kopi);
  }

  Future<void> pay(SaleCubit cubit) =>
      cubit.pay(catalog: catalog, device: testTill(), received: 20790);

  test(
    'goes with a dine-in order, and the next customer starts without it',
    () async {
      when(() => pos.createOrder(any())).thenAnswer(
        (call) async => _taken(call.positionalArguments.single as NewOrder),
      );
      final cubit = withKopi()..setTable(_a1);
      await pay(cubit);

      final sent =
          verify(() => pos.createOrder(captureAny())).captured.single
              as NewOrder;
      expect(sent.tableId, 't-a1');
      expect(sent.type, OrderType.dineIn);
      expect(cubit.state.sold?.tableName, 'A1');
      expect(cubit.state.table, isNull);
    },
  );

  test('is let go of by hand, and by a takeaway for good', () {
    final cubit = withKopi()..setTable(_a1);
    expect(cubit.state.table, _a1);
    cubit.setTable(null);
    expect(cubit.state.table, isNull);

    cubit
      ..setTable(_a1)
      ..setType(OrderType.takeaway);
    expect(cubit.state.table, isNull);
    cubit.setType(OrderType.dineIn);
    expect(cubit.state.table, isNull);
  });

  test('comes off when the sale refuses it, saying why', () async {
    const refusal = ApiException(
      code: 'table_unavailable',
      message: 'server: table_unavailable',
      statusCode: 409,
      details: {'status': 'inactive'},
    );
    when(() => pos.createOrder(any())).thenThrow(refusal);
    final cubit = withKopi()..setTable(_a1);
    await pay(cubit);

    expect(cubit.state.table, isNull);
    expect(cubit.state.pending, isNull);
    expect(cubit.state.refused, refusal);
    expect(cubit.state.notices, [const SaleNotice.tableRemoved('A1', refusal)]);
    expect(cubit.state.lines, hasLength(1));
  });

  test("can't change while the order is on its way", () async {
    when(() => pos.createOrder(any())).thenAnswer((call) async {
      await Future<void>.delayed(Duration.zero);
      return _taken(call.positionalArguments.single as NewOrder);
    });
    final cubit = withKopi()..setTable(_a1);
    final paying = pay(cubit);
    expect(cubit.state.pending, isNotNull);

    cubit
      ..setTable(null)
      ..setType(OrderType.takeaway);
    expect(cubit.state.table, _a1);
    expect(cubit.state.type, OrderType.dineIn);
    await paying;
  });
}
