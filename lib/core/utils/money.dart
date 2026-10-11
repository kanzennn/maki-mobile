import 'package:intl/intl.dart';

/// Formats a Rupiah amount — an `int`, never a `double` — for display. The
/// currency stays Rupiah in every language; only the separators follow it:
/// `Rp 25.000` in Indonesian, `Rp 25,000` in English, matching the web app.
String formatRupiah(int amount, String locale) {
  // intl doesn't space an alphabetic currency symbol from the number the
  // way the browser does, so the no-break space is part of the symbol.
  return NumberFormat.currency(
    locale: locale,
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(amount);
}
