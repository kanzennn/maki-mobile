import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/menu_browser.dart';

import '../../helpers/app.dart';
import '../../helpers/cashier.dart';
import '../../helpers/fakes.dart';
import '../../helpers/pos.dart';
import '../../helpers/pump.dart';

void main() {
  setUpAll(initializeTimeZones);

  group('a phone the outlet has not activated', () {
    Map<String, ApiRoute> unregistered({required bool activated}) => {
      'GET /api/v1/outlets/o1/pos/device': (_) => activated
          ? (200, posDeviceJson())
          : apiError(403, 'device_not_registered'),
    };

    testWidgets('tells a cashier who can activate it', (tester) async {
      await pumpApp(
        tester,
        savedRefreshToken: 'saved',
        routes: {
          'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
          ...tillRoutes(),
          ...unregistered(activated: false),
        },
      );
      await pumpUntilFound(tester, find.text('Perangkat ini belum terdaftar'));

      expect(
        find.textContaining('Minta Manager masuk di HP ini'),
        findsOneWidget,
      );
      expect(find.text('Aktifkan perangkat ini'), findsNothing);
    });

    for (final MapEntry(key: name, value: size) in testSizes.entries) {
      testWidgets(
        'lets the Manager activate it, then sells on it, on a $name',
        (tester) async {
          var activated = false;
          final app = await pumpApp(
            tester,
            size: size,
            savedRefreshToken: 'saved',
            routes: {
              'POST /api/v1/auth/refresh': (_) =>
                  (200, sessionJson(user: testManager())),
              ...tillRoutes(),
              'GET /api/v1/outlets/o1/pos/device': (_) => activated
                  ? (200, posDeviceJson())
                  : apiError(403, 'device_not_registered'),
              'POST /api/v1/outlets/o1/devices': (_) {
                activated = true;
                return (
                  201,
                  {
                    'device': {
                      'device_id': 'd1',
                      'code': 'K01',
                      'name': 'Kasir depan',
                      'platform': 'android',
                      'status': 'active',
                      'activated_by': {'user_id': 'u1', 'name': 'Budi'},
                      'activated_at': '2026-10-01T03:00:00Z',
                      'last_seen_at': null,
                      'revoked_at': null,
                      'revoked_by': null,
                    },
                    'token': 'fresh-device-token',
                  },
                );
              },
            },
          );
          await pumpUntilFound(tester, find.text('Aktifkan perangkat ini'));

          // A name first.
          await tester.tap(find.text('Aktifkan perangkat ini'));
          await tester.pumpAndSettle();
          expect(find.text('Wajib diisi.'), findsOneWidget);
          expect(
            app.adapter.calls,
            isNot(contains('POST /api/v1/outlets/o1/devices')),
          );

          await tester.enterText(
            find.widgetWithText(TextFormField, 'Nama perangkat'),
            '  Kasir depan ',
          );
          await tester.tap(find.text('Aktifkan perangkat ini'));
          await pumpUntilFound(
            tester,
            find.widgetWithText(MenuCard, 'Kopi susu'),
          );

          final activation = app.adapter.requests.singleWhere(
            (r) => r.uri.path == '/api/v1/outlets/o1/devices',
          );
          expect(bodyOf(activation), {
            'name': 'Kasir depan',
            'platform': 'android',
          });
          expect(app.deviceStorage.token, 'fresh-device-token');
          expect(
            app.adapter.requests.last.headers['X-Device-Token'],
            'fresh-device-token',
          );
        },
      );
    }

    testWidgets("says when the device can't be checked, and checks again", (
      tester,
    ) async {
      var online = false;
      await pumpApp(
        tester,
        savedRefreshToken: 'saved',
        deviceToken: 'device-1',
        routes: {
          'POST /api/v1/auth/refresh': (_) => (200, sessionJson()),
          ...tillRoutes(),
          'GET /api/v1/outlets/o1/pos/device': (_) {
            if (!online) throw const SocketException('offline');
            return (200, posDeviceJson());
          },
        },
      );
      await pumpUntilFound(
        tester,
        find.text('Perangkat ini tidak bisa diperiksa.'),
      );
      expect(
        find.text('Tidak bisa terhubung ke server. Periksa koneksi internet.'),
        findsOneWidget,
      );

      online = true;
      await tester.tap(find.text('Coba lagi'));
      await pumpUntilFound(tester, find.widgetWithText(MenuCard, 'Kopi susu'));
    });
  });
}
