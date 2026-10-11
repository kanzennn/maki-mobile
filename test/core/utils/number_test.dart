import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/utils/number.dart';

void main() {
  test('groups a count as the language does', () {
    expect(formatCount(1250, 'id'), '1.250');
    expect(formatCount(1250, 'en'), '1,250');
    expect(formatCount(7, 'id'), '7');
  });

  test('writes a rate in basis points as a percentage', () {
    expect(formatRate(1000, 'id'), '10%');
    expect(formatRate(550, 'id'), '5,5%');
    expect(formatRate(550, 'en'), '5.5%');
    expect(formatRate(1025, 'id'), '10,25%');
    expect(formatRate(0, 'en'), '0%');
  });
}
