import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The message to show for a failed call: the translation of the error's
/// code, filled from its details, the server's own message for a code the
/// app can't translate yet, and a generic message otherwise.
String apiErrorMessage(AppLocalizations l10n, Object error) {
  if (error is! ApiException) return l10n.apiErrorInternal;
  int detail(String key, int fallback) => switch (error.details[key]) {
    final num value => value.toInt(),
    _ => fallback,
  };
  return switch (error.code) {
    'network' => l10n.apiErrorNetwork,
    'not_found' => l10n.apiErrorNotFound,
    'not_ready' => l10n.apiErrorNotReady,
    'internal_error' => l10n.apiErrorInternal,
    'invalid_credentials' => l10n.apiErrorInvalidCredentials,
    'account_disabled' => l10n.apiErrorAccountDisabled,
    // retry_after is in seconds; say it in whole minutes, at least one.
    'rate_limited' => l10n.apiErrorRateLimited(
      ((detail('retry_after', 60) + 59) ~/ 60).clamp(1, 1 << 20),
    ),
    'wrong_password' => l10n.apiErrorWrongPassword,
    'password_too_short' => l10n.apiErrorPasswordTooShort(detail('min', 8)),
    'password_too_long' => l10n.apiErrorPasswordTooLong(detail('max', 128)),
    'password_same_as_username' => l10n.apiErrorPasswordSameAsUsername,
    'unauthorized' => l10n.apiErrorUnauthorized,
    'validation_failed' => l10n.apiErrorValidation,
    'forbidden' => l10n.apiErrorForbidden,
    'outlet_not_found' => l10n.apiErrorOutletNotFound,
    'outlet_inactive' => l10n.apiErrorOutletInactive,
    'device_not_registered' => l10n.apiErrorDeviceNotRegistered,
    'device_revoked' => l10n.apiErrorDeviceRevoked,
    'device_already_active' => l10n.apiErrorDeviceAlreadyActive,
    'order_not_found' => l10n.apiErrorOrderNotFound,
    'order_already_void' => l10n.apiErrorOrderAlreadyVoid,
    'order_id_conflict' => l10n.apiErrorOrderIdConflict,
    'order_no_taken' => l10n.apiErrorOrderNoTaken,
    'voucher_not_found' => l10n.apiErrorVoucherNotFound,
    'voucher_inactive' => l10n.apiErrorVoucherInactive,
    'voucher_not_started' => l10n.apiErrorVoucherNotStarted,
    'voucher_expired' => l10n.apiErrorVoucherExpired,
    'voucher_used_up' => l10n.apiErrorVoucherUsedUp,
    'voucher_not_for_outlet' => l10n.apiErrorVoucherNotForOutlet,
    'voucher_min_spend' => l10n.apiErrorVoucherMinSpend,
    'table_unavailable' => l10n.apiErrorTableUnavailable,
    'table_not_found' => l10n.apiErrorTableNotFound,
    'dine_in_mode_changed' => l10n.apiErrorDineInModeChanged,
    _ when error.message.isNotEmpty => error.message,
    _ => l10n.apiErrorInternal,
  };
}
