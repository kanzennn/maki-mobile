# maki_api_client.model.Order

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
**tableId** | **String** | The table a dine-in sale seated its customers at; null for none. | 
**tableName** | **String** | The table's name as it was then, for the receipt; null for none. | 
**standNumber** | **String** | The number on the stand a dine-in customer took, where a waiter brings the order; null for none. | 
**status** | [**OrderStatus**](OrderStatus.md) |  | 
**cashier** | [**OrderPerson**](OrderPerson.md) |  | 
**items** | [**List&lt;OrderItem&gt;**](OrderItem.md) |  | 
**subtotal** | **int** |  | 
**voucherCode** | **String** | The code of the voucher the sale used, as it was then, for the receipt; null for none. | 
**voucherDiscount** | **int** |  | 
**serviceBps** | **int** | The rate the order was charged at. | 
**service** | **int** |  | 
**taxBps** | **int** |  | 
**tax** | **int** |  | 
**total** | **int** |  | 
**payment** | [**OrderPayment**](OrderPayment.md) |  | 
**clientCreatedAt** | [**DateTime**](DateTime.md) | When the device made it. | 
**createdAt** | [**DateTime**](DateTime.md) | When the server took it. | 
**voidedAt** | [**DateTime**](DateTime.md) |  | 
**voidedBy** | [**OrderPerson**](OrderPerson.md) |  | 
**voidReason** | **String** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


