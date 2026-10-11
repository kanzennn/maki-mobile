import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pump.dart';

const _validate = 'POST /api/v1/outlets/o1/vouchers/validate';

void main() {
  setUpAll(initializeTimeZones);

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    final phone = name == 'phone';

    group('a voucher at the till on a $name', () {
      Future<void> openOrder(WidgetTester tester) async {
        if (!phone) return;
        await tester.tap(find.text('Lihat pesanan'));
        await tester.pumpAndSettle();
      }

      testWidgets('works its discount out, and sells with it', (tester) async {
        final app = await openCashier(
          tester,
          size: size,
          routes: {
            _validate: validated,
            'POST /api/v1/outlets/o1/orders': taken,
          },
        );
        await addMenu(tester, 'Kopi susu', 3);
        await openOrder(tester);
        await applyVoucher(tester, 'merdeka17');

        expect(find.text('MERDEKA17'), findsOneWidget);
        expect(find.text('Diskon Merdeka'), findsOneWidget);
        expect(find.text('Potongan (MERDEKA17)'), findsOneWidget);
        expect(find.text('-${rp(6750)}'), findsOneWidget);
        // 54.000 - 6.750 + 2.363 + 4.961, in the payment too.
        await openPayment(tester, total: 54574, phone: false);
        expect(
          find.descendant(
            of: find.byType(Dialog),
            matching: find.text(rp(54574)),
          ),
          findsWidgets,
        );
        await payExact(tester);
        await pumpUntilFound(tester, find.text('Transaksi tersimpan'));

        expect(
          find.descendant(
            of: find.byType(Dialog),
            matching: find.text('Potongan (MERDEKA17)'),
          ),
          findsOneWidget,
        );
        final sent = ordersSent(app).single! as Map<String, dynamic>;
        expect(sent['voucher_code'], 'MERDEKA17');
        expect(sent['total'], 54574);
      });

      testWidgets("holds the payment short of the voucher's minimum spend", (
        tester,
      ) async {
        await openCashier(tester, size: size, routes: {_validate: validated});
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await applyVoucher(tester, 'MERDEKA17');

        expect(
          find.textContaining('Belanja minimal ${rp(50000)}'),
          findsOneWidget,
        );
        final pay = tester.widget<FilledButton>(
          find.widgetWithText(FilledButton, 'Bayar ${rp(20790)}'),
        );
        expect(pay.onPressed, isNull);
      });

      testWidgets('says why a code is refused', (tester) async {
        await openCashier(
          tester,
          size: size,
          routes: {_validate: (_) => apiError(409, 'voucher_expired')},
        );
        await addMenu(tester, 'Kopi susu');
        await openOrder(tester);
        await applyVoucher(tester, 'LEWAT');

        expect(find.text('Voucher ini sudah expired.'), findsOneWidget);
        expect(find.text('LEWAT'), findsOneWidget);
        // Pakai stays level with the field's box, the reason under it.
        expect(
          tester.getTopLeft(find.widgetWithText(OutlinedButton, 'Pakai')).dy,
          tester.getTopLeft(find.widgetWithText(TextField, 'Voucher')).dy,
        );
      });

      testWidgets('comes off when the sale refuses it, saying why', (
        tester,
      ) async {
        await openCashier(
          tester,
          size: size,
          routes: {
            _validate: validated,
            'POST /api/v1/outlets/o1/orders': (_) =>
                apiError(409, 'voucher_used_up'),
          },
        );
        await addMenu(tester, 'Kopi susu', 3);
        await openOrder(tester);
        await applyVoucher(tester, 'MERDEKA17');
        await openPayment(tester, total: 54574, phone: false);
        await payExact(tester);
        await pumpUntilFound(
          tester,
          find.textContaining('Voucher MERDEKA17 dilepas'),
        );

        expect(find.text('Potongan (MERDEKA17)'), findsNothing);
        expect(find.widgetWithText(TextField, 'Voucher'), findsOneWidget);
        expect(
          find.widgetWithText(FilledButton, 'Bayar ${rp(62370)}'),
          findsOneWidget,
        );
      });

      testWidgets('can be taken off by hand', (tester) async {
        await openCashier(tester, size: size, routes: {_validate: validated});
        await addMenu(tester, 'Kopi susu', 3);
        await openOrder(tester);
        await applyVoucher(tester, 'MERDEKA17');
        await tester.tap(find.byTooltip('Lepas voucher MERDEKA17'));
        await tester.pumpAndSettle();

        expect(find.text('MERDEKA17'), findsNothing);
        expect(
          find.widgetWithText(FilledButton, 'Bayar ${rp(62370)}'),
          findsOneWidget,
        );
      });
    });
  }
}
