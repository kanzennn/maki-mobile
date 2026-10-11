import 'dart:ui' show Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

const _floor = 'GET /api/v1/outlets/o1/pos/tables';
const _release = 'POST /api/v1/outlets/o1/tables/t-a2/release';

void main() {
  setUpAll(initializeTimeZones);

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    final phone = name == 'phone';

    group('tables at the till on a $name', () {
      Finder navigation() =>
          find.byType(phone ? NavigationBar : NavigationRail);
      Finder inNavigation(String label) =>
          find.descendant(of: navigation(), matching: find.text(label));

      Future<void> openTables(WidgetTester tester) async {
        await tester.tap(inNavigation('Meja'));
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Meja'), findsOneWidget);
      }

      Future<void> openOrder(WidgetTester tester) async {
        if (!phone) return;
        await tester.tap(find.text('Lihat pesanan'));
        await tester.pumpAndSettle();
      }

      Future<void> pickTable(WidgetTester tester, String label) async {
        await tester.tap(find.text('Pilih meja'));
        await tester.pumpAndSettle();
        expect(find.widgetWithText(AppBar, 'Pilih meja'), findsOneWidget);
        await tester.tap(find.bySemanticsLabel(label));
        await tester.pumpAndSettle();
      }

      testWidgets('are in the navigation only when the outlet has some', (
        tester,
      ) async {
        await openCashier(tester, size: size);
        expect(inNavigation('Meja'), findsNothing);
        expect(inNavigation('Riwayat'), findsOneWidget);
      });

      testWidgets(
        "show the floor and a table's detail, and release one after asking",
        (tester) async {
          var released = false;
          final app = await openCashier(
            tester,
            size: size,
            routes: {
              _floor: (_) => (200, floorJson()),
              _release: (_) {
                released = true;
                return (200, releasedTableJson('t-a2', 'A2'));
              },
            },
          );
          await openTables(tester);

          expect(
            find.textContaining('Pilih meja untuk melihat'),
            findsOneWidget,
          );
          expect(find.text('Keterangan:'), findsOneWidget);
          expect(find.widgetWithText(ChoiceChip, 'Indoor'), findsOneWidget);
          expect(find.bySemanticsLabel('Layout area Indoor'), findsOneWidget);
          // A3 isn't placed: it is listed under the layout.
          expect(find.text('Belum ditempatkan di layout:'), findsOneWidget);
          expect(find.bySemanticsLabel('Meja A3, Nonaktif'), findsOneWidget);
          // The layout pans and pinch-zooms where it doesn't fit; a tablet
          // shows it whole, on the screen.
          expect(
            find.byType(InteractiveViewer),
            phone ? findsOneWidget : findsNothing,
          );
          if (!phone) expectWhole(tester, size);

          final loads = callsTo(app, _floor);
          await tester.tap(find.bySemanticsLabel('Meja A2, Terisi, 2 kursi'));
          await tester.pumpAndSettle();
          expect(find.text('Meja A2'), findsOneWidget);
          expect(find.text('Terisi sejak'), findsOneWidget);
          expect(find.text('12.30'), findsOneWidget);
          expect(find.text('Transaksi'), findsOneWidget);

          await tester.tap(
            find.widgetWithText(OutlinedButton, 'Kosongkan Meja'),
          );
          await tester.pumpAndSettle();
          expect(find.text('Kosongkan meja A2?'), findsOneWidget);
          await tester.tap(find.widgetWithText(FilledButton, 'Kosongkan Meja'));
          await pumpUntilFound(tester, find.text('Meja A2 dikosongkan.'));

          expect(released, isTrue);
          expect(callsTo(app, _floor), greaterThan(loads));

          // Its word stays on the tables' page: at the till it would sit
          // where the order's pay button is.
          await tester.tap(inNavigation('Kasir'));
          await tester.pumpAndSettle();
          expect(find.text('Meja A2 dikosongkan.'), findsNothing);
        },
      );

      testWidgets('order at a table from its detail', (tester) async {
        await openCashier(
          tester,
          size: size,
          routes: {_floor: (_) => (200, floorJson())},
        );
        // A takeaway so far.
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await tester.tap(find.text('Takeaway'));
        await tester.pumpAndSettle();
        if (phone) {
          await tester.binding.handlePopRoute();
          await tester.pumpAndSettle();
        }
        await openTables(tester);
        await tester.tap(find.widgetWithText(ChoiceChip, 'Teras'));
        await tester.pumpAndSettle();
        await tester.tap(
          find.bySemanticsLabel('Meja T1, Nonaktif terjadwal, 6 kursi'),
        );
        await tester.pumpAndSettle();
        expect(
          find.textContaining('nonaktif terjadwal, jadi tidak bisa'),
          findsOneWidget,
        );
        expect(find.text('Pesan di meja ini'), findsNothing);
        expect(find.text('Kosongkan Meja'), findsNothing);
        Navigator.of(tester.element(find.text('Meja T1'))).pop();
        await tester.pumpAndSettle();

        await tester.tap(find.bySemanticsLabel('Meja T2, Tersedia, 4 kursi'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Pesan di meja ini'));
        await tester.pumpAndSettle();

        await openOrder(tester);
        expect(find.text('Meja T2'), findsOneWidget);
        // The picker opens on T2's area.
        await tester.tap(find.text('Ganti'));
        await tester.pumpAndSettle();
        expect(
          tester
              .widget<ChoiceChip>(find.widgetWithText(ChoiceChip, 'Teras'))
              .selected,
          isTrue,
        );
        // T1 is scheduled off: no button to pick it.
        final t1 = tester.getSemantics(
          find.bySemanticsLabel('Meja T1, Nonaktif terjadwal, 6 kursi'),
        );
        expect(t1.flagsCollection.isEnabled, Tristate.isFalse);
      });

      testWidgets('seat a dine-in order picked from Detail Items, '
          'and the receipt says which', (tester) async {
        final app = await openCashier(
          tester,
          size: size,
          routes: {
            _floor: (_) => (200, floorJson()),
            'POST /api/v1/outlets/o1/orders': taken,
          },
        );
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await tester.tap(find.text('Pilih meja'));
        await tester.pumpAndSettle();
        // A tablet's dialog shows the layout whole too.
        if (!phone) expectWhole(tester, size);
        // Off tables aren't to be picked; an occupied one is.
        final off = tester.getSemantics(
          find.bySemanticsLabel('Meja A3, Nonaktif'),
        );
        expect(off.flagsCollection.isEnabled, Tristate.isFalse);
        await tester.tap(find.bySemanticsLabel('Meja A2, Terisi, 2 kursi'));
        await tester.pumpAndSettle();
        expect(find.text('Meja A2'), findsOneWidget);

        await tester.tap(find.text('Ganti'));
        await tester.pumpAndSettle();
        await tester.tap(find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'));
        await tester.pumpAndSettle();
        expect(find.text('Meja A1'), findsOneWidget);

        final loads = callsTo(app, _floor);
        await openPayment(tester, total: 20790, phone: false);
        await payExact(tester);
        await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
        expect(callsTo(app, _floor), greaterThan(loads));

        expect(
          find.descendant(of: find.byType(Dialog), matching: find.text('Meja')),
          findsOneWidget,
        );
        expect(
          find.descendant(of: find.byType(Dialog), matching: find.text('A1')),
          findsOneWidget,
        );
        final sent = ordersSent(app).single! as Map<String, dynamic>;
        expect(sent['table_id'], 't-a1');
      });

      testWidgets('let the table go with a takeaway, for good', (tester) async {
        final app = await openCashier(
          tester,
          size: size,
          routes: {
            _floor: (_) => (200, floorJson()),
            'POST /api/v1/outlets/o1/orders': taken,
          },
        );
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await pickTable(tester, 'Meja A1, Tersedia, 4 kursi');
        await tester.tap(find.byTooltip('Lepas meja A1'));
        await tester.pumpAndSettle();
        expect(find.text('Pilih meja'), findsOneWidget);

        await pickTable(tester, 'Meja A1, Tersedia, 4 kursi');
        await tester.tap(find.text('Takeaway'));
        await tester.pumpAndSettle();
        expect(find.text('Pilih meja'), findsNothing);
        expect(find.text('Meja A1'), findsNothing);
        await tester.tap(find.text('Dine-in'));
        await tester.pumpAndSettle();
        expect(find.text('Pilih meja'), findsOneWidget);

        await tester.tap(find.text('Takeaway'));
        await tester.pumpAndSettle();
        await openPayment(tester, total: 20790, phone: false);
        await payExact(tester);
        await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
        final sent = ordersSent(app).single! as Map<String, dynamic>;
        expect(sent.containsKey('table_id'), isFalse);
      });

      testWidgets('take the table off when the sale refuses it, saying why', (
        tester,
      ) async {
        final app = await openCashier(
          tester,
          size: size,
          routes: {
            _floor: (_) => (200, floorJson()),
            'POST /api/v1/outlets/o1/orders': (_) =>
                apiError(409, 'table_unavailable', {'status': 'inactive'}),
          },
        );
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await pickTable(tester, 'Meja A1, Tersedia, 4 kursi');
        final loads = callsTo(app, _floor);
        await openPayment(tester, total: 20790, phone: false);
        await payExact(tester);
        await pumpUntilFound(
          tester,
          find.text(
            'Meja A1 dilepas dari pesanan: mejanya sedang dinonaktifkan.',
          ),
        );

        expect(find.text('Pilih meja'), findsOneWidget);
        expect(callsTo(app, _floor), greaterThan(loads));
      });
    });
  }

  testWidgets("won't order at a table while the last sale has no answer", (
    tester,
  ) async {
    await openCashier(
      tester,
      routes: {
        _floor: (_) => (200, floorJson()),
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
    // Off the payment and the order, to the tables.
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Meja'),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<FilledButton>(
            find.widgetWithText(FilledButton, 'Pesan di meja ini'),
          )
          .onPressed,
      isNull,
    );
    expect(
      find.textContaining('Transaksi sebelumnya belum terjawab'),
      findsOneWidget,
    );
  });

  testWidgets("today's orders say each one's table", (tester) async {
    await openCashier(
      tester,
      routes: {
        'GET /api/v1/outlets/o1/orders': (_) =>
            (200, orderListJson([orderSummaryJson(tableName: 'A1')])),
      },
    );
    await tester.tap(find.text('Riwayat'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Meja A1'), findsOneWidget);
  });

  testWidgets('pans the layout where even a wide screen has no room for it', (
    tester,
  ) async {
    // Wide, but too short to show it whole at a cell of 12dp.
    await openCashier(
      tester,
      size: const Size(1280, 480),
      routes: {_floor: (_) => (200, floorJson())},
    );
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationRail),
        matching: find.text('Meja'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(InteractiveViewer), findsOneWidget);
  });
}

/// The area's layout shows whole: on the screen, in its 48 × 32 shape.
void expectWhole(WidgetTester tester, Size screen) {
  final layout = tester.getRect(find.bySemanticsLabel('Layout area Indoor'));
  expect(layout.top, greaterThanOrEqualTo(0));
  expect(layout.bottom, lessThanOrEqualTo(screen.height));
  expect(layout.right, lessThanOrEqualTo(screen.width));
  expect(layout.width / layout.height, closeTo(48 / 32, 0.01));
}
