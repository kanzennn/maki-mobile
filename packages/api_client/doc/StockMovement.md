# maki_api_client.model.StockMovement

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**stockMovementId** | **String** |  | 
**type** | **String** | `initial`: the count tracking started from; `in`, `out`, `set`: an adjustment; `sale`, `void`: the cashier's, with their order.  | 
**qtyChange** | **int** | The change to the count, new minus old; 0 for a stock take that matched. | 
**stockAfter** | **int** | The count it left. | 
**reason** | **String** | An adjustment's reason, or `initial`; null for a sale or void. | 
**note** | **String** |  | 
**user** | [**StockMovementUser**](StockMovementUser.md) |  | 
**orderId** | **String** | The order of a sale or void. | 
**createdAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


