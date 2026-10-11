# maki_api_client.api.MeApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changeEmail**](MeApi.md#changeemail) | **PUT** /api/v1/me/email | Start changing the signed-in user&#39;s email address
[**changePassword**](MeApi.md#changepassword) | **PUT** /api/v1/me/password | Change the signed-in user&#39;s password
[**getMe**](MeApi.md#getme) | **GET** /api/v1/me | The signed-in user
[**updateMe**](MeApi.md#updateme) | **PATCH** /api/v1/me | Change the signed-in user&#39;s own settings


# **changeEmail**
> changeEmail(changeEmailRequest)

Start changing the signed-in user's email address

Needs the current password. Emails a confirmation link (valid 24 hours) to the new address and a notice to the current one. The current address stays in use until the new one is confirmed with `POST /api/v1/auth/email/verify`; `Me.pending_email` shows it until then. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMeApi();
final ChangeEmailRequest changeEmailRequest = ; // ChangeEmailRequest | 

try {
    api.changeEmail(changeEmailRequest);
} on DioException catch (e) {
    print('Exception when calling MeApi->changeEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changeEmailRequest** | [**ChangeEmailRequest**](ChangeEmailRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **changePassword**
> changePassword(changePasswordRequest)

Change the signed-in user's password

Needs the current password. Every other session of the account is signed out; this one stays. Clears `must_change_password`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMeApi();
final ChangePasswordRequest changePasswordRequest = ; // ChangePasswordRequest | 

try {
    api.changePassword(changePasswordRequest);
} on DioException catch (e) {
    print('Exception when calling MeApi->changePassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordRequest** | [**ChangePasswordRequest**](ChangePasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMe**
> Me getMe()

The signed-in user

Open even while the password must be changed.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMeApi();

try {
    final response = api.getMe();
    print(response);
} on DioException catch (e) {
    print('Exception when calling MeApi->getMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Me**](Me.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMe**
> Me updateMe(updateMeRequest)

Change the signed-in user's own settings

`locale` sets the user's language on every device; `null` follows the outlet's language. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMeApi();
final UpdateMeRequest updateMeRequest = ; // UpdateMeRequest | 

try {
    final response = api.updateMe(updateMeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MeApi->updateMe: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateMeRequest** | [**UpdateMeRequest**](UpdateMeRequest.md)|  | 

### Return type

[**Me**](Me.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

