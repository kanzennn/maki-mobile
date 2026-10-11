import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for Me
void main() {
  final Me? instance = /* Me(...) */ null;
  // TODO add properties to the entity

  group(Me, () {
    // String userId
    test('to test the property `userId`', () async {
      // TODO
    });

    // String username
    test('to test the property `username`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // bool emailVerified
    test('to test the property `emailVerified`', () async {
      // TODO
    });

    // An address waiting to be confirmed, after `PUT /me/email`.
    // String pendingEmail
    test('to test the property `pendingEmail`', () async {
      // TODO
    });

    // The user's own language choice; `null` follows the outlet.
    // String locale
    test('to test the property `locale`', () async {
      // TODO
    });

    // The language the user sees, after the fallbacks (own choice, outlet, `id`).
    // String language
    test('to test the property `language`', () async {
      // TODO
    });

    // bool isOwner
    test('to test the property `isOwner`', () async {
      // TODO
    });

    // bool isManager
    test('to test the property `isManager`', () async {
      // TODO
    });

    // `null` for the Owner.
    // String outletId
    test('to test the property `outletId`', () async {
      // TODO
    });

    // bool mustChangePassword
    test('to test the property `mustChangePassword`', () async {
      // TODO
    });

    // What the user may do, sorted: in their outlet, or for the Owner in any outlet. Clients show what these allow; the server checks them on every request regardless.
    // List<String> permissions
    test('to test the property `permissions`', () async {
      // TODO
    });

    // The user's outlet; `null` for the Owner.
    // OutletSummary outlet
    test('to test the property `outlet`', () async {
      // TODO
    });

  });
}
