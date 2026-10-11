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

/// The order the server answers with, by the stand it was sent with.
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
  standNumber: order.standNumber,
);

ApiException _modeChanged(String mode) => ApiException(
  code: 'dine_in_mode_changed',
  message: 'server: dine_in_mode_changed',
  statusCode: 409,
  details: {'mode': mode},
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
  final byTable = testCatalog();
  final byStand = testCatalog(dineInMode: DineInMode.number);
  final kopi = byTable.menus.first;

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

  Future<void> pay(SaleCubit cubit, Catalog catalog) =>
      cubit.pay(catalog: catalog, device: testTill(), received: 20790);

  NewOrder sent() =>
      verify(() => pos.createOrder(captureAny())).captured.single as NewOrder;

  void taking() => when(() => pos.createOrder(any())).thenAnswer(
    (call) async => _taken(call.positionalArguments.single as NewOrder),
  );

  test("needs a dine-in order's stand number where the outlet takes them, "
      'and sends it as the server keeps it', () async {
    taking();
    final cubit = withKopi();
    await pay(cubit, byStand);
    verifyNever(() => pos.createOrder(any()));

    cubit.setStandNumber('B-');
    await pay(cubit, byStand);
    verifyNever(() => pos.createOrder(any()));

    cubit.setStandNumber(' b-3 ');
    await pay(cubit, byStand);
    final order = sent();
    expect(order.standNumber, 'B-3');
    expect(order.tableId, isNull);
    expect(cubit.state.sold?.standNumber, 'B-3');
    // The next customer starts without one.
    expect(cubit.state.standNumber, isEmpty);
  });

  test(
    'sends no number with a takeaway, nor where the outlet seats at tables',
    () async {
      taking();
      final cubit = withKopi()..setType(OrderType.takeaway);
      await pay(cubit, byStand);
      expect(sent().standNumber, isNull);

      final atTables = withKopi();
      await pay(atTables, byTable);
      expect(sent().standNumber, isNull);
    },
  );

  test('lets go of the number for a takeaway, for good', () {
    final cubit = withKopi()..setStandNumber('12');
    expect(cubit.state.standNumber, '12');
    cubit.setType(OrderType.takeaway);
    expect(cubit.state.standNumber, isEmpty);
    cubit.setType(OrderType.dineIn);
    expect(cubit.state.standNumber, isEmpty);
  });

  test(
    'lets go of the table when the outlet turns to number stands, saying so',
    () {
      final cubit = withKopi()
        ..setTable(_a1)
        ..follow(byTable);
      expect(cubit.state.table, _a1);
      expect(cubit.state.notices, isEmpty);

      cubit.follow(byStand);
      expect(cubit.state.table, isNull);
      expect(cubit.state.notices, [const SaleNotice.tableDropped('A1')]);
      expect(cubit.state.lines, hasLength(1));
    },
  );

  test(
    'lets go of the number when the outlet turns back to tables, saying so',
    () {
      final cubit = withKopi()
        ..setStandNumber(' a5')
        ..follow(byStand);
      expect(cubit.state.standNumber, ' a5');
      expect(cubit.state.notices, isEmpty);

      cubit.follow(byTable);
      expect(cubit.state.standNumber, isEmpty);
      expect(cubit.state.notices, [const SaleNotice.standDropped('A5')]);

      // Nothing to say of spaces alone.
      cubit
        ..dismissNotices()
        ..setStandNumber('  ')
        ..follow(byTable);
      expect(cubit.state.standNumber, isEmpty);
      expect(cubit.state.notices, isEmpty);
    },
  );

  test('holds the number while the order is on its way', () async {
    when(() => pos.createOrder(any())).thenAnswer((call) async {
      await Future<void>.delayed(Duration.zero);
      return _taken(call.positionalArguments.single as NewOrder);
    });
    final cubit = withKopi()..setStandNumber('12');
    final paying = pay(cubit, byStand);
    expect(cubit.state.pending?.standNumber, '12');

    cubit
      ..setStandNumber('7')
      ..setType(OrderType.takeaway)
      ..follow(byTable);
    expect(cubit.state.standNumber, '12');
    expect(cubit.state.type, OrderType.dineIn);
    await paying;
  });

  test(
    'takes the table off when the sale is refused for number stands',
    () async {
      final refusal = _modeChanged('number');
      when(() => pos.createOrder(any())).thenThrow(refusal);
      final cubit = withKopi()..setTable(_a1);
      await pay(cubit, byTable);

      expect(cubit.state.table, isNull);
      expect(cubit.state.pending, isNull);
      expect(cubit.state.refused, refusal);
      expect(cubit.state.notices, [const SaleNotice.tableDropped('A1')]);
      expect(cubit.state.lines, hasLength(1));
    },
  );

  test('asks for the number when a sale at no table is refused for number '
      'stands', () async {
    when(() => pos.createOrder(any())).thenThrow(_modeChanged('number'));
    final cubit = withKopi();
    await pay(cubit, byTable);

    expect(cubit.state.notices, [const SaleNotice.nowNumber()]);
    expect(cubit.state.pending, isNull);
  });

  test('takes the number off when the sale is refused for tables', () async {
    final refusal = _modeChanged('table');
    when(() => pos.createOrder(any())).thenThrow(refusal);
    final cubit = withKopi()..setStandNumber('a5');
    await pay(cubit, byStand);

    expect(cubit.state.standNumber, isEmpty);
    expect(cubit.state.pending, isNull);
    expect(cubit.state.refused, refusal);
    expect(cubit.state.notices, [const SaleNotice.standDropped('A5')]);
  });
}
