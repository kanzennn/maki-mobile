# maki_api_client.model.OrderSummary

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**orderId** | **String** |  | 
**orderNo** | **String** |  | 
**deviceId** | **String** |  | 
**type** | [**OrderType**](OrderType.md) |  | 
**tableName** | **String** | The table's name as it was at the sale; null for none. | 
**standNumber** | **String** | The number on the customer's stand; null for none. | 
**status** | [**OrderStatus**](OrderStatus.md) |  | 
**total** | **int** |  | 
**itemCount** | **int** | Every line's qty, together. | 
**paymentMethod** | [**PaymentMethod**](PaymentMethod.md) |  | 
**cashier** | [**OrderPerson**](OrderPerson.md) |  | 
**clientCreatedAt** | [**DateTime**](DateTime.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


