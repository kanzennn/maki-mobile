import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:maki_mobile/app/locale.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/menu_browser.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';
import 'package:maki_mobile/main.dart' as app;

// The cashier on a phone against a real backend (architecture standard
// §11). The outlet, its Manager, its cashier, its menu and its tables are
// set up through the API as the Owner and the Manager would; then, on
// screen, the Manager activates the phone and sells with change and a
// receipt, finds the sale in today's orders and voids it; the cashier sells
// on the same phone, then with the Owner's voucher, then at a table, which
// they release once its customers have gone, then by the number on a stand
// once the Manager has the outlet take number stands; and once the Manager
// revokes it, the phone signs out and forgets that it was a till.
//
// Needs the backend's Owner, and the build's own configuration:
//
//   flutter test integration_test --flavor dev \
//     --dart-define-from-file=env/dev.json \
//     --dart-define=E2E_OWNER_USERNAME=... --dart-define=E2E_OWNER_PASSWORD=...
//
// Without the Owner it skips. Each run makes its own outlet and accounts.

const _ownerUsername = String.fromEnvironment('E2E_OWNER_USERNAME');
const _ownerPassword = String.fromEnvironment('E2E_OWNER_PASSWORD');
const _apiBaseUrl = String.fromEnvironment('API_BASE_URL');

/// For a look at the screens: the test stops a moment at each [_look],
/// saying so in its output, while something outside takes a screenshot.
const _screenshots = bool.fromEnvironment('E2E_SCREENSHOTS');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // A tap that lands on something else — a snackbar over the pay button —
  // is what a cashier's finger would do too: a failure, not a warning.
  WidgetController.hitTestWarningShouldBeFatal = true;

  final run = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
  final suffix = run.substring(run.length - 6);
  final code = 'HP${suffix.toUpperCase()}';
  final voucherCode = 'V${suffix.toUpperCase()}';
  final manager = (username: 'rina.hp.$suffix', password: 'sandi rina 123');
  final cashier = (username: 'budi.hp.$suffix', password: 'sandi budi 456');

  testWidgets(
    'the cashier against the backend',
    (tester) async {
      final api = _Api();
      final oid = await api.setUp(
        code: code,
        manager: manager,
        cashier: cashier,
      );
      final voucherId = await api.createVoucher(oid, voucherCode);

      // A phone fresh from the box: no session, no device token.
      await const FlutterSecureStorage().deleteAll();
      await app.main();
      await _waitFor(tester, _signInButton());

      // The Manager activates it.
      await _signIn(tester, manager.username, manager.password);
      await _waitFor(tester, find.text('Perangkat ini belum terdaftar'));
      await _look(tester, '01-device-gate');
      await tester.enterText(
        find.widgetWithText(TextFormField, 'Nama perangkat'),
        'Kasir HP',
      );
      await tester.tap(find.text('Aktifkan perangkat ini'));
      await _waitFor(tester, _menu('Es Kopi Susu'));

      // Two coffees and the last but one cake: 61.000, service 3.050, tax
      // 6.405 — 70.455, paid with 100.000.
      await _tap(tester, _menu('Es Kopi Susu'));
      await _tap(tester, _menu('Es Kopi Susu'));
      await _tap(tester, _menu('Bolu Pandan'));
      expect(find.text('Stok menipis'), findsOneWidget);
      await _look(tester, '02-sell');
      if (await _openOrder(tester)) await _look(tester, '03-order');
      await _tap(tester, find.textContaining('Bayar Rp'));
      await _tap(tester, find.widgetWithText(OutlinedButton, _rp(100000)));
      await _look(tester, '04-pay');
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text('Transaksi tersimpan'));
      await _look(tester, '05-sold');
      expect(find.text('Kembalian ${_rp(29545)}'), findsOneWidget);
      final first = '$code-K01-${_today()}-0001';
      expect(find.text(first), findsOneWidget);
      await _tap(tester, find.text('Transaksi baru'));
      await _waitFor(tester, find.text('Tersedia 1'));

      // Found in today's orders, and voided: the cake's stock comes back.
      await _tap(tester, find.text('Riwayat'));
      await _waitFor(tester, find.text(first));
      await _look(tester, '06-history');
      await _tap(tester, find.text(first));
      await _waitFor(tester, find.text('Terima kasih'));
      await _tap(tester, find.text('Void transaksi'));
      await tester.enterText(
        find.widgetWithText(TextField, 'Alasan'),
        'Salah input',
      );
      await _tap(tester, find.widgetWithText(FilledButton, 'Void'));
      await _waitFor(tester, find.text('VOID'));
      await _look(tester, '07-voided');
      await tester.tap(find.byType(BackButton));
      await _waitFor(tester, find.text('Void'));

      // The Manager signs out; the phone stays the outlet's till.
      await _tap(tester, find.text('Akun'));
      await _waitFor(tester, find.text('K01 · Kasir HP'));
      await _look(tester, '08-account');
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Keluar'));
      await _waitFor(tester, _signInButton());

      // The cashier sells on it, the device's next number.
      await _signIn(tester, cashier.username, cashier.password);
      await _waitFor(tester, find.text('Tersedia 2'));
      await _tap(tester, _menu('Es Kopi Susu'));
      await _openOrder(tester);
      await _tap(tester, find.textContaining('Bayar Rp'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Uang pas'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text('Transaksi tersimpan'));
      expect(find.text('$code-K01-${_today()}-0002'), findsOneWidget);
      await _tap(tester, find.text('Transaksi baru'));

      // With the Owner's voucher: three coffees, 54.000, 12,5% off (6.750),
      // service 2.363, tax 4.961 — 54.574. The receipt names the voucher,
      // and the Owner sees its use taken.
      await _tap(tester, _menu('Es Kopi Susu'));
      await _tap(tester, _menu('Es Kopi Susu'));
      await _tap(tester, _menu('Es Kopi Susu'));
      await _openOrder(tester);
      await tester.enterText(
        find.widgetWithText(TextField, 'Voucher'),
        voucherCode.toLowerCase(),
      );
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Pakai'));
      await _waitFor(tester, find.text('Potongan ($voucherCode)'));
      await _look(tester, '09-voucher');
      await _tap(tester, find.textContaining('Bayar ${_rp(54574)}'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Uang pas'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text('Transaksi tersimpan'));
      await _look(tester, '10-voucher-sold');
      expect(find.text('$code-K01-${_today()}-0003'), findsOneWidget);
      expect(find.text('Potongan ($voucherCode)'), findsOneWidget);
      expect(find.text('-${_rp(6750)}'), findsOneWidget);
      await _tap(tester, find.text('Transaksi baru'));
      expect(await api.voucherUses(voucherId), 1);

      // At table A1, picked from the floor: the receipt names it, and the
      // floor shows it occupied until the cashier releases it.
      await _tap(tester, _menu('Es Kopi Susu'));
      await _openOrder(tester);
      await _tap(tester, find.text('Pilih meja'));
      await _waitFor(
        tester,
        find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'),
      );
      await _look(tester, '11-pick-table');
      await _tap(tester, find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'));
      await _waitFor(tester, find.text('Meja A1'));
      await _tap(tester, find.textContaining('Bayar Rp'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Uang pas'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text('Transaksi tersimpan'));
      expect(find.text('$code-K01-${_today()}-0004'), findsOneWidget);
      expect(find.text('A1'), findsOneWidget);
      await _look(tester, '12-table-sold');
      await _tap(tester, find.text('Transaksi baru'));

      await _tap(tester, find.text('Meja'));
      await _waitFor(tester, find.bySemanticsLabel('Meja A1, Terisi, 4 kursi'));
      await _look(tester, '13-tables');
      await _tap(tester, find.bySemanticsLabel('Meja A1, Terisi, 4 kursi'));
      await _waitFor(tester, find.text('Terisi sejak'));
      await _look(tester, '14-table-detail');
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Kosongkan Meja'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Kosongkan Meja'));
      await _waitFor(tester, find.text('Meja A1 dikosongkan.'));
      await _waitFor(
        tester,
        find.bySemanticsLabel('Meja A1, Tersedia, 4 kursi'),
      );
      await _tap(tester, find.text('Kasir'));
      await _waitFor(tester, _menu('Es Kopi Susu'));

      // The Manager has the outlet take number stands. Signed in again, the
      // cashier types the stand's number instead of picking a table, and
      // the receipt shows it large, for the waiter.
      await api.seatBy(oid, manager, 'number');
      await _tap(tester, find.text('Akun'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Keluar'));
      await _waitFor(tester, _signInButton());
      await _signIn(tester, cashier.username, cashier.password);
      await _waitFor(tester, _menu('Es Kopi Susu'));
      await _tap(tester, _menu('Es Kopi Susu'));
      await _openOrder(tester);
      await _waitFor(tester, _standField());
      expect(find.text('Pilih meja'), findsNothing);
      await tester.enterText(_standField(), 'b-3');
      await tester.pump();
      await _look(tester, '16-stand');
      await _tap(tester, find.textContaining('Bayar Rp'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Uang pas'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text('Transaksi tersimpan'));
      expect(find.text('$code-K01-${_today()}-0005'), findsOneWidget);
      // On the receipt; the order beside it, or under it, has the field.
      final receipt = find.byType(Dialog);
      expect(
        find.descendant(of: receipt, matching: find.text('Nomor papan')),
        findsOneWidget,
      );
      expect(
        find.descendant(of: receipt, matching: find.text('B-3')),
        findsOneWidget,
      );
      await _look(tester, '17-stand-sold');
      await _tap(tester, find.text('Transaksi baru'));
      // No tables to go to now; today's orders say the stand.
      await _waitFor(tester, find.text('Riwayat'));
      expect(find.text('Meja'), findsNothing);
      await _tap(tester, find.text('Riwayat'));
      await _waitFor(tester, find.textContaining('No. B-3'));
      await _look(tester, '18-stand-history');
      await _tap(tester, find.text('Kasir'));
      await _waitFor(tester, _menu('Es Kopi Susu'));

      // The Manager revokes the phone: its next sale signs it out, and it
      // keeps nothing that let it in.
      await api.revokeDevices(oid, manager);
      await _tap(tester, _menu('Es Kopi Susu'));
      await _openOrder(tester);
      await tester.enterText(_standField(), '9');
      await tester.pump();
      await _tap(tester, find.textContaining('Bayar Rp'));
      await _tap(tester, find.widgetWithText(OutlinedButton, 'Uang pas'));
      await _tap(tester, find.widgetWithText(FilledButton, 'Bayar'));
      await _waitFor(tester, find.text(_beforeSignIn().loginDeviceRevoked));
      await _look(tester, '15-revoked');
      expect(await const FlutterSecureStorage().readAll(), isEmpty);

      // Signed in again, it is a phone to activate, not a till.
      await _signIn(tester, cashier.username, cashier.password);
      await _waitFor(tester, find.text('Perangkat ini belum terdaftar'));
    },
    skip: _ownerUsername.isEmpty || _ownerPassword.isEmpty,
    timeout: const Timeout(Duration(minutes: 5)),
  );
}

String _rp(int amount) => formatRupiah(amount, 'id');

/// The words of the sign-in screen: the phone's language, before anyone is
/// signed in. Once signed in, the app speaks the account's — the outlet's
/// Indonesian here.
AppLocalizations _beforeSignIn() => lookupAppLocalizations(
  resolveLocale(
    WidgetsBinding.instance.platformDispatcher.locale,
    AppLocalizations.supportedLocales,
  ),
);

Finder _signInButton() =>
    find.widgetWithText(FilledButton, _beforeSignIn().loginSubmit);

/// The outlet's day today, as receipt numbers carry it: the test's outlet is
/// in Asia/Jakarta, UTC+7, with no daylight saving.
String _today() {
  final day = DateTime.now().toUtc().add(const Duration(hours: 7));
  return '${day.year}${day.month.toString().padLeft(2, '0')}'
      '${day.day.toString().padLeft(2, '0')}';
}

Future<void> _signIn(
  WidgetTester tester,
  String username,
  String password,
) async {
  await tester.enterText(
    find.widgetWithText(TextFormField, _beforeSignIn().usernameLabel),
    username,
  );
  await tester.enterText(
    find.widgetWithText(TextFormField, _beforeSignIn().passwordLabel),
    password,
  );
  await _tap(tester, _signInButton());
}

/// A screen worth looking at: with [_screenshots] on, says [name] and waits
/// for the screenshot.
Future<void> _look(WidgetTester tester, String name) async {
  if (!_screenshots) return;
  await tester.pumpAndSettle();
  // The host's script watches the output for this line.
  // ignore: avoid_print
  print('CHECKPOINT $name');
  final end = DateTime.now().add(const Duration(seconds: 6));
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 200));
  }
}

/// A menu's card: on a tablet its name is in the order beside it too.
Finder _menu(String name) => find.widgetWithText(MenuCard, name);

/// The order's field for the number on the customer's stand.
Finder _standField() => find.widgetWithText(TextField, 'Nomor papan');

/// Opens the order full screen, on a phone; on a tablet the order is beside
/// the menus already. Says whether it opened it.
Future<bool> _openOrder(WidgetTester tester) async {
  await tester.pumpAndSettle();
  if (find.text('Lihat pesanan').evaluate().isEmpty) return false;
  await _tap(tester, find.text('Lihat pesanan'));
  return true;
}

/// Taps the one widget [finder] finds, once it is there.
Future<void> _tap(WidgetTester tester, Finder finder) async {
  await _waitFor(tester, finder);
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
  await tester.pump(const Duration(milliseconds: 300));
}

/// Waits, in real time, for [finder] to find something.
Future<void> _waitFor(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 30),
}) async {
  final end = DateTime.now().add(timeout);
  while (finder.evaluate().isEmpty) {
    if (DateTime.now().isAfter(end)) {
      throw TestFailure('Waited $timeout for $finder');
    }
    await tester.pump(const Duration(milliseconds: 200));
  }
}

/// The backend, as the Owner and the Manager set it up.
class _Api {
  final _dio = Dio(BaseOptions(baseUrl: '$_apiBaseUrl/api/v1'));

  Future<String> _token(String username, String password) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'username': username, 'password': password, 'client': 'mobile'},
    );
    return response.data!['access_token'] as String;
  }

  Options _as(String token) =>
      Options(headers: {'Authorization': 'Bearer $token'});

  /// An account with a temporary password picks its own.
  Future<void> _choosePassword(
    String username,
    String temporary,
    String own,
  ) async {
    final token = await _token(username, temporary);
    await _dio.put<void>(
      '/me/password',
      data: {'current_password': temporary, 'new_password': own},
      options: _as(token),
    );
  }

  /// The outlet [code] in Asia/Jakarta with 10% tax and 5% service, its
  /// Manager, its cashier, and two menus: Es Kopi Susu, untracked, and
  /// Bolu Pandan, 2 left, low from 3. Returns the outlet's ID.
  Future<String> setUp({
    required String code,
    required ({String username, String password}) manager,
    required ({String username, String password}) cashier,
  }) async {
    final owner = await _token(_ownerUsername, _ownerPassword);
    final outlet = await _dio.post<Map<String, dynamic>>(
      '/outlets',
      data: {
        'code': code,
        'name': 'Kasir HP $code',
        'tax_pct': 10,
        'service_pct': 5,
        'timezone': 'Asia/Jakarta',
      },
      options: _as(owner),
    );
    final oid = outlet.data!['outlet_id'] as String;
    await _dio.post<void>(
      '/outlets/$oid/users',
      data: {
        'name': 'Rina HP',
        'username': manager.username,
        'password': 'sementara 123',
        'is_manager': true,
      },
      options: _as(owner),
    );
    await _choosePassword(manager.username, 'sementara 123', manager.password);

    final rina = await _token(manager.username, manager.password);
    final category = await _dio.post<Map<String, dynamic>>(
      '/outlets/$oid/categories',
      data: {'name': 'Minuman'},
      options: _as(rina),
    );
    final categoryId = category.data!['category_id'] as String;
    for (final menu in [
      {'name': 'Es Kopi Susu', 'category_id': categoryId, 'price': 18000},
      {
        'name': 'Bolu Pandan',
        'category_id': categoryId,
        'price': 25000,
        'track_stock': true,
        'initial_stock': 2,
        'stock_alert': 3,
      },
    ]) {
      await _dio.post<void>(
        '/outlets/$oid/menus',
        data: menu,
        options: _as(rina),
      );
    }
    final roles = await _dio.get<Map<String, dynamic>>(
      '/outlets/$oid/roles',
      options: _as(rina),
    );
    final kasir = (roles.data!['data'] as List)
        .cast<Map<String, dynamic>>()
        .singleWhere((role) => role['name'] == 'Kasir');
    await _dio.post<void>(
      '/outlets/$oid/users',
      data: {
        'name': 'Budi HP',
        'username': cashier.username,
        'password': 'sementara 456',
        'role_id': kasir['role_id'],
      },
      options: _as(rina),
    );
    await _choosePassword(cashier.username, 'sementara 456', cashier.password);

    // Two tables in Indoor, placed on its layout.
    final area = await _dio.post<Map<String, dynamic>>(
      '/outlets/$oid/areas',
      data: {'name': 'Indoor'},
      options: _as(rina),
    );
    final areaId = area.data!['area_id'] as String;
    final placed = <Map<String, Object?>>[];
    for (final (name, capacity, x) in [('A1', 4, 4), ('A2', 2, 14)]) {
      final table = await _dio.post<Map<String, dynamic>>(
        '/outlets/$oid/tables',
        data: {
          'name': name,
          'area_id': areaId,
          'capacity': capacity,
          'shape': 'square',
          'is_active': true,
        },
        options: _as(rina),
      );
      placed.add({
        'table_id': table.data!['table_id'],
        'x': x,
        'y': 4,
        'w': 4,
        'h': 4,
        'rotation': 0,
        'shape': 'square',
      });
    }
    final layout = await _dio.get<Map<String, dynamic>>(
      '/outlets/$oid/areas/$areaId/layout',
      options: _as(rina),
    );
    await _dio.put<void>(
      '/outlets/$oid/areas/$areaId/layout',
      data: {
        'version': layout.data!['version'],
        'tables': placed,
        'decorations': [
          {'kind': 'wall', 'x': 0, 'y': 31, 'w': 48, 'h': 1, 'rotation': 0},
        ],
      },
      options: _as(rina),
    );
    return oid;
  }

  /// The Owner's voucher [code] for the outlet: 12,5% off, at most 20.000,
  /// from 50.000 spent, a month long. Returns its ID.
  Future<String> createVoucher(String oid, String code) async {
    final owner = await _token(_ownerUsername, _ownerPassword);
    final voucher = await _dio.post<Map<String, dynamic>>(
      '/vouchers',
      data: {
        'code': code,
        'type': 'percent',
        'value': 1250,
        'max_discount': 20000,
        'min_spend': 50000,
        'quota': 5,
        'expired_at': DateTime.now()
            .toUtc()
            .add(const Duration(days: 30))
            .toIso8601String(),
        'all_outlets': false,
        'outlet_ids': [oid],
      },
      options: _as(owner),
    );
    return voucher.data!['voucher_id'] as String;
  }

  /// How many uses of the voucher sales have taken, as the Owner sees it.
  Future<int> voucherUses(String voucherId) async {
    final owner = await _token(_ownerUsername, _ownerPassword);
    final voucher = await _dio.get<Map<String, dynamic>>(
      '/vouchers/$voucherId',
      options: _as(owner),
    );
    return voucher.data!['used_count'] as int;
  }

  /// Has the outlet seat its dine-in customers at tables, or by number
  /// stands, as its Manager.
  Future<void> seatBy(
    String oid,
    ({String username, String password}) manager,
    String mode,
  ) async {
    final rina = await _token(manager.username, manager.password);
    await _dio.put<void>(
      '/outlets/$oid/dine-in-mode',
      data: {'mode': mode},
      options: _as(rina),
    );
  }

  /// Revokes every device of the outlet still in use, as its Manager.
  Future<void> revokeDevices(
    String oid,
    ({String username, String password}) manager,
  ) async {
    final rina = await _token(manager.username, manager.password);
    final devices = await _dio.get<Map<String, dynamic>>(
      '/outlets/$oid/devices',
      options: _as(rina),
    );
    for (final device
        in (devices.data!['data'] as List).cast<Map<String, dynamic>>()) {
      if (device['status'] == 'active') {
        await _dio.delete<void>(
          '/outlets/$oid/devices/${device['device_id']}',
          options: _as(rina),
        );
      }
    }
  }
}
