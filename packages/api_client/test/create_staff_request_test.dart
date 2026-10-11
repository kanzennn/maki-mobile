import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for CreateStaffRequest
void main() {
  final CreateStaffRequest? instance = /* CreateStaffRequest(...) */ null;
  // TODO add properties to the entity

  group(CreateStaffRequest, () {
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // 3 to 32 lowercase letters, digits, dots, dashes or underscores; stored in lower case.
    // String username
    test('to test the property `username`', () async {
      // TODO
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // Temporary, 8 to 128 characters.
    // String password
    test('to test the property `password`', () async {
      // TODO
    });

    // A role of the outlet; required unless `is_manager`.
    // String roleId
    test('to test the property `roleId`', () async {
      // TODO
    });

    // A Manager account, which only the Owner creates.
    // bool isManager (default value: false)
    test('to test the property `isManager`', () async {
      // TODO
    });

  });
}
