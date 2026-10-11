import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../helpers/app.dart';
import '../helpers/fakes.dart';
import '../helpers/pos.dart';
import '../helpers/pump.dart';

void main() {
  // The cashier shows today's date in the outlet's time zone.
  setUpAll(initializeTimeZones);

  for (final MapEntry(key: name, value: size) in testSizes.entries) {
    group('on a $name', () {
      testWidgets('sends a signed-out user to the sign-in screen', (
        tester,
      ) async {
        await pumpApp(tester, size: size);

        expect(find.widgetWithText(FilledButton, 'Masuk'), findsOneWidget);
      });

      testWidgets('opens the cashier with the session of a previous launch', (
        tester,
      ) async {
        await pumpApp(
          tester,
          size: size,
          savedRefreshToken: 'saved',
          deviceToken: 'device-1',
          routes: {
            'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
            ...tillRoutes(),
          },
        );
        await pumpUntilFound(tester, find.text('Kopi susu'));

        expect(find.text('Kasir'), findsOneWidget);
        expect(find.text('Kopi susu'), findsOneWidget);
      });

      testWidgets('signs out from the cashier', (tester) async {
        final app = await pumpApp(
          tester,
          size: size,
          savedRefreshToken: 'saved',
          deviceToken: 'device-1',
          routes: {
            'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
            'POST /api/v1/auth/logout': (_) => (204, null),
            ...tillRoutes(),
          },
        );

        await tester.tap(find.text('Akun'));
        await pumpUntilFound(tester, find.text('Budi (@kasir1)'));
        await tester.tap(find.text('Keluar'));
        await pumpUntilFound(
          tester,
          find.widgetWithText(FilledButton, 'Masuk'),
        );

        expect(find.widgetWithText(FilledButton, 'Masuk'), findsOneWidget);
        expect(app.adapter.calls, contains('POST /api/v1/auth/logout'));
        expect(app.session.accessToken, isNull);
      });
    });
  }
}
