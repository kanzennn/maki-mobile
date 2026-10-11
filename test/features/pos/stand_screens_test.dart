import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

const _catalog = 'GET /api/v1/outlets/o1/pos/catalog';
const _floor = 'GET /api/v1/outlets/o1/pos/tables';
const _orders = 'POST /api/v1/outlets/o1/orders';

void main() {
  setUpAll(initializeTimeZones);

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    final phone = name == 'phone';

    group('number stands at the till on a $name', () {
      Finder standField() => find.widgetWithText(TextField, 'Nomor papan');
      Finder payButton() =>
          find.widgetWithText(FilledButton, 'Bayar ${rp(20790)}');
      bool payable(WidgetTester tester) =>
          tester.widget<FilledButton>(payButton()).onPressed != null;

      Future<void> openOrder(WidgetTester tester) async {
        if (!phone) return;
        await tester.tap(find.text('Lihat pesanan'));
        await tester.pumpAndSettle();
      }

      /// The outlet seats its customers the way [mode] says, and the server
      /// takes what [orders] does; the tables the floor has where it seats
      /// them at tables.
      Map<String, ApiRoute> outlet(
        String Function() mode, {
        ApiRoute orders = taken,
      }) => {
        _catalog: (_) => (200, posCatalogJson(dineInMode: mode())),
        _floor: (_) =>
            (200, mode() == 'table' ? floorJson() : floorJson(areas: [])),
        _orders: orders,
      };

      testWidgets(
        "ask a dine-in order for its stand's number, which the receipt shows",
        (tester) async {
          final app = await openCashier(
            tester,
            size: size,
            routes: outlet(() => 'number'),
          );
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);

          expect(find.text('Pilih meja'), findsNothing);
          expect(standField(), findsOneWidget);
          expect(
            find.text(
              'Wajib untuk dine-in: nomor yang tertulis di papan tamu.',
            ),
            findsOneWidget,
          );
          expect(payable(tester), isFalse);

          await tester.enterText(standField(), ' a5 ');
          await tester.pump();
          // Shown in capitals as typed, as it is kept.
          expect(
            tester.widget<TextField>(standField()).controller!.text,
            ' A5 ',
          );
          expect(payable(tester), isTrue);
          await openPayment(tester, total: 20790, phone: false);
          await payExact(tester);
          await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

          final receipt = find.byType(Dialog);
          expect(
            find.descendant(of: receipt, matching: find.text('Nomor papan')),
            findsOneWidget,
          );
          expect(
            find.descendant(of: receipt, matching: find.text('A5')),
            findsOneWidget,
          );
          final sent = ordersSent(app).single! as Map<String, dynamic>;
          expect(sent['stand_number'], 'A5');
          expect(sent.containsKey('table_id'), isFalse);

          // The next customer's order starts without a number.
          await tester.tap(find.text('Transaksi baru'));
          await tester.pumpAndSettle();
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);
          expect(
            tester.widget<TextField>(standField()).controller!.text,
            isEmpty,
          );
          expect(payable(tester), isFalse);
        },
      );

      testWidgets(
        'say what the number takes once the cashier leaves the field, '
        'and keep none for a takeaway',
        (tester) async {
          final app = await openCashier(
            tester,
            size: size,
            routes: outlet(() => 'number'),
          );
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);

          const format =
              '1–10 huruf, angka atau tanda hubung, misalnya 12, A5 atau B-3.';
          await tester.enterText(standField(), 'B-');
          await tester.pump();
          expect(payable(tester), isFalse);
          expect(find.text(format), findsNothing);
          await tester.testTextInput.receiveAction(TextInputAction.done);
          await tester.pumpAndSettle();
          expect(find.text(format), findsOneWidget);
          // Ten characters at most, as the server takes: an eleventh
          // isn't taken.
          await tester.enterText(standField(), 'ABCDEFGHIJ');
          await tester.pump();
          await tester.enterText(standField(), 'ABCDEFGHIJK');
          await tester.pump();
          expect(
            tester.widget<TextField>(standField()).controller!.text,
            'ABCDEFGHIJ',
          );
          await tester.enterText(standField(), 'B-3');
          // The error fades out.
          await tester.pumpAndSettle();
          expect(find.text(format), findsNothing);
          expect(payable(tester), isTrue);

          // A takeaway has no stand, and keeps no number for when it's
          // dine-in again.
          await tester.tap(find.text('Takeaway'));
          await tester.pumpAndSettle();
          expect(standField(), findsNothing);
          expect(payable(tester), isTrue);
          await tester.tap(find.text('Dine-in'));
          await tester.pumpAndSettle();
          expect(
            tester.widget<TextField>(standField()).controller!.text,
            isEmpty,
          );
          expect(payable(tester), isFalse);

          await tester.tap(find.text('Takeaway'));
          await tester.pumpAndSettle();
          await openPayment(tester, total: 20790, phone: false);
          await payExact(tester);
          await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
          final sent = ordersSent(app).single! as Map<String, dynamic>;
          expect(sent['type'], 'takeaway');
          expect(sent.containsKey('stand_number'), isFalse);
        },
      );

      testWidgets(
        'take the table off when the sale is refused for number stands, '
        'and ask for the number',
        (tester) async {
          var mode = 'table';
          final app = await openCashier(
            tester,
            size: size,
            routes: outlet(
              () => mode,
              orders: (request) {
                final body = bodyOf(request)! as Map<String, dynamic>;
                if (body['stand_number'] != null) return taken(request);
                // The Manager changed the outlet's way meanwhile.
                mode = 'number';
                return apiError(409, 'dine_in_mode_changed', {
                  'mode': 'number',
                });
              },
            ),
          );
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);
          await tester.tap(find.text('Pilih meja'));
          await tester.pumpAndSettle();
          await tester.tap(find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'));
          await tester.pumpAndSettle();
          await openPayment(tester, total: 20790, phone: false);
          await payExact(tester);
          await pumpUntilFound(
            tester,
            find.text(
              'Outlet ini sekarang memakai Mode Nomor, jadi meja A1 dilepas '
              'dari pesanan. Isi nomor papan tamu.',
            ),
          );

          // The catalog loaded again says the outlet's way: no table to
          // pick, the number to type.
          await pumpUntilFound(tester, standField());
          expect(find.text('Meja A1'), findsNothing);
          expect(find.text('Pilih meja'), findsNothing);
          await tester.enterText(standField(), '12');
          await tester.pump();
          await openPayment(tester, total: 20790, phone: false);
          await payExact(tester);
          await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
          final sent = ordersSent(app).cast<Map<String, dynamic>>();
          expect(sent, hasLength(2));
          expect(sent.first['table_id'], 't-a1');
          expect(sent.last['stand_number'], '12');
          expect(sent.last.containsKey('table_id'), isFalse);
        },
      );

      testWidgets(
        "take the stand's number off when the sale is refused for tables",
        (tester) async {
          var mode = 'number';
          await openCashier(
            tester,
            size: size,
            routes: outlet(
              () => mode,
              orders: (_) {
                mode = 'table';
                return apiError(409, 'dine_in_mode_changed', {'mode': 'table'});
              },
            ),
          );
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);
          await tester.enterText(standField(), 'a5');
          await tester.pump();
          await openPayment(tester, total: 20790, phone: false);
          await payExact(tester);
          await pumpUntilFound(
            tester,
            find.text(
              'Outlet ini sekarang memakai Mode Meja, jadi nomor papan A5 '
              'dilepas dari pesanan.',
            ),
          );
          await pumpUntil(tester, () => standField().evaluate().isEmpty);
          expect(payable(tester), isTrue);
          // The floor loaded again has tables to pick.
          await pumpUntilFound(tester, find.text('Pilih meja'));
        },
      );

      testWidgets(
        'say on the Tables page that the outlet seats by number stands',
        (tester) async {
          // A floor loaded before the change still has tables: the catalog
          // says the way.
          await openCashier(
            tester,
            size: size,
            routes: {
              _catalog: (_) => (200, posCatalogJson(dineInMode: 'number')),
              _floor: (_) => (200, floorJson()),
            },
          );
          // Nor a table to pick in Detail Items: the stand's number instead.
          await addMenu(tester, 'Kopi susu');
          await openOrder(tester);
          expect(find.text('Pilih meja'), findsNothing);
          expect(standField(), findsOneWidget);
          if (phone) {
            await tester.binding.handlePopRoute();
            await tester.pumpAndSettle();
          }
          await tester.tap(
            find.descendant(
              of: find.byType(phone ? NavigationBar : NavigationRail),
              matching: find.text('Meja'),
            ),
          );
          await tester.pumpAndSettle();

          expect(
            find.textContaining('Outlet ini memakai Mode Nomor: tamu dine-in'),
            findsOneWidget,
          );
          expect(find.bySemanticsLabel('Layout area Indoor'), findsNothing);
          // Nor an intro that speaks of picking one.
          expect(find.textContaining('Pilih meja untuk melihat'), findsNothing);
        },
      );
    });
  }

  testWidgets("holds the stand's number of a sale with no answer yet, "
      'though the outlet turned to tables since', (tester) async {
    var mode = 'number';
    final app = await openCashier(
      tester,
      routes: {
        _catalog: (_) => (200, posCatalogJson(dineInMode: mode)),
        _floor: (_) => (200, floorJson(areas: [])),
        _orders: (_) => apiError(503, 'not_ready'),
      },
    );
    await addMenu(tester, 'Kopi susu');
    await tester.tap(find.text('Lihat pesanan'));
    await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextField, 'Nomor papan'), '12');
    await tester.pump();
    await openPayment(tester, total: 20790, phone: false);
    await payExact(tester);
    await pumpUntilFound(
      tester,
      find.textContaining('Server belum menjawab'),
      timeout: const Duration(seconds: 10),
    );
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    // The outlet turns to tables, and the catalog loads again on its half
    // minute: the sale goes again as it was sent.
    mode = 'table';
    final loads = callsTo(app, _catalog);
    await tester.pump(const Duration(seconds: 31));
    await tester.pumpAndSettle();
    expect(callsTo(app, _catalog), greaterThan(loads));
    final field = tester.widget<TextField>(
      find.widgetWithText(TextField, 'Nomor papan'),
    );
    expect(field.controller!.text, '12');
    expect(field.enabled, isFalse);
    expect(find.textContaining('dilepas dari pesanan'), findsNothing);
  });

  testWidgets("today's orders say each one's stand number", (tester) async {
    await openCashier(
      tester,
      routes: {
        'GET /api/v1/outlets/o1/orders': (_) =>
            (200, orderListJson([orderSummaryJson(standNumber: 'A5')])),
      },
    );
    await tester.tap(find.text('Riwayat'));
    await tester.pumpAndSettle();

    expect(find.textContaining('No. A5'), findsOneWidget);
  });
}
