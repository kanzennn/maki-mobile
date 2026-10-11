import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:maki_mobile/core/utils/time.dart';

void main() {
  setUpAll(() async {
    initializeTimeZones();
    await initializeDateFormatting();
  });

  group('formatDate', () {
    test('follows the language', () {
      final utc = DateTime.utc(2026, 9, 25, 3);

      expect(formatDate(utc, 'id', 'Asia/Jakarta'), '25 Sep 2026');
      expect(formatDate(utc, 'en', 'Asia/Jakarta'), 'Sep 25, 2026');
    });

    test('uses the outlet time zone, not the device one', () {
      // 20:00 UTC on 25 September is already 26 September in Jakarta.
      final utc = DateTime.utc(2026, 9, 25, 20);

      expect(formatDate(utc, 'id', 'Asia/Jakarta'), '26 Sep 2026');
      expect(formatDate(utc, 'id', 'UTC'), '25 Sep 2026');
    });
  });

  group('formatDateTime and formatTime', () {
    test("show the outlet's time, in its language", () {
      // 03:04 UTC is 10:04 in Jakarta.
      final utc = DateTime.utc(2026, 10, 1, 3, 4, 5);

      expect(formatDateTime(utc, 'id', 'Asia/Jakarta'), '1 Okt 2026 10.04');
      expect(formatDateTime(utc, 'en', 'Asia/Jakarta'), 'Oct 1, 2026 10:04');
      expect(formatTime(utc, 'id', 'Asia/Jakarta'), '10.04');
      expect(formatTime(utc, 'en', 'UTC'), '03:04');
    });
  });
}
