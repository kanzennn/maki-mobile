import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Loads the bundled time zone database. Call once at startup; it needs no
/// network, so outlet times still work offline. The full database includes
/// aliases such as `UTC`, which the backend and the browser also accept.
void initializeTimeZones() => tzdata.initializeTimeZones();

/// Shows a UTC instant as a date in the outlet's time zone — never the
/// device's, which may be set to anything.
String formatDate(DateTime utc, String locale, String outletTimeZone) {
  final local = tz.TZDateTime.from(utc, tz.getLocation(outletTimeZone));
  return DateFormat.yMMMd(locale).format(local);
}

/// A UTC instant as a date and time in the outlet's time zone, for a
/// receipt: `1 Okt 2026 10.04`, `Oct 1, 2026 10:04`.
String formatDateTime(DateTime utc, String locale, String outletTimeZone) {
  final local = tz.TZDateTime.from(utc, tz.getLocation(outletTimeZone));
  return DateFormat.yMMMd(locale).add_Hm().format(local);
}

/// The time of day alone, in the outlet's time zone, for a list of today's
/// orders: `10.04`, `10:04`.
String formatTime(DateTime utc, String locale, String outletTimeZone) {
  final local = tz.TZDateTime.from(utc, tz.getLocation(outletTimeZone));
  return DateFormat.Hm(locale).format(local);
}
