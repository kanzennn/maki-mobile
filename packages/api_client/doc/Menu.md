# maki_api_client.model.Menu

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**menuId** | **String** |  | 
**name** | **String** |  | 
**description** | **String** |  | 
**sku** | **String** |  | 
**price** | **int** | Rupiah. | 
**imageUrl** | **String** | The 800 × 800 photo on the CDN; null for a menu without one. | 
**imageThumbUrl** | **String** | The 200 × 200 photo on the CDN; null for a menu without one. | 
**trackStock** | **bool** |  | 
**stockQty** | **int** | The count, for a tracked menu. | 
**stockAlert** | **int** | At or below it, stock is low; null or 0 is off. | 
**stockStatus** | [**StockStatus**](StockStatus.md) |  | 
**isActive** | **bool** | An inactive menu is hidden at the cashier. | 
**category** | [**MenuCategory**](MenuCategory.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


