import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/token_storage.dart';
import 'package:mocktail/mocktail.dart';

class _MockSecureStorage extends Mock implements FlutterSecureStorage;

void main() {
  late _MockSecureStorage storage;

  setUp(() {
    storage = _MockSecureStorage();
    when(() => storage.delete(key: any(named: 'key'))).thenAnswer((_) async {});
    when(
      () => storage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
  });

  test(
    'signing out forgets the refresh token and keeps the device token',
    () async {
      await SecureTokenStorage(storage).clear();

      verify(() => storage.delete(key: 'refresh_token')).called(1);
      verifyNever(() => storage.delete(key: 'device_token'));
      verifyNever(() => storage.deleteAll());
    },
  );

  test('the device token has a key of its own', () async {
    when(() => storage.read(key: 'device_token')).thenAnswer((_) async => 'd');
    final store = DeviceTokenStore(SecureDeviceTokenStorage(storage));

    await store.load();
    expect(store.token, 'd');

    await store.save('d2');
    verify(() => storage.write(key: 'device_token', value: 'd2')).called(1);
    expect(store.token, 'd2');

    await store.clear();
    verify(() => storage.delete(key: 'device_token')).called(1);
    verifyNever(() => storage.delete(key: 'refresh_token'));
    expect(store.token, isNull);
  });
}
