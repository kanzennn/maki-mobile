import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/features/pos/domain/stand.dart';

void main() {
  test(
    'is kept as the server keeps it: no spaces at its ends, in capitals',
    () {
      expect(standNumber('  a5 '), 'A5');
      expect(standNumber('b-3'), 'B-3');
      expect(standNumber('12'), '12');
    },
  );

  for (final typed in ['1', '12', 'A5', 'b-3', ' 7 ', 'B--3', 'ABCDEFGHIJ']) {
    test('takes "$typed"', () => expect(validStand(typed), isTrue));
  }

  for (final typed in [
    '',
    '   ',
    '-',
    '-3',
    '3-',
    'A 5',
    '12.',
    '#1',
    'É1',
    'ABCDEFGHIJK',
  ]) {
    test("doesn't take '$typed'", () => expect(validStand(typed), isFalse));
  }

  test('has at most as many characters as the server takes', () {
    expect(maxStand, 10);
    expect(validStand('9' * maxStand), isTrue);
    expect(validStand('9' * (maxStand + 1)), isFalse);
  });
}
