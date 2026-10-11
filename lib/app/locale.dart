import 'dart:ui';

/// Indonesian unless the device prefers a language the app supports.
const defaultLocale = Locale('id');

Locale resolveLocale(Locale? device, Iterable<Locale> supported) {
  for (final locale in supported) {
    if (locale.languageCode == device?.languageCode) return locale;
  }
  return defaultLocale;
}
