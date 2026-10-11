import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  group("today's orders", () {
    Map<String, ApiRoute> history({
      String locale = 'id',
      void Function()? onVoid,
    }) {
      var voided = false;
      return {
        ...tillRoutes(catalog: posCatalogJson(locale: locale)),
        'GET /api/v1/outlets/o1/orders': (_) => (
          200,
          orderListJson([orderSummaryJson(status: voided ? 'void' : 'paid')]),
        ),
        'GET /api/v1/outlets/o1/orders/ord1': (_) => (
          200,
          orderJson(
            status: voided ? 'void' : 'paid',
            voidReason: voided ? 'Salah input' : null,
          ),
        ),
        'POST /api/v1/outlets/o1/orders/ord1/void': (_) {
          voided = true;
          onVoid?.call();
          return (200, orderJson(status: 'void', voidReason: 'Salah input'));
        },
      };
    }

    for (final MapEntry(key: name, value: size) in testSizes.entries) {
      testWidgets('lists them, and voids one for a reason, on a $name', (
        tester,
      ) async {
        final app = await openCashier(
          tester,
          size: size,
          user: testManager(),
          routes: history(),
        );
        await tester.tap(find.text('Riwayat'));
        await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));

        expect(find.text('Lunas'), findsOneWidget);
        // 03:04 UTC is 10:04 in Bandung.
        expect(find.text('10.04 · 2 item · Budi'), findsOneWidget);
        expect(find.text(rp(41580)), findsOneWidget);

        await tester.tap(find.text('BDG01-K01-20261001-0005'));
        await pumpUntilFound(tester, find.text('Terima kasih'));
        expect(find.text('Detail transaksi'), findsOneWidget);

        await tester.tap(find.text('Void transaksi'));
        await tester.pumpAndSettle();
        expect(
          find.text('Void transaksi BDG01-K01-20261001-0005?'),
          findsOneWidget,
        );
        // A reason first.
        await tester.tap(find.widgetWithText(FilledButton, 'Void'));
        await tester.pumpAndSettle();
        expect(find.text('Wajib diisi.'), findsOneWidget);
        await tester.enterText(
          find.widgetWithText(TextField, 'Alasan'),
          '  Salah input ',
        );
        await tester.tap(find.widgetWithText(FilledButton, 'Void'));
        await pumpUntilFound(
          tester,
          find.text('Transaksi BDG01-K01-20261001-0005 sudah di-void.'),
        );

        final voiding = app.adapter.requests.singleWhere(
          (r) => r.uri.path.endsWith('/void'),
        );
        expect(bodyOf(voiding), {'reason': 'Salah input'});
        expect(find.text('VOID'), findsOneWidget);
        expect(find.text('Alasan: Salah input'), findsOneWidget);
        expect(find.text('Void transaksi'), findsNothing);
        // Its stock came back, so the catalog loads again.
        expect(
          callsTo(app, 'GET /api/v1/outlets/o1/pos/catalog'),
          greaterThanOrEqualTo(2),
        );

        // The list loads again, as it is now.
        await tester.tap(find.byType(BackButton));
        await pumpUntilFound(tester, find.text('Void'));
        expect(find.text('Lunas'), findsNothing);
      });
    }

    testWidgets("shows a receipt in the outlet's language", (tester) async {
      await openCashier(tester, routes: history(locale: 'en'));
      await tester.tap(find.text('Riwayat'));
      await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));
      await tester.tap(find.text('BDG01-K01-20261001-0005'));
      await pumpUntilFound(tester, find.text('Thank you'));

      expect(find.text('Receipt no.'), findsOneWidget);
      expect(find.text(formatRupiah(41580, 'en')), findsWidgets);
      expect(find.text('Oct 1, 2026 10:04'), findsOneWidget);
      // The screen stays in the user's language.
      expect(find.text('Detail transaksi'), findsOneWidget);
    });

    testWidgets("doesn't offer a void to a cashier who can't", (tester) async {
      await openCashier(tester, routes: history());
      await tester.tap(find.text('Riwayat'));
      await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));
      await tester.tap(find.text('BDG01-K01-20261001-0005'));
      await pumpUntilFound(tester, find.text('Terima kasih'));

      expect(find.text('Void transaksi'), findsNothing);
    });

    testWidgets('finds an order by part of its number', (tester) async {
      final app = await openCashier(tester, routes: history());
      await tester.tap(find.text('Riwayat'));
      await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));

      await tester.enterText(
        find.widgetWithText(TextField, 'Cari nomor struk'),
        ' 0005 ',
      );
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await pumpUntilFound(tester, find.text('BDG01-K01-20261001-0005'));

      final searched = app.adapter.requests.lastWhere(
        (r) => r.uri.path == '/api/v1/outlets/o1/orders',
      );
      expect(searched.queryParameters['q'], '0005');
    });

    testWidgets('says when there are none yet', (tester) async {
      await openCashier(
        tester,
        routes: {
          'GET /api/v1/outlets/o1/orders': (_) => (200, orderListJson([])),
        },
      );
      await tester.tap(find.text('Riwayat'));
      await pumpUntilFound(tester, find.text('Belum ada transaksi hari ini.'));
    });
  });

  group('the account', () {
    testWidgets("shows today at the outlet, whatever the phone's zone", (
      tester,
    ) async {
      // 20:00 UTC on 30 September is already 1 October in Bandung.
      await openCashier(tester, now: () => DateTime.utc(2026, 9, 30, 20));
      await tester.tap(find.text('Akun'));
      await pumpUntilFound(tester, find.text('Budi (@kasir1)'));

      expect(find.text('Maki Bandung'), findsOneWidget);
      expect(find.text('K01 · Kasir depan'), findsOneWidget);
      expect(find.text('1 Okt 2026'), findsOneWidget);
    });

    testWidgets('asks before signing out with an order being rung up', (
      tester,
    ) async {
      final app = await openCashier(tester);
      await addMenu(tester, 'Kopi susu');
      await tester.tap(find.text('Akun'));
      await pumpUntilFound(tester, find.text('Budi (@kasir1)'));

      await tester.tap(find.widgetWithText(OutlinedButton, 'Keluar'));
      await tester.pumpAndSettle();
      expect(find.text('Keluar dari kasir?'), findsOneWidget);
      await tester.tap(find.text('Batal'));
      await tester.pumpAndSettle();
      expect(app.session.accessToken, isNotNull);

      await tester.tap(find.widgetWithText(OutlinedButton, 'Keluar'));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(FilledButton, 'Keluar'));
      await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));
      expect(app.session.accessToken, isNull);
      // The phone stays one of the outlet's devices for the next cashier.
      expect(app.deviceStorage.token, 'device-1');
    });
  });
}
