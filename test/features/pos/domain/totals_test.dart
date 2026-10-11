import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/domain/totals.dart';

void main() {
  // The backend's own file, which its Go tests and the web's read too: one
  // rule for all three, read where it lives, next to maki-mobile, rather than
  // from a copy that could drift (architecture standard §11).
  final vectors = jsonDecode(
    File('../maki-be/api/test-vectors/order-totals.json').readAsStringSync(),
  ) as Map<String, dynamic>;
  final cases = (vectors['cases'] as List).cast<Map<String, dynamic>>();

  test('has cases to check', () {
    expect(cases.length, greaterThan(10));
  });

  for (final c in cases) {
    test(c['name'] as String, () {
      final lines = [
        for (final line in (c['lines'] as List).cast<Map<String, dynamic>>())
          (price: line['price'] as int, qty: line['qty'] as int),
      ];
      final expected = c['expected'] as Map<String, dynamic>;

      expect(
        computeTotals(
          lines,
          discount: c['discount'] as int,
          serviceBps: c['service_bps'] as int,
          taxBps: c['tax_bps'] as int,
        ),
        (
          subtotal: expected['subtotal'] as int,
          discount: expected['discount'] as int,
          service: expected['service'] as int,
          tax: expected['tax'] as int,
          total: expected['total'] as int,
        ),
      );
    });
  }
}
