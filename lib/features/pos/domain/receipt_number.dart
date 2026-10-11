import 'package:timezone/timezone.dart' as tz;

/// The outlet's day that [at] falls in, as YYYY-MM-DD: `GET /pos/device`
/// says which day its count is of in the same form. The day is the outlet's,
/// whatever zone the phone is set to.
String outletDay(DateTime at, String timeZone) {
  final local = tz.TZDateTime.from(at, tz.getLocation(timeZone));
  return '${_digits(local.year, 4)}-${_digits(local.month, 2)}-'
      '${_digits(local.day, 2)}';
}

/// A receipt number as the device makes it: OUTLET-DEVICE-YYYYMMDD-0001,
/// the prefix being the outlet's code and the device's (BDG01-K01), then the
/// day, then the device's count that day in at least four digits.
String receiptNumber(String prefix, String day, int count) =>
    '$prefix-${day.replaceAll('-', '')}-${_digits(count, 4)}';

/// The count a receipt number made on [today] takes: the next one of the
/// day the device's count is of, or 1 on a new day.
int countFor({required String day, required int next, required String today}) =>
    day == today ? next : 1;

String _digits(int value, int width) => value.toString().padLeft(width, '0');
