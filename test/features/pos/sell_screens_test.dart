import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_api_client/maki_api_client.dart' as api;
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/menu_browser.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    final phone = size == phoneSize;

    testWidgets('charges cash with change and shows the receipt, on a $name', (
      tester,
    ) async {
      final app = await openCashier(
        tester,
        size: size,
        routes: {'POST /api/v1/outlets/o1/orders': taken},
      );
      if (!phone) {
        // The header: this device and the outlet's date.
        expect(find.text('K01 · Kasir depan · 1 Okt 2026'), findsOneWidget);
      }

      await addMenu(tester, 'Kopi susu', 2);
      expect(find.text('2 di pesanan'), findsOneWidget);
      if (phone) expect(find.text('2 item'), findsOneWidget);

      await openPayment(tester, total: 41580, phone: phone);
      expect(find.text('2 × ${rp(18000)}'), findsWidgets);
      // Pay stays off until the cash covers the total.
      final payButton = find.widgetWithText(FilledButton, 'Bayar');
      expect(tester.widget<FilledButton>(payButton).onPressed, isNull);
      final cash = find.widgetWithText(TextField, 'Uang diterima');
      await tester.enterText(cash, '40000');
      await tester.pumpAndSettle();
      // Grouped as it is typed.
      expect(tester.widget<TextField>(cash).controller?.text, '40.000');
      expect(find.text('Kurang ${rp(1580)}'), findsOneWidget);
      expect(tester.widget<FilledButton>(payButton).onPressed, isNull);
      // 100.000 covers it; a quick amount below the total is off.
      expect(
        tester
            .widget<OutlinedButton>(
              find.widgetWithText(OutlinedButton, rp(50000)),
            )
            .onPressed,
        isNotNull,
      );
      await tester.tap(find.widgetWithText(OutlinedButton, rp(50000)));
      await tester.pumpAndSettle();
      expect(find.text(rp(8420)), findsOneWidget);

      await tester.tap(payButton);
      await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

      expect(find.text('Kembalian ${rp(8420)}'), findsOneWidget);
      expect(find.text('BDG01-K01-20261001-0005'), findsOneWidget);
      expect(find.text('Terima kasih'), findsOneWidget);
      expect(ordersSent(app), [
        {
          'order_id': matches(RegExp(r'^[a-z][a-z0-9]{23}$')),
          'order_no': 'BDG01-K01-20261001-0005',
          'type': 'dine_in',
          'client_created_at': '2026-10-01T03:00:00.000Z',
          'items': [
            {'menu_id': 'kopi', 'qty': 2, 'price': 18000},
          ],
          'total': 41580,
          'payment': {'method': 'cash', 'received': 50000},
        },
      ]);

      await tester.tap(find.text('Transaksi baru'));
      await tester.pumpAndSettle();
      expect(find.text('Transaksi tersimpan'), findsNothing);
      expect(find.text('2 di pesanan'), findsNothing);
      if (phone) {
        expect(find.text('Lihat pesanan'), findsNothing);
      } else {
        expect(
          find.text('Belum ada pesanan. Pilih menu untuk mulai.'),
          findsOneWidget,
        );
      }
      // The device's count and the stock were asked for again.
      expect(callsTo(app, 'GET /api/v1/outlets/o1/pos/device'), 2);
      expect(callsTo(app, 'GET /api/v1/outlets/o1/pos/catalog'), 2);
    });
  }

  testWidgets('takes the type, notes and quantities into the order', (
    tester,
  ) async {
    final app = await openCashier(
      tester,
      routes: {'POST /api/v1/outlets/o1/orders': taken},
    );
    await addMenu(tester, 'Kopi susu');
    await addMenu(tester, 'Es teh');
    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Takeaway'));
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.byTooltip('Tambah Kopi susu'));
      await tester.pump();
    }
    await tester.pumpAndSettle();
    // Three is all the stock there is.
    expect(find.text('Sisa stok 3'), findsOneWidget);
    expect(
      tester
          .widget<IconButton>(find.widgetWithIcon(IconButton, Icons.add).first)
          .onPressed,
      isNull,
    );
    await tester.tap(find.byTooltip('Kurangi Kopi susu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Catatan').first);
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextField, 'Catatan untuk Kopi susu'),
      'less sugar',
    );
    await tester.tap(find.byTooltip('Hapus Es teh'));
    await tester.pumpAndSettle();
    expect(find.text('Es teh'), findsNothing);

    // 2 × 18.000, service 1.800, tax 3.780.
    await tester.tap(find.widgetWithText(FilledButton, 'Bayar ${rp(41580)}'));
    await tester.pumpAndSettle();
    await payExact(tester);
    await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

    expect(ordersSent(app).single, {
      'order_id': isA<String>(),
      'order_no': 'BDG01-K01-20261001-0005',
      'type': 'takeaway',
      'client_created_at': '2026-10-01T03:00:00.000Z',
      'items': [
        {'menu_id': 'kopi', 'qty': 2, 'price': 18000, 'note': 'less sugar'},
      ],
      'total': 41580,
      'payment': {'method': 'cash', 'received': 41580},
    });
  });

  testWidgets("shows the stock in words, and sold out can't be picked", (
    tester,
  ) async {
    await openCashier(
      tester,
      routes: tillRoutes(
        catalog: posCatalogJson(
          menus: [
            posMenuJson(),
            posMenuJson(
              menuId: 'teh',
              name: 'Es teh',
              trackStock: false,
              stockQty: null,
              stockAlert: null,
              stockStatus: api.StockStatus.untracked,
            ),
            posMenuJson(
              menuId: 'jus',
              name: 'Jus jeruk',
              stockQty: 1,
              stockAlert: 2,
              stockStatus: api.StockStatus.low,
            ),
            posMenuJson(
              menuId: 'roti',
              categoryId: 'makan',
              name: 'Roti bakar',
              stockQty: 0,
              stockStatus: api.StockStatus.out_,
            ),
          ],
        ),
      ),
    );

    expect(find.text('Tersedia 3'), findsOneWidget);
    expect(find.text('Selalu tersedia'), findsOneWidget);
    expect(find.text('Tersedia 1'), findsOneWidget);
    expect(find.text('Stok menipis'), findsOneWidget);
    expect(find.text('Habis'), findsOneWidget);

    await addMenu(tester, 'Roti bakar');
    expect(find.text('Lihat pesanan'), findsNothing);
    expect(find.text('1 di pesanan'), findsNothing);
  });

  testWidgets('narrows the menus by category and by search', (tester) async {
    await openCashier(tester);

    // The row of tiles scrolls on its own.
    await tester.ensureVisible(find.text('Makanan'));
    await tester.tap(find.text('Makanan'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(MenuCard, 'Roti bakar'), findsOneWidget);
    expect(find.widgetWithText(MenuCard, 'Kopi susu'), findsNothing);

    await tester.ensureVisible(find.text('Semua menu'));
    await tester.tap(find.text('Semua menu'));
    await tester.enterText(find.byType(TextField).first, 'teh-01');
    await tester.pumpAndSettle();
    expect(find.widgetWithText(MenuCard, 'Es teh'), findsOneWidget);
    expect(find.widgetWithText(MenuCard, 'Kopi susu'), findsNothing);

    await tester.enterText(find.byType(TextField).first, 'pizza');
    await tester.pumpAndSettle();
    expect(find.text('Tidak ada menu yang cocok.'), findsOneWidget);
  });

  testWidgets("turns a quick amount off when it doesn't cover the total", (
    tester,
  ) async {
    await openCashier(tester);
    // 54.000, service 2.700, tax 5.670.
    await addMenu(tester, 'Kopi susu', 3);
    await openPayment(tester, total: 62370);

    OutlinedButton quick(String label) =>
        tester.widget(find.widgetWithText(OutlinedButton, label));
    expect(quick(rp(50000)).onPressed, isNull);
    expect(quick(rp(100000)).onPressed, isNotNull);
    expect(quick('Uang pas').onPressed, isNotNull);
  });

  testWidgets("doesn't charge where the outlet takes no cash", (tester) async {
    await openCashier(
      tester,
      routes: tillRoutes(catalog: posCatalogJson(paymentMethods: const [])),
    );
    await addMenu(tester, 'Kopi susu');
    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();

    expect(
      find.text('Outlet ini sedang tidak menerima tunai.'),
      findsOneWidget,
    );
    final pay = find.widgetWithText(FilledButton, 'Bayar ${rp(20790)}');
    expect(tester.widget<FilledButton>(pay).onPressed, isNull);
  });

  testWidgets("keeps a snackbar off the order's pay button", (tester) async {
    await openCashier(tester);
    await addMenu(tester, 'Kopi susu');
    // Said at the till, and still showing as the order opens full screen.
    ScaffoldMessenger.of(tester.element(find.text('Lihat pesanan')))
        .showSnackBar(const SnackBar(content: Text('Meja A1 dikosongkan.')));
    await tester.pumpAndSettle();
    expect(find.text('Meja A1 dikosongkan.'), findsOneWidget);

    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();
    expect(find.text('Meja A1 dikosongkan.'), findsNothing);
    expect(
      find.widgetWithText(FilledButton, 'Bayar ${rp(20790)}').hitTestable(),
      findsOneWidget,
    );
  });

  testWidgets("doesn't charge an order past the server's limit", (
    tester,
  ) async {
    await openCashier(
      tester,
      routes: tillRoutes(
        catalog: posCatalogJson(
          menus: [
            posMenuJson(),
            posMenuJson(
              menuId: 'paket',
              name: 'Paket katering',
              price: 600000000,
              trackStock: false,
              stockQty: null,
              stockAlert: null,
              stockStatus: api.StockStatus.untracked,
            ),
          ],
        ),
      ),
    );
    await addMenu(tester, 'Paket katering', 2);
    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();

    expect(
      find.text('Total pesanan paling banyak ${rp(1000000000)}.'),
      findsOneWidget,
    );
    final pay = find.byWidgetPredicate(
      (w) =>
          w is FilledButton &&
          w.child is Text &&
          (w.child! as Text).data!.startsWith('Bayar '),
    );
    expect(tester.widget<FilledButton>(pay).onPressed, isNull);
  });

  testWidgets('keeps its layout with the system text 1.3× larger', (
    tester,
  ) async {
    await openCashier(
      tester,
      textScale: 1.3,
      routes: {'POST /api/v1/outlets/o1/orders': taken},
    );
    await addMenu(tester, 'Kopi susu');
    await addMenu(tester, 'Es teh');
    await openPayment(tester, total: 30030);
    await payExact(tester);
    await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
    // Any overflow above has already failed the test.
  });
}
