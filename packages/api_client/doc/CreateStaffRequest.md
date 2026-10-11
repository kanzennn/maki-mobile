# maki_api_client.model.CreateStaffRequest

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | 
**username** | **String** | 3 to 32 lowercase letters, digits, dots, dashes or underscores; stored in lower case. | 
**email** | **String** |  | [optional] 
**phone** | **String** |  | [optional] 
**password** | **String** | Temporary, 8 to 128 characters. | 
**roleId** | **String** | A role of the outlet; required unless `is_manager`. | [optional] 
**isManager** | **bool** | A Manager account, which only the Owner creates. | [optional] [default to false]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


