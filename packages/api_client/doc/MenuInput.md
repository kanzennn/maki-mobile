# maki_api_client.model.MenuInput

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | 
**categoryId** | **String** |  | 
**price** | **int** | Rupiah. | 
**description** | **String** |  | [optional] 
**sku** | **String** | Up to 32 letters, digits, dots, dashes or underscores; unique in the outlet. | [optional] 
**trackStock** | **bool** |  | [optional] [default to false]
**initialStock** | **int** | The count tracking starts from; counts only then. | [optional] 
**stockAlert** | **int** | Ignored for an untracked menu. | [optional] 
**isActive** | **bool** | For a new menu (active when left out); PATCH …/status changes an existing one's. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


