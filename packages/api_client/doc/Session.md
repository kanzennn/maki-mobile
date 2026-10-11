# maki_api_client.model.Session

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**accessToken** | **String** |  | 
**tokenType** | **String** |  | 
**expiresIn** | **int** | Seconds until the access token expires (900). Relative, so a wrong device clock doesn't matter. | 
**refreshToken** | **String** | Only for `client: mobile`. Store it in secure storage; it replaces the previous one. | [optional] 
**refreshExpiresIn** | **int** | Only with `refresh_token`. Seconds until it expires if unused. | [optional] 
**user** | [**Me**](Me.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


