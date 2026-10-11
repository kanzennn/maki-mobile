# maki_api_client.api.RoleApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRole**](RoleApi.md#createrole) | **POST** /api/v1/outlets/{oid}/roles | Create a role
[**deleteRole**](RoleApi.md#deleterole) | **DELETE** /api/v1/outlets/{oid}/roles/{rid} | Delete a role nobody holds
[**getRole**](RoleApi.md#getrole) | **GET** /api/v1/outlets/{oid}/roles/{rid} | One role, with the users who hold it
[**listPermissions**](RoleApi.md#listpermissions) | **GET** /api/v1/permissions | Every permission, grouped by module
[**listRoles**](RoleApi.md#listroles) | **GET** /api/v1/outlets/{oid}/roles | The outlet&#39;s roles
[**updateRole**](RoleApi.md#updaterole) | **PUT** /api/v1/outlets/{oid}/roles/{rid} | Change a role


# **createRole**
> RoleDetail createRole(oid, roleInput)

Create a role

Needs `role.manage`. The role may only hold permissions the caller holds themselves. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();
final String oid = oid_example; // String | 
final RoleInput roleInput = ; // RoleInput | 

try {
    final response = api.createRole(oid, roleInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->createRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **roleInput** | [**RoleInput**](RoleInput.md)|  | 

### Return type

[**RoleDetail**](RoleDetail.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRole**
> deleteRole(oid, rid)

Delete a role nobody holds

Needs `role.manage`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();
final String oid = oid_example; // String | 
final String rid = rid_example; // String | 

try {
    api.deleteRole(oid, rid);
} on DioException catch (e) {
    print('Exception when calling RoleApi->deleteRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **rid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRole**
> RoleDetail getRole(oid, rid)

One role, with the users who hold it

Needs `role.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();
final String oid = oid_example; // String | 
final String rid = rid_example; // String | 

try {
    final response = api.getRole(oid, rid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->getRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **rid** | **String**|  | 

### Return type

[**RoleDetail**](RoleDetail.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPermissions**
> PermissionCatalog listPermissions()

Every permission, grouped by module

The catalog a role's checklist shows. Any signed-in user.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();

try {
    final response = api.listPermissions();
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->listPermissions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PermissionCatalog**](PermissionCatalog.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listRoles**
> RoleList listRoles(oid, page, pageSize)

The outlet's roles

Needs `role.view`, or `user.view`: whoever sees the outlet's users filters them by role, and gives one when managing them. Sorted by name. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();
final String oid = oid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listRoles(oid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->listRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**RoleList**](RoleList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRole**
> RoleDetail updateRole(oid, rid, roleInput)

Change a role

Needs `role.manage`. Permissions the change adds must be the caller's own; it may keep or drop ones the caller lacks. The role's users get the new permissions from their next request. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRoleApi();
final String oid = oid_example; // String | 
final String rid = rid_example; // String | 
final RoleInput roleInput = ; // RoleInput | 

try {
    final response = api.updateRole(oid, rid, roleInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->updateRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **rid** | **String**|  | 
 **roleInput** | [**RoleInput**](RoleInput.md)|  | 

### Return type

[**RoleDetail**](RoleDetail.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

