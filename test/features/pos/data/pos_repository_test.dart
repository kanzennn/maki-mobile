import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_client.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';

import '../../../helpers/app.dart';
import '../../../helpers/fakes.dart';
import '../../../helpers/pos.dart';

void main() {
  late FakeDeviceTokenStorage deviceStorage;
  late DeviceTokenStore deviceTokens;

  setUp(() async {
    deviceStorage = FakeDeviceTokenStorage();
    deviceTokens = DeviceTokenStore(deviceStorage);
    await deviceTokens.load();
  });

  Future<(PosRepository, FakeHttpAdapter)> repositoryWith(
    Map<String, (int, Object?) Function(RequestOptions)> routes,
  ) async {
    final (:api, :session) = createApi(
      config: testConfig,
      tokens: FakeTokenStorage(),
      deviceTokens: deviceTokens,
      deviceLanguage: () => 'id',
    );
    addTearDown(session.close);
    final adapter = FakeHttpAdapter(routes);
    api.dio.httpClientAdapter = adapter;
    await session.start(testSession());
    return (PosRepository(api, deviceTokens, outletId: 'o1'), adapter);
  }

  Object? body(RequestOptions request) {
    final data = request.data;
    return data is String ? jsonDecode(data) : data;
  }

  test("reads the catalog into the app's models", () async {
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/pos/catalog': (_) =>
          (200, posCatalogJson(locale: 'en')),
    });

    final catalog = await pos.catalog();

    expect(catalog, testCatalog(outlet: testCatalogOutlet(locale: 'en')));
    expect(catalog.menus.last.stock, StockLevel.out);
  });

  test('reads how the outlet seats its dine-in customers', () async {
    var mode = 'number';
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/pos/catalog': (_) =>
          (200, posCatalogJson(dineInMode: mode)),
    });

    expect((await pos.catalog()).dineInMode, DineInMode.number);
    mode = 'table';
    expect((await pos.catalog()).dineInMode, DineInMode.table);
  });

  test("reads this phone's device and its count", () async {
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/pos/device': (_) =>
          (200, posDeviceJson(day: '2026-12-31', nextNumber: 12)),
    });

    expect(await pos.device(), testTill(day: '2026-12-31', nextNumber: 12));
  });

  test('says when the phone is no device of the outlet', () async {
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/pos/device': (_) =>
          apiError(403, 'device_not_registered'),
    });

    await expectLater(
      pos.device(),
      throwsA(
        isA<ApiException>().having(
          (e) => e.code,
          'code',
          'device_not_registered',
        ),
      ),
    );
  });

  test(
    'activates the phone as an Android device and keeps its token',
    () async {
      final (pos, adapter) = await repositoryWith({
        'POST /api/v1/outlets/o1/devices': (_) => (
          201,
          {
            'device': {
              'device_id': 'd1',
              'code': 'K01',
              'name': 'Kasir depan',
              'platform': 'android',
              'status': 'active',
              'activated_by': {'user_id': 'u9', 'name': 'Sari'},
              'activated_at': '2026-10-01T03:00:00Z',
              'last_seen_at': null,
              'revoked_at': null,
              'revoked_by': null,
            },
            'token': 'device-token',
          },
        ),
        'GET /api/v1/outlets/o1/pos/device': (_) => (200, posDeviceJson()),
      });

      await pos.activate('  Kasir depan ');
      await pos.device();

      expect(body(adapter.requests.first), {
        'name': 'Kasir depan',
        'platform': 'android',
      });
      expect(deviceStorage.token, 'device-token');
      expect(
        adapter.requests.last.headers[ApiInterceptor.deviceTokenHeader],
        'device-token',
      );
    },
  );

  test('sends an order exactly as the cashier charged it', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/orders': (_) => (201, orderJson()),
    });

    final taken = await pos.createOrder(
      NewOrder(
        orderId: 'a${'1' * 23}',
        orderNo: 'BDG01-K01-20261001-0005',
        type: OrderType.dineIn,
        clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4, 5, 6),
        lines: const [
          NewOrderLine(menuId: 'kopi', qty: 2, price: 18000, note: 'hot'),
          NewOrderLine(menuId: 'teh', qty: 1, price: 8000),
        ],
        total: 50820,
        method: PaymentMethod.cash,
        received: 100000,
      ),
    );

    expect(body(adapter.requests.single), {
      'order_id': 'a${'1' * 23}',
      'order_no': 'BDG01-K01-20261001-0005',
      'type': 'dine_in',
      'client_created_at': '2026-10-01T03:04:05.006Z',
      'items': [
        {'menu_id': 'kopi', 'qty': 2, 'price': 18000, 'note': 'hot'},
        {'menu_id': 'teh', 'qty': 1, 'price': 8000},
      ],
      'total': 50820,
      'payment': {'method': 'cash', 'received': 100000},
    });
    expect(taken.orderNo, 'BDG01-K01-20261001-0005');
  });

  test('checks a voucher code on the subtotal, and reads its terms', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/vouchers/validate': (_) =>
          (200, voucherQuoteJson()),
    });

    expect(await pos.validateVoucher('merdeka17', 54000), testVoucher());
    expect(body(adapter.requests.single), {
      'code': 'merdeka17',
      'subtotal': 54000,
    });
  });

  test("says why the sale can't take a voucher", () async {
    final (pos, _) = await repositoryWith({
      'POST /api/v1/outlets/o1/vouchers/validate': (_) => (
        409,
        {
          'error': {'code': 'voucher_used_up', 'message': 'Habis.'},
        },
      ),
    });

    await expectLater(
      pos.validateVoucher('HABIS', 54000),
      throwsA(
        isA<ApiException>().having((e) => e.code, 'code', 'voucher_used_up'),
      ),
    );
  });

  test('sends the voucher with the order, and reads it back', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/orders': (_) =>
          (201, orderJson(voucherCode: 'MERDEKA17', discount: 4500)),
    });

    final taken = await pos.createOrder(
      NewOrder(
        orderId: 'a${'1' * 23}',
        orderNo: 'BDG01-K01-20261001-0005',
        type: OrderType.dineIn,
        clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4, 5),
        lines: const [NewOrderLine(menuId: 'kopi', qty: 2, price: 18000)],
        total: 36854,
        method: PaymentMethod.cash,
        received: 50000,
        voucherCode: 'MERDEKA17',
      ),
    );

    expect(
      (body(adapter.requests.single)! as Map)['voucher_code'],
      'MERDEKA17',
    );
    expect(taken.voucherCode, 'MERDEKA17');
    expect(taken.discount, 4500);
  });

  test('reads an order as the server took it', () async {
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/orders/ord1': (_) => (
        200,
        orderJson(
          type: 'takeaway',
          status: 'void',
          voidReason: 'Salah input',
          lines: [
            (
              menuId: 'kopi',
              name: 'Kopi susu',
              price: 18000,
              qty: 2,
              note: 'hot',
            ),
          ],
        ),
      ),
    });

    final order = await pos.order('ord1');

    expect(
      order,
      Order(
        orderId: 'ord1',
        orderNo: 'BDG01-K01-20261001-0005',
        type: OrderType.takeaway,
        status: OrderStatus.voided,
        cashierName: 'Budi',
        lines: const [
          OrderLine(
            orderLineId: 'ord1-0',
            menuId: 'kopi',
            name: 'Kopi susu',
            price: 18000,
            qty: 2,
            note: 'hot',
            lineTotal: 36000,
          ),
        ],
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
        clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4, 5),
        voidReason: 'Salah input',
      ),
    );
  });

  test("asks for a page of today's orders, by part of a number", () async {
    final (pos, adapter) = await repositoryWith({
      'GET /api/v1/outlets/o1/orders': (_) =>
          (200, orderListJson([orderSummaryJson()], page: 2, total: 21)),
    });

    final page = await pos.todayOrders(search: ' 0005 ', page: 2);
    await pos.todayOrders();

    expect(adapter.requests.first.queryParameters, {
      'q': '0005',
      'page': 2,
      'page_size': 20,
    });
    expect(adapter.requests.last.queryParameters, isNot(contains('q')));
    expect(page.total, 21);
    expect(page.orders.single.orderNo, 'BDG01-K01-20261001-0005');
    expect(page.orders.single.itemCount, 2);
  });

  test("reads the floor into the app's models", () async {
    final (pos, _) = await repositoryWith({
      'GET /api/v1/outlets/o1/pos/tables': (_) => (200, floorJson()),
    });

    expect(await pos.floor(), testFloor());
  });

  test('releases a table', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/tables/t-a2/release': (_) =>
          (200, releasedTableJson('t-a2', 'A2')),
    });

    await pos.releaseTable('t-a2');

    expect(adapter.calls, ['POST /api/v1/outlets/o1/tables/t-a2/release']);
  });

  test('sends the table with the order, and reads it back', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/orders': (_) =>
          (201, orderJson(tableId: 't-a1', tableName: 'A1')),
      'GET /api/v1/outlets/o1/orders': (_) =>
          (200, orderListJson([orderSummaryJson(tableName: 'A1')])),
    });

    final taken = await pos.createOrder(
      NewOrder(
        orderId: 'a${'1' * 23}',
        orderNo: 'BDG01-K01-20261001-0005',
        type: OrderType.dineIn,
        clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4, 5),
        lines: const [NewOrderLine(menuId: 'kopi', qty: 2, price: 18000)],
        total: 41580,
        method: PaymentMethod.cash,
        received: 50000,
        tableId: 't-a1',
      ),
    );

    expect((body(adapter.requests.single)! as Map)['table_id'], 't-a1');
    expect(taken.tableId, 't-a1');
    expect(taken.tableName, 'A1');
    expect((await pos.todayOrders()).orders.single.tableName, 'A1');
  });

  test("sends the stand's number with the order, and reads it back", () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/orders': (_) =>
          (201, orderJson(standNumber: 'A5')),
      'GET /api/v1/outlets/o1/orders': (_) =>
          (200, orderListJson([orderSummaryJson(standNumber: 'A5')])),
    });

    final taken = await pos.createOrder(
      NewOrder(
        orderId: 'a${'1' * 23}',
        orderNo: 'BDG01-K01-20261001-0005',
        type: OrderType.dineIn,
        clientCreatedAt: DateTime.utc(2026, 10, 1, 3, 4, 5),
        lines: const [NewOrderLine(menuId: 'kopi', qty: 2, price: 18000)],
        total: 41580,
        method: PaymentMethod.cash,
        received: 50000,
        standNumber: 'A5',
      ),
    );

    final sent = body(adapter.requests.single)! as Map;
    expect(sent['stand_number'], 'A5');
    expect(sent.containsKey('table_id'), isFalse);
    expect(taken.standNumber, 'A5');
    expect((await pos.todayOrders()).orders.single.standNumber, 'A5');
  });

  test('voids an order for its reason', () async {
    final (pos, adapter) = await repositoryWith({
      'POST /api/v1/outlets/o1/orders/ord1/void': (_) =>
          (200, orderJson(status: 'void', voidReason: 'Salah input')),
    });

    final voided = await pos.voidOrder('ord1', '  Salah input ');

    expect(body(adapter.requests.single), {'reason': 'Salah input'});
    expect(voided.status, OrderStatus.voided);
  });
}
