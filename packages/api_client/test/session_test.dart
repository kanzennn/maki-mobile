import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for Session
void main() {
  final Session? instance = /* Session(...) */ null;
  // TODO add properties to the entity

  group(Session, () {
    // String accessToken
    test('to test the property `accessToken`', () async {
      // TODO
    });

    // String tokenType
    test('to test the property `tokenType`', () async {
      // TODO
    });

    // Seconds until the access token expires (900). Relative, so a wrong device clock doesn't matter.
    // int expiresIn
    test('to test the property `expiresIn`', () async {
      // TODO
    });

    // Only for `client: mobile`. Store it in secure storage; it replaces the previous one.
    // String refreshToken
    test('to test the property `refreshToken`', () async {
      // TODO
    });

    // Only with `refresh_token`. Seconds until it expires if unused.
    // int refreshExpiresIn
    test('to test the property `refreshExpiresIn`', () async {
      // TODO
    });

    // Me user
    test('to test the property `user`', () async {
      // TODO
    });

  });
}
