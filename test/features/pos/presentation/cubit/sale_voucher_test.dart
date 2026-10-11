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

ApiException _refusal(String code, {Map<String, dynamic> details = const {}}) =>
    ApiException(
      code: code,
      message: 'server: $code',
      statusCode: 409,
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
  subtotal: 54000,
  discount: 6750,
  voucherCode: order.voucherCode,
  serviceBps: 500,
  service: 2363,
  taxBps: 1000,
  tax: 4961,
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

  setUp(() {
    pos = _MockPos();
    when(() => pos.validateVoucher(any(), any()))
        .thenAnswer((_) async => testVoucher());
  });

  /// Three Kopi susu: 54.000, 12,5% off with the voucher, 54.574 in all.
  SaleCubit withThreeKopi() {
    final cubit = SaleCubit(
      pos,
      resendDelays: const [Duration.zero, Duration.zero],
      now: () => DateTime.utc(2026, 10, 1, 3),
    );
    addTearDown(cubit.close);
    return cubit
      ..add(kopi)
      ..add(kopi)
      ..add(kopi);
  }

  Future<void> pay(SaleCubit cubit, {int received = 54574}) =>
      cubit.pay(catalog: catalog, device: testTill(), received: received);

  test('is checked on the subtotal, as typed, then follows the cart', () async {
    final cubit = withThreeKopi();
    final checking = cubit.applyVoucher(' merdeka17 ', catalog);
    expect(cubit.state.checkingVoucher, isTrue);
    await checking;

    verify(() => pos.validateVoucher('merdeka17', 54000)).called(1);
    expect(cubit.state.voucher, testVoucher());
    expect(cubit.state.checkingVoucher, isFalse);
    expect(cubit.state.voucherError, isNull);
    // Two now: short of the minimum spend, worked out here.
    cubit.remove('kopi');
    await cubit.applyVoucher('', catalog);
    verifyNever(() => pos.validateVoucher('', any()));
  });

  test('says why a code is refused, until the next try', () async {
    when(() => pos.validateVoucher('LEWAT', any()))
        .thenThrow(_refusal('voucher_expired'));
    final cubit = withThreeKopi();
    await cubit.applyVoucher('LEWAT', catalog);
    expect(cubit.state.voucher, isNull);
    expect(cubit.state.voucherError?.code, 'voucher_expired');

    await cubit.applyVoucher('MERDEKA17', catalog);
    expect(cubit.state.voucherError, isNull);
    expect(cubit.state.voucher, testVoucher());
  });

  test('goes with the order, its discount off the total', () async {
    when(() => pos.createOrder(any())).thenAnswer(
      (call) async => _taken(call.positionalArguments.single as NewOrder),
    );
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    await pay(cubit);

    final sent =
        verify(() => pos.createOrder(captureAny())).captured.single as NewOrder;
    expect(sent.voucherCode, 'MERDEKA17');
    expect(sent.total, 54574);
    // The next customer starts without it.
    expect(cubit.state.sold?.voucherCode, 'MERDEKA17');
    expect(cubit.state.voucher, isNull);
  });

  test("isn't paid for short of its minimum spend", () async {
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    cubit
      ..remove('kopi')
      ..add(kopi);
    await pay(cubit, received: 100000);
    verifyNever(() => pos.createOrder(any()));
  });

  test('comes off when the sale refuses it, saying why', () async {
    final refusal = _refusal('voucher_used_up');
    when(() => pos.createOrder(any())).thenThrow(refusal);
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    await pay(cubit);

    expect(cubit.state.voucher, isNull);
    expect(cubit.state.pending, isNull);
    expect(cubit.state.notices, [
      SaleNotice.voucherRemoved('MERDEKA17', refusal),
    ]);
    expect(cubit.state.lines, hasLength(1));
  });

  test('is checked again when the total changed', () async {
    when(() => pos.createOrder(any()))
        .thenThrow(_refusal('total_changed', details: {'total': 52164}));
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    when(() => pos.validateVoucher(any(), any()))
        .thenAnswer((_) async => testVoucher(value: 2000));
    await pay(cubit);
    await pumpEventQueue();

    verify(() => pos.validateVoucher('MERDEKA17', 54000)).called(2);
    expect(cubit.state.voucher?.value, 2000);
    expect(cubit.state.notices, contains(const SaleNotice.totalChanged()));
  });

  test("comes off when it can't be checked again", () async {
    when(() => pos.createOrder(any()))
        .thenThrow(_refusal('total_changed', details: {'total': 52164}));
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    final gone = _refusal('voucher_inactive');
    when(() => pos.validateVoucher(any(), any())).thenThrow(gone);
    await pay(cubit);
    await pumpEventQueue();

    expect(cubit.state.voucher, isNull);
    expect(
      cubit.state.notices,
      contains(SaleNotice.voucherRemoved('MERDEKA17', gone)),
    );
  });

  test("can't change while the order is on its way", () async {
    when(() => pos.createOrder(any())).thenAnswer((call) async {
      await Future<void>.delayed(Duration.zero);
      return _taken(call.positionalArguments.single as NewOrder);
    });
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    final paying = pay(cubit);
    cubit.removeVoucher();
    await cubit.applyVoucher('LAIN', catalog);
    expect(cubit.state.voucher, testVoucher());
    verifyNever(() => pos.validateVoucher('LAIN', any()));
    await paying;
  });

  test('can be taken off by hand', () async {
    final cubit = withThreeKopi();
    await cubit.applyVoucher('MERDEKA17', catalog);
    cubit.removeVoucher();
    expect(cubit.state.voucher, isNull);
  });

  group('checking a code', () {
    const threeKopi = [CartLine(menuId: 'kopi', name: 'Kopi susu', qty: 3)];
    final expired = _refusal('voucher_expired');

    blocTest<SaleCubit, SaleState>(
      'says it is checking, then takes the voucher',
      build: () => SaleCubit(pos),
      seed: () => const SaleState(lines: threeKopi),
      act: (cubit) => cubit.applyVoucher('MERDEKA17', catalog),
      expect: () => [
        const SaleState(lines: threeKopi, checkingVoucher: true),
        SaleState(lines: threeKopi, voucher: testVoucher()),
      ],
    );

    blocTest<SaleCubit, SaleState>(
      'clears the last refusal while checking, then says the new one',
      setUp: () =>
          when(() => pos.validateVoucher('LEWAT', any())).thenThrow(expired),
      build: () => SaleCubit(pos),
      seed: () => SaleState(
        lines: threeKopi,
        voucherError: _refusal('voucher_not_found'),
      ),
      act: (cubit) => cubit.applyVoucher('LEWAT', catalog),
      expect: () => [
        const SaleState(lines: threeKopi, checkingVoucher: true),
        SaleState(lines: threeKopi, voucherError: expired),
      ],
    );
  });
}
