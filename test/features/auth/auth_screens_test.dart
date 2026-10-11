import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/core/utils/time.dart';

import '../../helpers/app.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pump.dart';

void main() {
  // The cashier shows today's date in the outlet's time zone.
  setUpAll(initializeTimeZones);

  Finder field(String label) => find.widgetWithText(TextFormField, label);

  Future<void> signIn(
    WidgetTester tester,
    String username,
    String password,
  ) async {
    await tester.enterText(field('Username'), username);
    await tester.enterText(field('Password'), password);
    await tester.tap(find.widgetWithText(FilledButton, 'Masuk'));
  }

  testWidgets('signs in as the Android app and opens the cashier', (
    tester,
  ) async {
    final app = await pumpApp(
      tester,
      routes: {'POST /api/v1/auth/login': (_) => (200, sessionJson())},
    );

    await signIn(tester, ' kasir1 ', 'kopi susu 123');
    await pumpUntilFound(tester, find.text('Kasir'));

    expect(find.text('Kasir'), findsOneWidget);
    // The generated client sends the body already encoded.
    final body = app.adapter.requests
        .singleWhere((r) => r.uri.path == '/api/v1/auth/login')
        .data;
    expect(body is String ? jsonDecode(body) : body, {
      'username': 'kasir1',
      'password': 'kopi susu 123',
      'client': 'mobile',
    });
    expect(app.tokens.refreshToken, 'refresh-1');
    expect(app.session.accessToken, 'access-1');
  });

  testWidgets('shows why sign-in failed and clears the password', (
    tester,
  ) async {
    await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) => apiError(401, 'invalid_credentials'),
      },
    );

    await signIn(tester, 'kasir1', 'salah');
    await pumpUntilFound(tester, find.text('Username atau password salah.'));

    expect(find.text('Username atau password salah.'), findsOneWidget);
    final password = tester.widget<TextFormField>(field('Password'));
    expect(password.controller?.text, isEmpty);
  });

  testWidgets('says how long to wait when rate limited', (tester) async {
    await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            apiError(429, 'rate_limited', {'retry_after': 600}),
      },
    );

    await signIn(tester, 'kasir1', 'salah');
    final waitMessage = find.text(
      'Terlalu banyak percobaan. Coba lagi dalam 10 menit.',
    );
    await pumpUntilFound(tester, waitMessage);

    expect(waitMessage, findsOneWidget);
  });

  testWidgets('checks the fields before calling the server', (tester) async {
    final app = await pumpApp(tester);

    await tester.tap(find.widgetWithText(FilledButton, 'Masuk'));
    await tester.pumpAndSettle();

    expect(find.text('Wajib diisi.'), findsNWidgets(2));
    expect(app.adapter.requests, isEmpty);
  });

  testWidgets('holds a user with a temporary password until they change it', (
    tester,
  ) async {
    final app = await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            (200, sessionJson(user: testUser(mustChangePassword: true))),
        'PUT /api/v1/me/password': (_) => (204, null),
        'GET /api/v1/me': (_) => (200, testUser().toJson()),
      },
    );

    await signIn(tester, 'kasir1', 'sandi sementara');
    await pumpUntilFound(tester, find.text('Ganti password'));
    expect(find.text('Ganti password'), findsOneWidget);
    expect(
      find.textContaining('Password Anda dibuat oleh orang lain'),
      findsOneWidget,
    );

    await tester.enterText(field('Password saat ini'), 'sandi sementara');
    await tester.enterText(field('Password baru'), 'sandi pilihan sendiri');
    await tester.enterText(
      field('Ulangi password baru'),
      'sandi pilihan sendiri',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Simpan password'));
    await pumpUntilFound(tester, find.text('Kasir'));

    expect(find.text('Kasir'), findsOneWidget);
    expect(app.session.user?.mustChangePassword, isFalse);
    expect(
      app.adapter.calls,
      containsAllInOrder(['PUT /api/v1/me/password', 'GET /api/v1/me']),
    );
  });

  testWidgets('lets a held user sign out instead', (tester) async {
    final app = await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            (200, sessionJson(user: testUser(mustChangePassword: true))),
        'POST /api/v1/auth/logout': (_) => (204, null),
      },
    );
    await signIn(tester, 'kasir1', 'sandi sementara');
    await pumpUntilFound(tester, find.text('Ganti password'));

    await tester.tap(find.byTooltip('Keluar'));
    await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));

    expect(app.adapter.calls, contains('POST /api/v1/auth/logout'));
    expect(app.session.accessToken, isNull);
  });

  testWidgets('checks the new password twice before sending', (tester) async {
    final app = await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            (200, sessionJson(user: testUser(mustChangePassword: true))),
      },
    );
    await signIn(tester, 'kasir1', 'sandi sementara');
    await pumpUntilFound(tester, find.text('Ganti password'));

    await tester.enterText(field('Password saat ini'), 'sandi sementara');
    await tester.enterText(field('Password baru'), 'pendek');
    await tester.enterText(field('Ulangi password baru'), 'lain');
    await tester.tap(find.widgetWithText(FilledButton, 'Simpan password'));
    await tester.pumpAndSettle();

    expect(find.text('Minimal 8 karakter.'), findsWidgets);
    expect(find.text('Password tidak sama.'), findsOneWidget);
    expect(app.adapter.calls, isNot(contains('PUT /api/v1/me/password')));
  });

  testWidgets('shows a wrong current password', (tester) async {
    await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            (200, sessionJson(user: testUser(mustChangePassword: true))),
        'PUT /api/v1/me/password': (_) => apiError(422, 'wrong_password'),
      },
    );
    await signIn(tester, 'kasir1', 'sandi sementara');
    await pumpUntilFound(tester, find.text('Ganti password'));

    await tester.enterText(field('Password saat ini'), 'salah');
    await tester.enterText(field('Password baru'), 'sandi pilihan sendiri');
    await tester.enterText(
      field('Ulangi password baru'),
      'sandi pilihan sendiri',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Simpan password'));
    await pumpUntilFound(tester, find.text('Password saat ini salah.'));

    expect(find.text('Password saat ini salah.'), findsOneWidget);
  });

  testWidgets('explains a sign-out after the phone was revoked', (
    tester,
  ) async {
    final app = await pumpApp(
      tester,
      savedRefreshToken: 'saved',
      routes: {
        'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
        'POST /api/v1/auth/logout': (_) => (204, null),
      },
    );

    await tester.runAsync(
      () => app.session.signOut(reason: SignOutReason.deviceRevoked),
    );
    await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));

    expect(find.textContaining('Perangkat ini sudah dicabut'), findsOneWidget);
  });

  testWidgets("doesn't explain a sign-out the user asked for", (tester) async {
    final app = await pumpApp(
      tester,
      savedRefreshToken: 'saved',
      routes: {
        'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
        'POST /api/v1/auth/logout': (_) => (204, null),
      },
    );

    await tester.runAsync(app.session.signOut);
    await pumpUntilFound(tester, find.widgetWithText(FilledButton, 'Masuk'));

    expect(find.textContaining('Perangkat ini sudah dicabut'), findsNothing);
  });

  testWidgets('follows the language set on the account once signed in', (
    tester,
  ) async {
    await pumpApp(
      tester,
      routes: {
        'POST /api/v1/auth/login': (_) =>
            (200, sessionJson(user: testUser(language: 'en'))),
      },
    );

    await signIn(tester, 'kasir1', 'kopi susu 123');
    await pumpUntilFound(tester, find.text('Cashier'));

    expect(find.text('Cashier'), findsOneWidget);
  });
}
