# maki_api_client.model.Error

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Stable, machine-readable error code that clients switch on. | 
**message** | **String** | Safe to show to the user, in the language of `Accept-Language` (Indonesian by default); a fallback when the client has no translation for `code`.  | 
**details** | **Map&lt;String, Object&gt;** | Machine-readable extra data, such as the remaining stock. | [optional] 
**requestId** | **String** | Matches the X-Request-ID response header and the server logs. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


