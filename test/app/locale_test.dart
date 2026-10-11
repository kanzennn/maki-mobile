import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/app/locale.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

void main() {
  const supported = AppLocalizations.supportedLocales;

  test('uses the device language when the app supports it', () {
    expect(
      resolveLocale(const Locale('en', 'US'), supported).languageCode,
      'en',
    );
    expect(resolveLocale(const Locale('id'), supported).languageCode, 'id');
  });

  test('falls back to Indonesian otherwise', () {
    expect(resolveLocale(const Locale('ja'), supported), defaultLocale);
    expect(resolveLocale(null, supported), defaultLocale);
  });
}
