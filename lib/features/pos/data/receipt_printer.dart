import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';

/// A printer paired with this phone in Android's Bluetooth settings.
@immutable
class PairedPrinter {
  const PairedPrinter({required this.name, required this.address});

  final String name;
  final String address;

  @override
  bool operator ==(Object other) =>
      other is PairedPrinter && other.name == name && other.address == address;

  @override
  int get hashCode => Object.hash(name, address);
}

/// Why a printer wasn't reached.
enum PrinterProblem {
  /// None chosen yet on this phone.
  noPrinter,

  /// This phone has no Bluetooth.
  unavailable,

  /// Bluetooth is turned off.
  bluetoothOff,

  /// The user refused the permission to use it.
  permissionDenied,

  /// The printer didn't answer: off, out of range, or busy with another phone.
  connectFailed,

  /// The connection broke while sending.
  sendFailed,
}

class PrinterException implements Exception {
  const PrinterException(this.problem);

  final PrinterProblem problem;
}

/// The phone's way to its printers (android/.../BluetoothPrinterChannel.kt).
abstract interface class PrinterBridge {
  /// Asks for the permission first, if it is still needed.
  Future<List<PairedPrinter>> paired();

  /// Sends [bytes], whole, over a connection of its own.
  Future<void> send(String address, Uint8List bytes);
}

class BluetoothPrinterBridge implements PrinterBridge {
  static const _channel = MethodChannel('com.kervzent.maki_mobile/printer');

  @override
  Future<List<PairedPrinter>> paired() => _call(() async {
    final printers = await _channel.invokeListMethod<Map<Object?, Object?>>(
      'paired',
    );
    return [
      for (final printer in printers ?? const <Map<Object?, Object?>>[])
        PairedPrinter(
          name: printer['name']! as String,
          address: printer['address']! as String,
        ),
    ];
  });

  @override
  Future<void> send(String address, Uint8List bytes) => _call(
    () => _channel.invokeMethod<void>('send', {
      'address': address,
      'bytes': bytes,
    }),
  );

  Future<T> _call<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on PlatformException catch (error) {
      throw PrinterException(switch (error.code) {
        'unavailable' => PrinterProblem.unavailable,
        'bluetooth_off' => PrinterProblem.bluetoothOff,
        'permission_denied' => PrinterProblem.permissionDenied,
        'connect_failed' => PrinterProblem.connectFailed,
        _ => PrinterProblem.sendFailed,
      });
    }
  }
}

/// How this phone prints: its printer, its roll, and printing without asking.
class PrinterSettings {
  const PrinterSettings({
    this.printer,
    this.paper = PaperWidth.mm58,
    this.auto = false,
  });

  /// What was stored, or the defaults for what can't be read.
  factory PrinterSettings.fromJson(Map<String, Object?> json) {
    final name = json['name'];
    final address = json['address'];
    return PrinterSettings(
      printer: name is String && address is String
          ? PairedPrinter(name: name, address: address)
          : null,
      paper: json['paper'] == PaperWidth.mm80.name
          ? PaperWidth.mm80
          : PaperWidth.mm58,
      auto: json['auto'] == true,
    );
  }

  final PairedPrinter? printer;
  final PaperWidth paper;
  final bool auto;

  Map<String, Object?> toJson() => {
    'name': printer?.name,
    'address': printer?.address,
    'paper': paper.name,
    'auto': auto,
  };
}

/// Where the settings live. They are the phone's, so signing out keeps them.
abstract interface class PrinterSettingsStorage {
  Future<PrinterSettings> read();
  Future<void> write(PrinterSettings settings);
}

/// In the secure storage the app already has: nothing here is a secret, and
/// it spares the app a second way to store things on the phone.
class SecurePrinterSettingsStorage implements PrinterSettingsStorage {
  SecurePrinterSettingsStorage([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'printer_settings';

  final FlutterSecureStorage _storage;

  @override
  Future<PrinterSettings> read() async {
    final stored = await _storage.read(key: _key);
    if (stored == null) return const PrinterSettings();
    try {
      return PrinterSettings.fromJson(
        (jsonDecode(stored) as Map).cast<String, Object?>(),
      );
    } on Object {
      return const PrinterSettings();
    }
  }

  @override
  Future<void> write(PrinterSettings settings) =>
      _storage.write(key: _key, value: jsonEncode(settings.toJson()));
}
