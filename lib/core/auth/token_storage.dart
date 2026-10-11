import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Where the session's refresh token lives between app launches. The access
/// token is kept in memory only: a launch gets a new one by refreshing.
abstract interface class TokenStorage {
  Future<String?> readRefreshToken();
  Future<void> writeRefreshToken(String token);

  /// Forgets the session. The device token isn't the session's, so it stays.
  Future<void> clear();
}

/// Tokens in the Android Keystore, never in SharedPreferences or plain
/// Drift tables (architecture standard §9).
class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _storage;

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  @override
  Future<void> writeRefreshToken(String token) =>
      _storage.write(key: _refreshTokenKey, value: token);

  // Only its own key: the device token sits in the same storage.
  @override
  Future<void> clear() => _storage.delete(key: _refreshTokenKey);
}
