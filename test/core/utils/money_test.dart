import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/money.dart';

void main() {
  group('formatRupiah', () {
    test('uses the separators of the language and no decimals', () {
      expect(formatRupiah(25000, 'id'), 'Rp 25.000');
      expect(formatRupiah(25000, 'en'), 'Rp 25,000');
      expect(formatRupiah(0, 'id'), 'Rp 0');
    });
  });
}
