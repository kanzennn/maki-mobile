import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  group('charging without charging twice', () {
    testWidgets('sends an order with no answer again, exactly as it was', (
      tester,
    ) async {
      var answering = false;
      final app = await openCashier(
        tester,
        routes: {
          'POST /api/v1/outlets/o1/orders': (request) {
            if (!answering) throw const SocketException('no answer');
            return taken(request);
          },
        },
      );
      await addMenu(tester, 'Kopi susu');
      await openPayment(tester, total: 20790);
      await payExact(tester);

      // By itself twice, then it waits for the cashier.
      await pumpUntilFound(
        tester,
        find.textContaining('Server belum menjawab'),
        timeout: const Duration(seconds: 10),
      );
      expect(ordersSent(app), hasLength(3));

      answering = true;
      // The dialog's: the order behind it offers to send it again too.
      await tester.tap(
        find.descendant(
          of: find.byType(Dialog),
          matching: find.widgetWithText(FilledButton, 'Kirim ulang'),
        ),
      );
      await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

      final sent = ordersSent(app);
      expect(sent, hasLength(4));
      for (final order in sent) {
        expect(order, sent.first);
      }
    });

    testWidgets('keeps the cart locked until the sale is settled', (
      tester,
    ) async {
      final app = await openCashier(
        tester,
        routes: {
          'POST /api/v1/outlets/o1/orders': (_) => apiError(503, 'not_ready'),
        },
      );
      await addMenu(tester, 'Kopi susu');
      await openPayment(tester, total: 20790);
      await payExact(tester);
      await pumpUntilFound(
        tester,
        find.textContaining('Server belum menjawab'),
        timeout: const Duration(seconds: 10),
      );
      expect(ordersSent(app), hasLength(3));

      // Back on the order: it can't change, and it can be sent again.
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Transaksi sebelumnya belum terjawab'),
        findsOneWidget,
      );
      expect(
        tester
            .widget<IconButton>(
              find.widgetWithIcon(IconButton, Icons.add).first,
            )
            .onPressed,
        isNull,
      );

      // Sent again from the order: the very same, by itself twice more.
      await tester.tap(find.widgetWithText(FilledButton, 'Kirim ulang'));
      final abandon = find.widgetWithText(
        OutlinedButton,
        'Batalkan transaksi ini',
      );
      await pumpUntilFound(tester, abandon);
      await pumpUntil(
        tester,
        () => tester.widget<OutlinedButton>(abandon).onPressed != null,
      );
      final sent = ordersSent(app);
      expect(sent, hasLength(6));
      for (final order in sent) {
        expect(order, sent.first);
      }

      // Let go of: the cart can change again, with a warning.
      await tester.tap(abandon);
      await tester.pumpAndSettle();
      expect(find.byType(Dialog), findsNothing);
      expect(
        find.textContaining('Periksa Riwayat sebelum menagih lagi'),
        findsWidgets,
      );
      expect(
        tester
            .widget<IconButton>(
              find.widgetWithIcon(IconButton, Icons.add).first,
            )
            .onPressed,
        isNotNull,
      );
    });

    testWidgets('renumbers a taken receipt number under the same ID', (
      tester,
    ) async {
      var refused = false;
      final app = await openCashier(
        tester,
        routes: {
          'GET /api/v1/outlets/o1/pos/device': (_) =>
              (200, posDeviceJson(nextNumber: refused ? 9 : 5)),
          'POST /api/v1/outlets/o1/orders': (request) {
            if (!refused) {
              refused = true;
              return apiError(409, 'order_no_taken');
            }
            return taken(request);
          },
        },
      );
      await addMenu(tester, 'Kopi susu');
      await openPayment(tester, total: 20790);
      await payExact(tester);
      await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

      final [first, second] = ordersSent(app).cast<Map<String, dynamic>>();
      expect(first['order_no'], 'BDG01-K01-20261001-0005');
      expect(second['order_no'], 'BDG01-K01-20261001-0009');
      expect(second['order_id'], first['order_id']);
      expect(find.text('BDG01-K01-20261001-0009'), findsOneWidget);
    });

    testWidgets('says what changed when a price did, and charges the new one', (
      tester,
    ) async {
      var price = 18000;
      await openCashier(
        tester,
        routes: {
          'GET /api/v1/outlets/o1/pos/catalog': (_) =>
              (200, posCatalogJson(menus: [posMenuJson(price: price)])),
          'POST /api/v1/outlets/o1/orders': (_) {
            price = 20000;
            return apiError(409, 'prices_changed', {
              'menus': [
                {'menu_id': 'kopi', 'price': 20000},
              ],
            });
          },
        },
      );
      await addMenu(tester, 'Kopi susu');
      await openPayment(tester, total: 20790);
      await payExact(tester);

      await pumpUntilFound(tester, find.text('Harga Kopi susu berubah.'));
      expect(find.text('Bayar tunai'), findsNothing);
      expect(
        find.text('Periksa pesanan dan totalnya, lalu tagih lagi.'),
        findsOneWidget,
      );
      // 20.000, service 1.000, tax 2.100.
      expect(
        find.widgetWithText(FilledButton, 'Bayar ${rp(23100)}'),
        findsOneWidget,
      );
    });

    testWidgets('follows the stock when the catalog loads again', (
      tester,
    ) async {
      var stock = 3;
      await openCashier(
        tester,
        routes: {
          'GET /api/v1/outlets/o1/pos/catalog': (_) =>
              (200, posCatalogJson(menus: [posMenuJson(stockQty: stock)])),
        },
      );
      await addMenu(tester, 'Kopi susu', 3);
      expect(find.text('3 di pesanan'), findsOneWidget);

      // Another cashier sold two meanwhile; the catalog loads every 30 s.
      stock = 1;
      await tester.pump(const Duration(seconds: 30));
      await pumpUntilFound(
        tester,
        find.text(
          'Stok Kopi susu tidak cukup lagi, jadi jumlahnya disesuaikan.',
        ),
      );
      expect(find.text('1 di pesanan'), findsOneWidget);

      await tester.tap(find.byTooltip('Tutup'));
      await tester.pumpAndSettle();
      expect(find.textContaining('tidak cukup lagi'), findsNothing);
    });

    testWidgets('signs a revoked phone out, and says why', (tester) async {
      final app = await openCashier(
        tester,
        routes: {
          'POST /api/v1/outlets/o1/orders': (_) =>
              apiError(403, 'device_revoked'),
        },
      );
      await addMenu(tester, 'Kopi susu');
      await openPayment(tester, total: 20790);
      await payExact(tester);

      await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));
      expect(
        find.textContaining('Perangkat ini sudah dicabut'),
        findsOneWidget,
      );
      expect(app.deviceStorage.token, isNull);
      expect(app.tokens.refreshToken, isNull);
    });
  });
}
