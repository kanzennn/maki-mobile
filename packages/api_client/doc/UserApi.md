# maki_api_client.api.UserApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createStaff**](UserApi.md#createstaff) | **POST** /api/v1/outlets/{oid}/users | Create a Manager or staff account
[**deleteStaff**](UserApi.md#deletestaff) | **DELETE** /api/v1/outlets/{oid}/users/{uid} | Delete an account
[**getStaff**](UserApi.md#getstaff) | **GET** /api/v1/outlets/{oid}/users/{uid} | One of the outlet&#39;s users
[**listStaff**](UserApi.md#liststaff) | **GET** /api/v1/outlets/{oid}/users | The outlet&#39;s users
[**resetStaffPassword**](UserApi.md#resetstaffpassword) | **POST** /api/v1/outlets/{oid}/users/{uid}/reset-password | Give an account a temporary password
[**setStaffStatus**](UserApi.md#setstaffstatus) | **PATCH** /api/v1/outlets/{oid}/users/{uid}/status | Activate or deactivate an account
[**updateStaff**](UserApi.md#updatestaff) | **PUT** /api/v1/outlets/{oid}/users/{uid} | Change an account


# **createStaff**
> Staff createStaff(oid, createStaffRequest)

Create a Manager or staff account

Needs `user.manage`. A Manager account (`is_manager`) is the Owner's to create; a staff account, with its `role_id`, everyone else's. The password is temporary: the user changes it at the first sign-in. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final CreateStaffRequest createStaffRequest = ; // CreateStaffRequest | 

try {
    final response = api.createStaff(oid, createStaffRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->createStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **createStaffRequest** | [**CreateStaffRequest**](CreateStaffRequest.md)|  | 

### Return type

[**Staff**](Staff.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteStaff**
> deleteStaff(oid, uid)

Delete an account

Needs `user.manage`. Its sessions end; its username stays taken, and its data stays in the name it had. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String uid = uid_example; // String | 

try {
    api.deleteStaff(oid, uid);
} on DioException catch (e) {
    print('Exception when calling UserApi->deleteStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **uid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStaff**
> Staff getStaff(oid, uid)

One of the outlet's users

Needs `user.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String uid = uid_example; // String | 

try {
    final response = api.getStaff(oid, uid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->getStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **uid** | **String**|  | 

### Return type

[**Staff**](Staff.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStaff**
> StaffList listStaff(oid, q, status, roleId, page, pageSize)

The outlet's users

Needs `user.view`. Sorted by name; deleted users never show.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String q = q_example; // String | Part of the name or the username, in any case.
final String status = status_example; // String | 
final String roleId = roleId_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listStaff(oid, q, status, roleId, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->listStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **q** | **String**| Part of the name or the username, in any case. | [optional] 
 **status** | **String**|  | [optional] 
 **roleId** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**StaffList**](StaffList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetStaffPassword**
> resetStaffPassword(oid, uid, resetStaffPasswordRequest)

Give an account a temporary password

Needs `user.manage`. The user must change it at their next sign-in; their sessions end at once. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String uid = uid_example; // String | 
final ResetStaffPasswordRequest resetStaffPasswordRequest = ; // ResetStaffPasswordRequest | 

try {
    api.resetStaffPassword(oid, uid, resetStaffPasswordRequest);
} on DioException catch (e) {
    print('Exception when calling UserApi->resetStaffPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **uid** | **String**|  | 
 **resetStaffPasswordRequest** | [**ResetStaffPasswordRequest**](ResetStaffPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setStaffStatus**
> Staff setStaffStatus(oid, uid, staffStatusRequest)

Activate or deactivate an account

Needs `user.manage`. Deactivating ends the user's sessions at once.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String uid = uid_example; // String | 
final StaffStatusRequest staffStatusRequest = ; // StaffStatusRequest | 

try {
    final response = api.setStaffStatus(oid, uid, staffStatusRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->setStaffStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **uid** | **String**|  | 
 **staffStatusRequest** | [**StaffStatusRequest**](StaffStatusRequest.md)|  | 

### Return type

[**Staff**](Staff.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStaff**
> Staff updateStaff(oid, uid, updateStaffRequest)

Change an account

Needs `user.manage`. Changes the name, email and phone, and the role or rank. The Owner promotes a staff member with `is_manager: true`, and makes a Manager staff again with `is_manager: false` and a `role_id`; either ends the user's sessions. An email changed here isn't verified. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUserApi();
final String oid = oid_example; // String | 
final String uid = uid_example; // String | 
final UpdateStaffRequest updateStaffRequest = ; // UpdateStaffRequest | 

try {
    final response = api.updateStaff(oid, uid, updateStaffRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UserApi->updateStaff: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **uid** | **String**|  | 
 **updateStaffRequest** | [**UpdateStaffRequest**](UpdateStaffRequest.md)|  | 

### Return type

[**Staff**](Staff.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

