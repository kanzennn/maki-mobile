import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for UpdateStaffRequest
void main() {
  final UpdateStaffRequest? instance = /* UpdateStaffRequest(...) */ null;
  // TODO add properties to the entity

  group(UpdateStaffRequest, () {
    // A finished upload, to become the account's photo; the old one shows until the worker is done.
    // String uploadKey
    test('to test the property `uploadKey`', () async {
      // TODO
    });

    // Takes the photo away. `upload_key` wins if both are sent.
    // bool removePhoto
    test('to test the property `removePhoto`', () async {
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

    // String phone
    test('to test the property `phone`', () async {
      // TODO
    });

    // Required unless `is_manager`.
    // String roleId
    test('to test the property `roleId`', () async {
      // TODO
    });

    // bool isManager (default value: false)
    test('to test the property `isManager`', () async {
      // TODO
    });

  });
}
