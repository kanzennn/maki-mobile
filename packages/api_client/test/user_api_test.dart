import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for UserApi
void main() {
  final instance = MakiApiClient().getUserApi();

  group(UserApi, () {
    // Create a Manager or staff account
    //
    // Needs `user.manage`. A Manager account (`is_manager`) is the Owner's to create; a staff account, with its `role_id`, everyone else's. The password is temporary: the user changes it at the first sign-in. 
    //
    //Future<Staff> createStaff(String oid, CreateStaffRequest createStaffRequest) async
    test('test createStaff', () async {
      // TODO
    });

    // Delete an account
    //
    // Needs `user.manage`. Its sessions end; its username stays taken, and its data stays in the name it had. 
    //
    //Future deleteStaff(String oid, String uid) async
    test('test deleteStaff', () async {
      // TODO
    });

    // One of the outlet's users
    //
    // Needs `user.view`.
    //
    //Future<Staff> getStaff(String oid, String uid) async
    test('test getStaff', () async {
      // TODO
    });

    // The outlet's users
    //
    // Needs `user.view`. Sorted by name; deleted users never show.
    //
    //Future<StaffList> listStaff(String oid, { String q, String status, String roleId, int page, int pageSize }) async
    test('test listStaff', () async {
      // TODO
    });

    // Give an account a temporary password
    //
    // Needs `user.manage`. The user must change it at their next sign-in; their sessions end at once. 
    //
    //Future resetStaffPassword(String oid, String uid, ResetStaffPasswordRequest resetStaffPasswordRequest) async
    test('test resetStaffPassword', () async {
      // TODO
    });

    // Activate or deactivate an account
    //
    // Needs `user.manage`. Deactivating ends the user's sessions at once.
    //
    //Future<Staff> setStaffStatus(String oid, String uid, StaffStatusRequest staffStatusRequest) async
    test('test setStaffStatus', () async {
      // TODO
    });

    // Change an account
    //
    // Needs `user.manage`. Changes the name, email and phone, and the role or rank. The Owner promotes a staff member with `is_manager: true`, and makes a Manager staff again with `is_manager: false` and a `role_id`; either ends the user's sessions. An email changed here isn't verified. 
    //
    //Future<Staff> updateStaff(String oid, String uid, UpdateStaffRequest updateStaffRequest) async
    test('test updateStaff', () async {
      // TODO
    });

  });
}
