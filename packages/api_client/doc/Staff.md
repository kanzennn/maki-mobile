# maki_api_client.model.Staff

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** |  | 
**name** | **String** |  | 
**username** | **String** |  | 
**email** | **String** |  | 
**phone** | **String** |  | 
**isManager** | **bool** |  | 
**role** | [**StaffRole**](StaffRole.md) | A staff member's role; `null` for a Manager. | 
**status** | **String** |  | 
**mustChangePassword** | **bool** | The user hasn't replaced the password someone else gave them yet. | 
**lastLoginAt** | [**DateTime**](DateTime.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


