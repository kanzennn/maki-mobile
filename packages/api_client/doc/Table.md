# maki_api_client.model.Table

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**tableId** | **String** |  | 
**area** | [**AreaRef**](AreaRef.md) |  | 
**name** | **String** |  | 
**capacity** | **int** | Seats; null when not given. | 
**shape** | [**TableShape**](TableShape.md) |  | 
**box** | [**Box**](Box.md) | Its place on its area's layout; null while it isn't placed. | 
**rotation** | [**Rotation**](Rotation.md) |  | 
**isActive** | **bool** |  | 
**status** | [**TableStatus**](TableStatus.md) |  | 
**seated** | [**Seated**](Seated.md) | Who is seated there, while the status is `occupied`; null otherwise. | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


