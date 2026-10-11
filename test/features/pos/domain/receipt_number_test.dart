import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/order_id.dart';
import 'package:maki_mobile/features/pos/domain/receipt_number.dart';

void main() {
  setUpAll(initializeTimeZones);

  group('outletDay', () {
    test("is the outlet's day, whatever the phone's zone", () {
      // Midnight in Bandung (UTC+7) is 17:00 UTC the day before.
      expect(
        outletDay(DateTime.utc(2026, 9, 30, 16, 59, 59), 'Asia/Jakarta'),
        '2026-09-30',
      );
      expect(
        outletDay(DateTime.utc(2026, 9, 30, 17), 'Asia/Jakarta'),
        '2026-10-01',
      );
      expect(
        outletDay(DateTime.utc(2026, 9, 30, 17), 'Asia/Jayapura'),
        '2026-10-01',
      );
      expect(outletDay(DateTime.utc(2026, 9, 30, 17), 'UTC'), '2026-09-30');
    });

    test('reads a local time as the instant it is', () {
      final instant = DateTime.utc(2026, 9, 30, 17);
      expect(outletDay(instant.toLocal(), 'Asia/Jakarta'), '2026-10-01');
    });
  });

  group('receiptNumber', () {
    test('is the prefix, the day and a count of at least four digits', () {
      expect(
        receiptNumber('BDG01-K01', '2026-10-01', 1),
        'BDG01-K01-20261001-0001',
      );
      expect(
        receiptNumber('BDG01-K12', '2026-10-01', 42),
        'BDG01-K12-20261001-0042',
      );
      expect(
        receiptNumber('BDG01-K01', '2026-10-01', 12345),
        'BDG01-K01-20261001-12345',
      );
    });

    test('starts the count again on a new day', () {
      expect(countFor(day: '2026-10-01', next: 7, today: '2026-10-01'), 7);
      expect(countFor(day: '2026-10-01', next: 7, today: '2026-10-02'), 1);
    });
  });

  group('newOrderId', () {
    test('has the shape of a CUID2, and never repeats', () {
      final ids = [for (var i = 0; i < 2000; i++) newOrderId()];
      for (final id in ids) {
        expect(id, matches(RegExp(r'^[a-z][a-z0-9]{23}$')));
      }
      expect(ids.toSet(), hasLength(ids.length));
    });

    test('draws every character from the random source it is given', () {
      // A source that always answers its highest value: the last letter,
      // then the last digit.
      expect(newOrderId(_Highest()), 'z${'9' * 23}');
    });
  });
}

class _Highest implements Random {
  @override
  int nextInt(int max) => max - 1;

  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 0.999;
}
