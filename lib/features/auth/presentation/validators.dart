import 'package:maki_mobile/l10n/app_localizations.dart';

/// The server's password rule, checked before sending: 8 to 128
/// characters, counted as the server counts them (Unicode code points).
/// The server checks again and has the last word.
const passwordMinLength = 8;
const passwordMaxLength = 128;

String? requiredField(AppLocalizations l10n, String? value) =>
    (value == null || value.trim().isEmpty) ? l10n.validationRequired : null;

String? newPassword(AppLocalizations l10n, String? value) {
  if (value == null || value.isEmpty) return l10n.validationRequired;
  final length = value.runes.length;
  if (length < passwordMinLength) {
    return l10n.validationMinLength(passwordMinLength);
  }
  if (length > passwordMaxLength) {
    return l10n.validationMaxLength(passwordMaxLength);
  }
  return null;
}
