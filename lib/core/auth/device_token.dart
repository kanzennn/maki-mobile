import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Where the device token lives: the proof, apart from whoever is signed
/// in, that the outlet's Manager activated this phone as one of the outlet's
/// cashier devices. It is the phone's, so signing out keeps it.
abstract interface class DeviceTokenStorage {
  Future<String?> read();
  Future<void> write(String token);
  Future<void> delete();
}

/// The device token in the Android Keystore, beside the refresh token
/// (architecture standard §9).
class SecureDeviceTokenStorage implements DeviceTokenStorage {
  SecureDeviceTokenStorage([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'device_token';

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> write(String token) => _storage.write(key: _key, value: token);

  @override
  Future<void> delete() => _storage.delete(key: _key);
}

/// The device token, read from storage once at startup and kept in memory,
/// so every request can carry it (`X-Device-Token`) without a trip to the
/// Keystore.
class DeviceTokenStore {
  DeviceTokenStore(this._storage);

  final DeviceTokenStorage _storage;
  String? _token;

  /// Null until the phone is activated, and once it has been revoked.
  String? get token => _token;

  Future<void> load() async => _token = await _storage.read();

  /// Keeps the token an activation returned.
  Future<void> save(String token) async {
    await _storage.write(token);
    _token = token;
  }

  /// Forgets the token: requests stop carrying it at once.
  Future<void> clear() async {
    _token = null;
    await _storage.delete();
  }
}
