import 'dart:typed_data';

import 'package:maki_mobile/features/pos/data/receipt_printer.dart';

const testPrinter = PairedPrinter(name: 'RPP02N', address: '66:22:B2:00:00:01');

/// Android's Bluetooth and the phone's settings, in memory: what was sent and
/// saved, and the problems to answer with.
class FakePrinter implements PrinterBridge, PrinterSettingsStorage {
  FakePrinter({
    this.settings = const PrinterSettings(),
    this.printers = const [testPrinter],
  });

  PrinterSettings settings;
  List<PairedPrinter> printers;
  PrinterProblem? listProblem;
  PrinterProblem? sendProblem;
  final sent = <(String, Uint8List)>[];
  int saves = 0;

  @override
  Future<List<PairedPrinter>> paired() async {
    if (listProblem case final problem?) throw PrinterException(problem);
    return printers;
  }

  @override
  Future<void> send(String address, Uint8List bytes) async {
    if (sendProblem case final problem?) throw PrinterException(problem);
    sent.add((address, bytes));
  }

  @override
  Future<PrinterSettings> read() async => settings;

  @override
  Future<void> write(PrinterSettings settings) async {
    this.settings = settings;
    saves++;
  }
}

/// The lines [ticket] prints. It fails on any control byte that isn't a
/// command the app means to send, so a menu's name can't slip one in.
List<String> ticketLines(Uint8List ticket) {
  final lines = <String>[];
  final line = StringBuffer();
  var i = 0;
  while (i < ticket.length) {
    final byte = ticket[i];
    if (byte == 0x1B) {
      final command = ticket[i + 1];
      if (command == 0x40) {
        i += 2;
      } else if (command == 0x61 || command == 0x45) {
        i += 3;
      } else {
        throw StateError('Unknown ESC command $command');
      }
    } else if (byte == 0x1D) {
      final command = ticket[i + 1];
      if (command == 0x21) {
        i += 3;
      } else if (command == 0x56) {
        i += 4;
      } else {
        throw StateError('Unknown GS command $command');
      }
    } else if (byte == 0x0A) {
      lines.add(line.toString());
      line.clear();
      i++;
    } else if (byte >= 0x20 && byte < 0x7F) {
      line.writeCharCode(byte);
      i++;
    } else {
      throw StateError('Byte $byte is not plain ASCII');
    }
  }
  return lines;
}
