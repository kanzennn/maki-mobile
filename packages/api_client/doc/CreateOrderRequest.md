# maki_api_client.model.CreateOrderRequest

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**orderId** | **String** | Made by the device, a CUID2; the order's idempotency key. | 
**orderNo** | **String** |  | 
**type** | [**OrderType**](OrderType.md) |  | 
**tableId** | **String** | The table a dine-in order seats its customers at; null or blank for none, as it may be. | [optional] 
**standNumber** | **String** | The number on the stand a dine-in customer took, where the outlet seats them by number stands: 1–10 letters, digits and hyphens, a hyphen only between them, kept in capitals. Null or blank for none.  | [optional] 
**clientCreatedAt** | [**DateTime**](DateTime.md) | When the device made the order. | 
**items** | [**List&lt;CreateOrderItem&gt;**](CreateOrderItem.md) |  | 
**voucherCode** | **String** | The voucher the customer gave, in any case; one per order. Null or blank for none. | [optional] 
**total** | **int** | What the cashier charged, which must be the server's total. | 
**payment** | [**CreateOrderPayment**](CreateOrderPayment.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


