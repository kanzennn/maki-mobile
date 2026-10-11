import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';

void main() {
  // The backend's own file, which its Go tests and the web's read too: one
  // rule for all three, read where it lives (architecture standard §11).
  final vectors = jsonDecode(
    File('../maki-be/api/test-vectors/voucher-discounts.json')
        .readAsStringSync(),
  ) as Map<String, dynamic>;
  final cases = (vectors['cases'] as List).cast<Map<String, dynamic>>();

  test('has cases to check', () {
    expect(cases.length, greaterThanOrEqualTo(10));
  });

  for (final c in cases) {
    test(c['name'] as String, () {
      final terms = c['voucher'] as Map<String, dynamic>;
      final voucher = Voucher(
        voucherId: 'v1',
        code: 'TEST',
        type: terms['type'] == 'percent'
            ? VoucherType.percent
            : VoucherType.amount,
        value: terms['value'] as int,
        maxDiscount: terms['max_discount'] as int?,
        minSpend: terms['min_spend'] as int?,
      );
      final expected = c['expected'] as Map<String, dynamic>;

      expect(voucherDiscount(voucher, c['subtotal'] as int), (
        discount: expected['discount'] as int,
        applies: expected['applies'] as bool,
      ));
    });
  }
}
