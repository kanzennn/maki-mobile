# maki_api_client.api.AuthApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**forgotPassword**](AuthApi.md#forgotpassword) | **POST** /api/v1/auth/password/forgot | Ask for a password reset link
[**login**](AuthApi.md#login) | **POST** /api/v1/auth/login | Sign in with username and password
[**logout**](AuthApi.md#logout) | **POST** /api/v1/auth/logout | Sign out of this session
[**refreshSession**](AuthApi.md#refreshsession) | **POST** /api/v1/auth/refresh | Exchange the refresh token for a new access token
[**resetPassword**](AuthApi.md#resetpassword) | **POST** /api/v1/auth/password/reset | Choose a new password with the emailed link&#39;s token
[**verifyEmail**](AuthApi.md#verifyemail) | **POST** /api/v1/auth/email/verify | Confirm an email address with the emailed link&#39;s token


# **forgotPassword**
> forgotPassword(forgotPasswordRequest)

Ask for a password reset link

Only the Owner resets their own password this way; Managers and staff are reset by the Owner or their Manager. If `login` is the Owner's username or verified email, a link valid for 30 minutes is emailed. The answer is the same whether or not that happened, so it reveals nothing about which accounts exist. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getAuthApi();
final ForgotPasswordRequest forgotPasswordRequest = ; // ForgotPasswordRequest | 

try {
    api.forgotPassword(forgotPasswordRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->forgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **forgotPasswordRequest** | [**ForgotPasswordRequest**](ForgotPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> Session login(loginRequest)

Sign in with username and password

Starts a session. With `client: web` the refresh token comes as the `maki_refresh` cookie (HttpOnly, SameSite=Strict, path `/api/v1/auth`); with `client: mobile` it comes in the body.  A user whose password was set by someone else can sign in, but has `must_change_password: true` and gets 403 `password_change_required` from every endpoint except `GET /me` and `PUT /me/password` until they change it. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    final response = api.login(loginRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | 

### Return type

[**Session**](Session.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logout**
> logout(refreshRequest)

Sign out of this session

Ends the session named by the refresh token (the cookie, or `refresh_token` in the body) or else by the access token, and clears the cookie. Always succeeds, so it is safe to call twice. 

### Example
```dart
import 'package:maki_api_client/api.dart';
// TODO Configure API key authorization: refreshCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('refreshCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('refreshCookie').apiKeyPrefix = 'Bearer';

final api = MakiApiClient().getAuthApi();
final RefreshRequest refreshRequest = ; // RefreshRequest | 

try {
    api.logout(refreshRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->logout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[refreshCookie](../README.md#refreshCookie), [accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshSession**
> Session refreshSession(refreshRequest)

Exchange the refresh token for a new access token

The web app sends no body: the browser sends the `maki_refresh` cookie, and the new refresh token comes back as the cookie. The Android app sends `refresh_token` and gets the new one in the body. Either way the old refresh token stops working. 

### Example
```dart
import 'package:maki_api_client/api.dart';
// TODO Configure API key authorization: refreshCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('refreshCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('refreshCookie').apiKeyPrefix = 'Bearer';

final api = MakiApiClient().getAuthApi();
final RefreshRequest refreshRequest = ; // RefreshRequest | 

try {
    final response = api.refreshSession(refreshRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->refreshSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshRequest** | [**RefreshRequest**](RefreshRequest.md)|  | [optional] 

### Return type

[**Session**](Session.md)

### Authorization

[refreshCookie](../README.md#refreshCookie)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetPassword**
> resetPassword(resetPasswordRequest)

Choose a new password with the emailed link's token

The token comes from the link's URL fragment (`#token=…`). On success every session of the account is signed out and a notice is emailed. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getAuthApi();
final ResetPasswordRequest resetPasswordRequest = ; // ResetPasswordRequest | 

try {
    api.resetPassword(resetPasswordRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->resetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resetPasswordRequest** | [**ResetPasswordRequest**](ResetPasswordRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyEmail**
> verifyEmail(tokenRequest)

Confirm an email address with the emailed link's token

The token comes from the link's URL fragment (`#token=…`). The new address replaces the old one only now. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getAuthApi();
final TokenRequest tokenRequest = ; // TokenRequest | 

try {
    api.verifyEmail(tokenRequest);
} on DioException catch (e) {
    print('Exception when calling AuthApi->verifyEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenRequest** | [**TokenRequest**](TokenRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

