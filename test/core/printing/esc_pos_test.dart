import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';

import '../../helpers/printer.dart';

void main() {
  group('asciiOnly', () {
    test('turns any white space into a space', () {
      expect(asciiOnly('Rp 18.000'), 'Rp 18.000');
      expect(asciiOnly('a b c\td\ne\rf'), 'a b c d e f');
    });

    test('takes accents off, and marks what has no match', () {
      expect(asciiOnly('Café Crème'), 'Cafe Creme');
      expect(asciiOnly('2 × 18.000 – “ok”'), '2 x 18.000 - "ok"');
      // One mark for one character, an emoji's two code units included.
      expect(asciiOnly('Kopi ☕ 🥤'), 'Kopi ? ?');
      expect(asciiOnly('拿铁'), '??');
    });

    test('drops control characters, which a printer reads as commands', () {
      expect(asciiOnly('Kopi\x1B@\x1DV\x00\x7F\x9B'), 'Kopi@V');
    });
  });

  group('wrapText', () {
    test('breaks between words', () {
      expect(wrapText('satu dua tiga empat', 9), ['satu dua', 'tiga', 'empat']);
    });

    test('breaks inside a word only when it is too long alone', () {
      expect(wrapText('ab BDG01K01202610010005', 10), [
        'ab',
        'BDG01K0120',
        '2610010005',
      ]);
    });

    test('has no lines for no text', () {
      expect(wrapText('', 32), isEmpty);
      expect(wrapText('   ', 32), isEmpty);
    });
  });

  group('EscPosTicket', () {
    for (final paper in PaperWidth.values) {
      test('stays inside ${paper.columns} columns', () {
        final ticket = EscPosTicket(paper)
          ..text('Nama menu yang sangat panjang sekali ' * 4)
          ..text('BESAR ' * 12, big: true)
          ..row('Total', 'Rp 20.790')
          ..row('Label yang sangat panjang sekali ' * 4, 'Rp 1.000.000')
          ..row('Pendek', 'Nilai yang sangat panjang ' * 4)
          ..rule();

        final lines = ticketLines(ticket.finish());

        expect(lines, isNotEmpty);
        for (final line in lines) {
          expect(line.length, lessThanOrEqualTo(paper.columns), reason: line);
        }
      });
    }

    test('sets a row to both edges', () {
      final ticket = EscPosTicket(PaperWidth.mm58)..row('Total', 'Rp 20.790');

      final line = ticketLines(ticket.finish()).first;

      expect(line, startsWith('Total'));
      expect(line, endsWith('Rp 20.790'));
      expect(line.length, 32);
    });

    test('puts a value on its own line when it finds no room', () {
      final label = 'x' * 30;
      final ticket = EscPosTicket(PaperWidth.mm58)..row(label, 'Rp 1.000');

      expect(ticketLines(ticket.finish()).take(2), [
        label,
        'Rp 1.000'.padLeft(32),
      ]);
    });

    test('wraps big text to half the columns', () {
      final ticket = EscPosTicket(PaperWidth.mm58)..text('A' * 20, big: true);

      expect(ticketLines(ticket.finish()).first.length, 16);
    });

    test("can't be given a command through its text", () {
      final ticket = EscPosTicket(PaperWidth.mm58)
        ..text('Kopi\x1D\x56\x00\x1B@')
        ..row('a\x1B', 'b\x1D');

      // ticketLines fails on any command it doesn't know.
      final lines = ticketLines(ticket.finish());

      expect(lines.first, 'KopiV@');
    });

    test('resets the printer first, and feeds and cuts last', () {
      final bytes = EscPosTicket(PaperWidth.mm80).finish();

      expect(bytes.sublist(0, 2), [0x1B, 0x40]);
      expect(bytes.sublist(bytes.length - 7), [
        0x0A,
        0x0A,
        0x0A,
        0x1D,
        0x56,
        0x42,
        0x00,
      ]);
    });
  });
}
