import 'dart:typed_data';

/// A thermal roll, by how many characters of the printer's standard font fit
/// on a line.
enum PaperWidth {
  mm58(32),
  mm80(48);

  PaperWidth(this.columns);

  final int columns;
}

/// Where a line of text sits on the roll.
enum TicketAlign { left, center }

/// Builds what a thermal printer takes: ESC/POS commands and plain ASCII.
///
/// Text is made safe here. The printer reads a control character as a
/// command, and a menu's name or a cashier's note may hold one, so those go;
/// the rest becomes what every printer's default code page has in common.
class EscPosTicket {
  EscPosTicket(this.paper) {
    _bytes.add(const [_esc, 0x40]); // Back to the printer's defaults.
  }

  static const _esc = 0x1B;
  static const _gs = 0x1D;
  static const _lineFeed = 0x0A;

  final PaperWidth paper;
  final _bytes = BytesBuilder(copy: false);

  /// [text], wrapped to the roll. [big] is twice as wide and twice as tall,
  /// so half as many characters fit.
  void text(
    String text, {
    TicketAlign align = TicketAlign.left,
    bool bold = false,
    bool big = false,
  }) {
    _style(align: align, bold: bold, big: big);
    final columns = big ? paper.columns ~/ 2 : paper.columns;
    wrapText(asciiOnly(text), columns).forEach(_line);
    _style();
  }

  /// [label] at the left and [value] at the right, on one line where they
  /// fit together; otherwise the label wraps and the value ends the last line
  /// that has room for it, or a line of its own.
  void row(String label, String value, {bool bold = false}) {
    _style(bold: bold);
    final columns = paper.columns;
    final amount = asciiOnly(value);
    final lines = wrapText(asciiOnly(label), columns);
    final last = lines.isEmpty ? '' : lines.removeLast();
    lines.forEach(_line);
    if (amount.length >= columns) {
      _line(last);
      wrapText(amount, columns).forEach(_line);
    } else if (last.length + 1 + amount.length <= columns) {
      _line('$last${amount.padLeft(columns - last.length)}');
    } else {
      _line(last);
      _line(amount.padLeft(columns));
    }
    _style();
  }

  /// A dashed line across the roll.
  void rule() => _line('-' * paper.columns);

  /// Empty lines.
  void gap([int lines = 1]) {
    for (var i = 0; i < lines; i++) {
      _bytes.addByte(_lineFeed);
    }
  }

  /// The ticket, fed past the tear bar and cut, on a printer that has a
  /// cutter. It is finished after this.
  Uint8List finish() {
    gap(3);
    _bytes.add(const [_gs, 0x56, 0x42, 0x00]);
    return _bytes.takeBytes();
  }

  void _style({
    TicketAlign align = TicketAlign.left,
    bool bold = false,
    bool big = false,
  }) {
    _bytes
      ..add([_esc, 0x61, if (align == TicketAlign.center) 1 else 0])
      ..add([_esc, 0x45, if (bold) 1 else 0])
      ..add([_gs, 0x21, if (big) 0x11 else 0]);
  }

  void _line(String line) {
    _bytes
      ..add(line.codeUnits)
      ..addByte(_lineFeed);
  }
}

const _folded = {
  'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a', //
  'À': 'A', 'Á': 'A', 'Â': 'A', 'Ã': 'A', 'Ä': 'A', 'Å': 'A',
  'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e',
  'È': 'E', 'É': 'E', 'Ê': 'E', 'Ë': 'E',
  'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i',
  'Ì': 'I', 'Í': 'I', 'Î': 'I', 'Ï': 'I',
  'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o',
  'Ò': 'O', 'Ó': 'O', 'Ô': 'O', 'Õ': 'O', 'Ö': 'O',
  'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u',
  'Ù': 'U', 'Ú': 'U', 'Û': 'U', 'Ü': 'U',
  'ç': 'c', 'Ç': 'C', 'ñ': 'n', 'Ñ': 'N',
  '×': 'x', '·': '-', '–': '-', '—': '-', '−': '-',
  '‘': "'", '’': "'", '“': '"', '”': '"', '…': '...',
};

/// [text] as plain ASCII on one line: white space of any kind (Rupiah amounts
/// hold a no-break space) is a space, control characters go, accents come
/// off, and anything else, an emoji for one, is a `?`.
String asciiOnly(String text) {
  final out = StringBuffer();
  for (final rune in text.runes) {
    final char = String.fromCharCode(rune);
    if (rune == 0x09 || rune == 0x0A || rune == 0x0D || rune == 0xA0) {
      out.write(' ');
    } else if (rune < 0x20 || (rune >= 0x7F && rune < 0xA0)) {
      continue;
    } else if (rune < 0x7F) {
      out.write(char);
    } else if (char.trim().isEmpty) {
      out.write(' ');
    } else {
      out.write(_folded[char] ?? '?');
    }
  }
  return out.toString();
}

/// [text] in lines of at most [columns], broken between words, and inside a
/// word only when the word alone is too long. Empty text has no lines.
List<String> wrapText(String text, int columns) {
  final lines = <String>[];
  var line = '';
  for (var word in text.split(' ').where((word) => word.isNotEmpty)) {
    if (line.isNotEmpty && line.length + 1 + word.length <= columns) {
      line = '$line $word';
      continue;
    }
    if (line.isNotEmpty) lines.add(line);
    while (word.length > columns) {
      lines.add(word.substring(0, columns));
      word = word.substring(columns);
    }
    line = word;
  }
  if (line.isNotEmpty) lines.add(line);
  return lines;
}
