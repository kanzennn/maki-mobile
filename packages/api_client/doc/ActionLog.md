# maki_api_client.model.ActionLog

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**actionLogId** | **String** |  | 
**action** | **String** | `<resource>.<what happened>`, such as `menu.updated`. | 
**targetType** | **String** |  | 
**targetId** | **String** |  | 
**user** | [**ActionLogUser**](ActionLogUser.md) |  | 
**outlet** | [**ActionLogOutlet**](ActionLogOutlet.md) |  | 
**device** | [**ActionLogDevice**](ActionLogDevice.md) |  | 
**before** | **Map&lt;String, Object&gt;** | The values before, as they were stored; null for none. | 
**after** | **Map&lt;String, Object&gt;** | The values after, as they were stored; null for none. | 
**ip** | **String** |  | 
**occurredAt** | [**DateTime**](DateTime.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


