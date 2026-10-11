import 'package:intl/intl.dart';

/// A count as the language groups its digits: `1.250` in Indonesian,
/// `1,250` in English.
String formatCount(int count, String locale) =>
    NumberFormat.decimalPattern(locale).format(count);

/// A rate in basis points as the language writes a percentage: 1000 is
/// `10%`, 550 is `5,5%` in Indonesian and `5.5%` in English, as the web
/// app writes it.
String formatRate(int bps, String locale) => (NumberFormat.percentPattern(
  locale,
)..maximumFractionDigits = 2).format(bps / 10000);
