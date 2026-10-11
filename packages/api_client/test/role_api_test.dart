import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for RoleApi
void main() {
  final instance = MakiApiClient().getRoleApi();

  group(RoleApi, () {
    // Create a role
    //
    // Needs `role.manage`. The role may only hold permissions the caller holds themselves. 
    //
    //Future<RoleDetail> createRole(String oid, RoleInput roleInput) async
    test('test createRole', () async {
      // TODO
    });

    // Delete a role nobody holds
    //
    // Needs `role.manage`.
    //
    //Future deleteRole(String oid, String rid) async
    test('test deleteRole', () async {
      // TODO
    });

    // One role, with the users who hold it
    //
    // Needs `role.view`.
    //
    //Future<RoleDetail> getRole(String oid, String rid) async
    test('test getRole', () async {
      // TODO
    });

    // Every permission, grouped by module
    //
    // The catalog a role's checklist shows. Any signed-in user.
    //
    //Future<PermissionCatalog> listPermissions() async
    test('test listPermissions', () async {
      // TODO
    });

    // The outlet's roles
    //
    // Needs `role.view`, or `user.view`: whoever sees the outlet's users filters them by role, and gives one when managing them. Sorted by name. 
    //
    //Future<RoleList> listRoles(String oid, { int page, int pageSize }) async
    test('test listRoles', () async {
      // TODO
    });

    // Change a role
    //
    // Needs `role.manage`. Permissions the change adds must be the caller's own; it may keep or drop ones the caller lacks. The role's users get the new permissions from their next request. 
    //
    //Future<RoleDetail> updateRole(String oid, String rid, RoleInput roleInput) async
    test('test updateRole', () async {
      // TODO
    });

  });
}
