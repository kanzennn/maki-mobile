import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for Error
void main() {
  final Error? instance = /* Error(...) */ null;
  // TODO add properties to the entity

  group(Error, () {
    // Stable, machine-readable error code that clients switch on.
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // Safe to show to the user, in the language of `Accept-Language` (Indonesian by default); a fallback when the client has no translation for `code`. 
    // String message
    test('to test the property `message`', () async {
      // TODO
    });

    // Machine-readable extra data, such as the remaining stock.
    // Map<String, Object> details
    test('to test the property `details`', () async {
      // TODO
    });

    // Matches the X-Request-ID response header and the server logs.
    // String requestId
    test('to test the property `requestId`', () async {
      // TODO
    });

  });
}
