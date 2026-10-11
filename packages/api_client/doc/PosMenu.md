# maki_api_client.model.PosMenu

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**menuId** | **String** |  | 
**categoryId** | **String** |  | 
**name** | **String** |  | 
**description** | **String** |  | 
**sku** | **String** |  | 
**price** | **int** | Rupiah. | 
**imageUrl** | **String** | The photo's address, with the upload milestone; null until then. | 
**trackStock** | **bool** |  | 
**stockQty** | **int** | The count, the most one order may take; null when the stock isn't tracked, always available. | 
**stockAlert** | **int** |  | 
**stockStatus** | [**StockStatus**](StockStatus.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


