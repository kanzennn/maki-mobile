import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/data/receipt_printer.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/pos.dart';
import '../../helpers/printer.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  const chosen = PrinterSettings(printer: testPrinter);

  Future<void> sell(WidgetTester tester, Size size) async {
    await addMenu(tester, 'Kopi susu');
    await openPayment(tester, total: 20790, phone: size == phoneSize);
    await payExact(tester);
    await pumpUntilFound(tester, find.text('Transaksi tersimpan'));
  }

  Map<String, ApiRoute> saleRoutes() => {
    'POST /api/v1/outlets/o1/orders': taken,
  };

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    group('after a sale on a $name', () {
      testWidgets('prints the receipt when asked', (tester) async {
        final printer = FakePrinter(settings: chosen);
        await openCashier(
          tester,
          size: size,
          printer: printer,
          routes: saleRoutes(),
        );
        await sell(tester, size);
        expect(printer.sent, isEmpty);

        await tester.ensureVisible(find.text('Cetak struk'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cetak struk'));
        await tester.pumpAndSettle();

        expect(printer.sent.single.$1, testPrinter.address);
        expect(
          ticketLines(printer.sent.single.$2).map((l) => l.trim()),
          contains('Terima kasih'),
        );
      });

      testWidgets('prints by itself, once, where the phone is set to', (
        tester,
      ) async {
        final printer = FakePrinter(
          settings: const PrinterSettings(
            printer: testPrinter,
            paper: PaperWidth.mm80,
            auto: true,
          ),
        );
        await openCashier(
          tester,
          size: size,
          printer: printer,
          routes: saleRoutes(),
        );
        await sell(tester, size);
        await tester.pumpAndSettle();

        expect(printer.sent, hasLength(1));
        final total = ticketLines(printer.sent.single.$2)
            .firstWhere((line) => line.startsWith('Total'));
        expect(total.length, PaperWidth.mm80.columns);
      });
    });
  }

  testWidgets('a failed print leaves the sale saved, and says why', (
    tester,
  ) async {
    final printer = FakePrinter(settings: chosen)
      ..sendProblem = PrinterProblem.connectFailed;
    await openCashier(tester, printer: printer, routes: saleRoutes());
    await sell(tester, phoneSize);

    await tester.ensureVisible(find.text('Cetak struk'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cetak struk'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Printer tidak menjawab'), findsOneWidget);
    expect(find.text('Transaksi tersimpan'), findsOneWidget);
    expect(find.text('Transaksi baru'), findsOneWidget);
  });

  testWidgets('without a printer it says where to choose one', (tester) async {
    final printer = FakePrinter();
    await openCashier(tester, printer: printer, routes: saleRoutes());
    await sell(tester, phoneSize);

    await tester.ensureVisible(find.text('Cetak struk'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cetak struk'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Belum ada printer'), findsOneWidget);
    expect(printer.sent, isEmpty);
  });

  testWidgets("doesn't print by itself without a printer", (tester) async {
    final printer = FakePrinter(settings: const PrinterSettings(auto: true));
    await openCashier(tester, printer: printer, routes: saleRoutes());
    await sell(tester, phoneSize);
    await tester.pumpAndSettle();

    expect(printer.sent, isEmpty);
    expect(find.textContaining('Belum ada printer'), findsNothing);
  });

  testWidgets('an order prints again from its page', (tester) async {
    final printer = FakePrinter(settings: chosen);
    await openCashier(
      tester,
      printer: printer,
      routes: {
        'GET /api/v1/outlets/o1/orders': (_) =>
            (200, orderListJson([orderSummaryJson()])),
        'GET /api/v1/outlets/o1/orders/ord1': (_) => (200, orderJson()),
      },
    );
    await tester.tap(find.text('Riwayat'));
    await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));
    await tester.tap(find.text('BDG01-K01-20261001-0005'));
    await pumpUntilFound(tester, find.text('Terima kasih'));

    await tester.ensureVisible(find.text('Cetak ulang'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cetak ulang'));
    await tester.pumpAndSettle();

    expect(printer.sent, hasLength(1));
    expect(
      ticketLines(printer.sent.single.$2),
      contains('BDG01-K01-20261001-0005'),
    );
  });

  group('the printer screen', () {
    Future<void> open(WidgetTester tester) async {
      await tester.tap(find.text('Akun'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Printer struk'));
      await tester.pumpAndSettle();
      expect(find.text('Muat ulang daftar'), findsOneWidget);
    }

    testWidgets('chooses a paired printer, its roll, and printing by itself', (
      tester,
    ) async {
      final printer = FakePrinter();
      await openCashier(tester, printer: printer);
      await tester.tap(find.text('Akun'));
      await tester.pumpAndSettle();
      expect(find.text('Belum dipilih'), findsOneWidget);
      await tester.tap(find.text('Printer struk'));
      await tester.pumpAndSettle();

      final test = find.widgetWithText(OutlinedButton, 'Cetak tes');
      expect(tester.widget<OutlinedButton>(test).onPressed, isNull);

      await tester.tap(find.text('RPP02N'));
      await tester.pumpAndSettle();
      expect(find.widgetWithIcon(ListTile, Icons.check), findsOneWidget);
      await tester.tap(find.text('80 mm'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(SwitchListTile));
      await tester.pumpAndSettle();

      expect(printer.settings.printer, testPrinter);
      expect(printer.settings.paper, PaperWidth.mm80);
      expect(printer.settings.auto, isTrue);

      await tester.tap(test);
      await tester.pumpAndSettle();
      expect(
        ticketLines(printer.sent.single.$2).first.trim(),
        'Tes printer Maki',
      );
      expect(find.textContaining('Tes terkirim'), findsOneWidget);
    });

    testWidgets('says when Bluetooth is off, and tries again', (tester) async {
      final printer = FakePrinter()..listProblem = PrinterProblem.bluetoothOff;
      await openCashier(tester, printer: printer);
      await open(tester);
      expect(find.textContaining('Bluetooth mati'), findsOneWidget);
      expect(find.text('RPP02N'), findsNothing);

      printer.listProblem = null;
      await tester.tap(find.text('Muat ulang daftar'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Bluetooth mati'), findsNothing);
      expect(find.text('RPP02N'), findsOneWidget);
    });

    testWidgets('says when the permission was refused', (tester) async {
      final printer = FakePrinter()
        ..listProblem = PrinterProblem.permissionDenied;
      await openCashier(tester, printer: printer);
      await open(tester);

      expect(find.textContaining('Izin Bluetooth ditolak'), findsOneWidget);
    });

    testWidgets('says when nothing is paired', (tester) async {
      final printer = FakePrinter(printers: const []);
      await openCashier(tester, printer: printer);
      await open(tester);

      expect(
        find.text('Belum ada perangkat yang dipasangkan.'),
        findsOneWidget,
      );
    });
  });
}
