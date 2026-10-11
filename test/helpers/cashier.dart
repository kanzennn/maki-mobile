// The cashier's screens, driven as a cashier would: the app on an
// activated phone over FakeHttpAdapter, and the steps a sale takes.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_api_client/maki_api_client.dart' as api;
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/menu_browser.dart';

import 'app.dart';
import 'fakes.dart';
import 'pos.dart';
import 'pump.dart';

typedef ApiRoute = (int, Object?) Function(RequestOptions request);

String rp(int amount) => formatRupiah(amount, 'id');

Object? bodyOf(RequestOptions request) {
  final data = request.data;
  return data is String ? jsonDecode(data) : data;
}

const _names = {'kopi': 'Kopi susu', 'teh': 'Es teh', 'roti': 'Roti bakar'};

/// The tables of [floorJson], by ID.
const _tables = {'t-a1': 'A1', 't-a2': 'A2', 't-t2': 'T2'};

/// The server taking the order it was sent: its own ID, number, lines and
/// cash, at the outlet's rates, with [testVoucher]'s discount when it names
/// a voucher, and at its table, or with its stand's number, when it names
/// one.
(int, Object?) taken(RequestOptions request) {
  final body = bodyOf(request)! as Map<String, dynamic>;
  final items = (body['items'] as List).cast<Map<String, dynamic>>();
  final code = body['voucher_code'] as String?;
  final table = body['table_id'] as String?;
  final subtotal = items.fold(
    0,
    (sum, item) => sum + (item['price'] as int) * (item['qty'] as int),
  );
  return (
    201,
    orderJson(
      orderId: body['order_id'] as String,
      orderNo: body['order_no'] as String,
      type: body['type'] as String,
      received: (body['payment'] as Map<String, dynamic>)['received'] as int?,
      clientCreatedAt: body['client_created_at'] as String,
      voucherCode: code == null ? null : testVoucher().code,
      tableId: table,
      tableName: _tables[table],
      standNumber: body['stand_number'] as String?,
      discount: code == null
          ? 0
          : voucherDiscount(testVoucher(), subtotal).discount,
      lines: [
        for (final item in items)
          (
            menuId: item['menu_id'] as String,
            name: _names[item['menu_id']] ?? '?',
            price: item['price'] as int,
            qty: item['qty'] as int,
            note: item['note'] as String?,
          ),
      ],
    ),
  );
}

List<Object?> ordersSent(TestApp app) => [
  for (final r in app.adapter.requests)
    if (r.method == 'POST' && r.uri.path == '/api/v1/outlets/o1/orders')
      bodyOf(r),
];

int callsTo(TestApp app, String call) =>
    app.adapter.calls.where((c) => c == call).length;

/// The cashier, signed in on an activated phone, its menus on screen.
Future<TestApp> openCashier(
  WidgetTester tester, {
  Size size = phoneSize,
  api.Me? user,
  Map<String, ApiRoute> routes = const {},
  DateTime Function()? now,
  double textScale = 1,
}) async {
  final app = await pumpApp(
    tester,
    size: size,
    savedRefreshToken: 'saved',
    deviceToken: 'device-1',
    now: now,
    textScale: textScale,
    routes: {
      'POST /api/v1/auth/refresh': (_) => (200, sessionJson(user: user)),
      'POST /api/v1/auth/logout': (_) => (204, null),
      ...tillRoutes(),
      ...routes,
    },
  );
  await pumpUntilFound(tester, find.widgetWithText(MenuCard, 'Kopi susu'));
  return app;
}

Future<void> addMenu(WidgetTester tester, String name, [int times = 1]) async {
  for (var i = 0; i < times; i++) {
    await tester.tap(find.widgetWithText(MenuCard, name));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

/// Opens the order — full screen on a phone, beside the menus on a tablet
/// — and its cash payment for [total].
Future<void> openPayment(
  WidgetTester tester, {
  required int total,
  bool phone = true,
}) async {
  if (phone) {
    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();
  }
  await tester.tap(find.widgetWithText(FilledButton, 'Bayar ${rp(total)}'));
  await tester.pumpAndSettle();
  expect(find.text('Bayar tunai'), findsOneWidget);
}

/// Pays the open payment with the exact amount.
Future<void> payExact(WidgetTester tester) async {
  await tester.tap(find.widgetWithText(OutlinedButton, 'Uang pas'));
  await tester.pumpAndSettle();
  await tester.tap(find.widgetWithText(FilledButton, 'Bayar'));
}

/// The answer of `POST …/vouchers/validate` for [testVoucher], on the
/// subtotal the request sends.
(int, Object?) validated(RequestOptions request) {
  final body = bodyOf(request)! as Map<String, dynamic>;
  return (200, voucherQuoteJson(subtotal: body['subtotal'] as int));
}

/// Types the code into the order's voucher field and checks it.
Future<void> applyVoucher(WidgetTester tester, String code) async {
  await tester.enterText(find.widgetWithText(TextField, 'Voucher'), code);
  await tester.pump();
  await tester.tap(find.widgetWithText(OutlinedButton, 'Pakai'));
  await tester.pumpAndSettle();
}
