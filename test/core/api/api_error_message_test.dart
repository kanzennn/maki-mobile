import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/l10n/app_localizations_en.dart';
import 'package:maki_mobile/l10n/app_localizations_id.dart';

void main() {
  final l10n = AppLocalizationsId();

  test('translates a known code instead of showing the server message', () {
    const error = ApiException(code: 'not_ready', message: 'Not ready yet.');

    expect(apiErrorMessage(l10n, error), l10n.apiErrorNotReady);
  });

  test('translates the sign-in errors', () {
    for (final (code, message) in [
      ('invalid_credentials', 'Username atau password salah.'),
      (
        'account_disabled',
        'Akun ini dinonaktifkan. Hubungi Manager atau Owner.',
      ),
      ('wrong_password', 'Password saat ini salah.'),
      (
        'password_same_as_username',
        'Password tidak boleh sama dengan username.',
      ),
    ]) {
      expect(
        apiErrorMessage(l10n, ApiException(code: code, message: 'server text')),
        message,
      );
    }
  });

  test("translates the cashier's errors", () {
    for (final (code, message) in [
      ('device_not_registered', l10n.apiErrorDeviceNotRegistered),
      ('device_revoked', l10n.apiErrorDeviceRevoked),
      ('device_already_active', l10n.apiErrorDeviceAlreadyActive),
      ('order_already_void', l10n.apiErrorOrderAlreadyVoid),
      ('order_not_found', l10n.apiErrorOrderNotFound),
      ('outlet_inactive', l10n.apiErrorOutletInactive),
      ('forbidden', l10n.apiErrorForbidden),
      ('dine_in_mode_changed', l10n.apiErrorDineInModeChanged),
    ]) {
      expect(
        apiErrorMessage(l10n, ApiException(code: code, message: 'server text')),
        message,
      );
    }
  });

  test('fills the message from the details', () {
    const tooShort = ApiException(
      code: 'password_too_short',
      message: '',
      details: {'min': 8},
    );
    expect(apiErrorMessage(l10n, tooShort), 'Password minimal 8 karakter.');
  });

  test('gives a rate limit wait in whole minutes', () {
    ApiException limited(int seconds) => ApiException(
      code: 'rate_limited',
      message: '',
      details: {'retry_after': seconds},
    );
    expect(
      apiErrorMessage(l10n, limited(840)),
      'Terlalu banyak percobaan. Coba lagi dalam 14 menit.',
    );

    final en = AppLocalizationsEn();
    expect(
      apiErrorMessage(en, limited(30)),
      'Too many attempts. Try again in 1 minute.',
    );
    expect(
      apiErrorMessage(en, limited(125)),
      'Too many attempts. Try again in 3 minutes.',
    );
  });

  test("falls back to the server message for a code it can't translate", () {
    const error = ApiException(
      code: 'table_occupied',
      message: 'This table already has an open order.',
    );

    expect(
      apiErrorMessage(l10n, error),
      'This table already has an open order.',
    );
  });

  test('shows a generic message for anything else', () {
    expect(apiErrorMessage(l10n, StateError('boom')), l10n.apiErrorInternal);
  });
}
