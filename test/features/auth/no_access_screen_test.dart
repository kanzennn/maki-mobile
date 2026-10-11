import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  // Staff whose role lets them see tables, but not check out.
  final waiter = sessionJson(user: testUser(permissions: const ['table.view']));

  testWidgets('tells staff who may not check out, and lets them sign out', (
    tester,
  ) async {
    final app = await pumpApp(
      tester,
      savedRefreshToken: 'saved',
      routes: {
        'POST /api/v1/auth/refresh': (_) => (200, waiter),
        'POST /api/v1/auth/logout': (_) => (204, null),
      },
    );

    expect(find.text('Belum ada akses kasir'), findsOneWidget);
    expect(find.textContaining('Role Anda di Maki Bandung'), findsOneWidget);
    expect(find.text('Masuk sebagai Budi (@kasir1)'), findsOneWidget);
    expect(find.text('Kasir'), findsNothing);

    await tester.tap(find.widgetWithText(FilledButton, 'Keluar'));
    await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));

    expect(app.adapter.calls, contains('POST /api/v1/auth/logout'));
    expect(app.session.accessToken, isNull);
  });

  testWidgets('opens the cashier once their role allows it', (tester) async {
    var allowed = false;
    await pumpApp(
      tester,
      savedRefreshToken: 'saved',
      routes: {
        'POST /api/v1/auth/refresh': (_) =>
            (200, allowed ? sessionJson() : waiter),
      },
    );

    await tester.tap(find.widgetWithText(OutlinedButton, 'Periksa lagi'));
    await pumpUntilFound(tester, find.text('Akses Anda belum berubah.'));

    // The Manager gives their role checkout.create.
    allowed = true;
    await tester.tap(find.widgetWithText(OutlinedButton, 'Periksa lagi'));
    await pumpUntilFound(tester, find.text('Kasir'));

    expect(find.text('Belum ada akses kasir'), findsNothing);
  });

  testWidgets('sends the Owner to the web admin', (tester) async {
    await pumpApp(
      tester,
      savedRefreshToken: 'saved',
      routes: {
        'POST /api/v1/auth/refresh': (_) =>
            (200, sessionJson(user: testOwnerMe())),
      },
    );

    expect(find.text('Aplikasi ini untuk kasir'), findsOneWidget);
    expect(find.textContaining('web admin Maki'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Periksa lagi'), findsNothing);
    expect(find.widgetWithText(FilledButton, 'Keluar'), findsOneWidget);
  });
}
