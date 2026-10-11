# maki_api_client.api.OrderApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrder**](OrderApi.md#createorder) | **POST** /api/v1/outlets/{oid}/orders | Take an order the cashier charged for
[**getOrder**](OrderApi.md#getorder) | **GET** /api/v1/outlets/{oid}/orders/{orid} | An order, with its lines and payment
[**getPosCatalog**](OrderApi.md#getposcatalog) | **GET** /api/v1/outlets/{oid}/pos/catalog | Everything the cashier sells from
[**getPosDevice**](OrderApi.md#getposdevice) | **GET** /api/v1/outlets/{oid}/pos/device | The device the cashier runs on, and its receipt numbers today
[**listOrders**](OrderApi.md#listorders) | **GET** /api/v1/outlets/{oid}/orders | Today&#39;s orders
[**voidOrder**](OrderApi.md#voidorder) | **POST** /api/v1/outlets/{oid}/orders/{orid}/void | Void an order


# **createOrder**
> Order createOrder(oid, createOrderRequest)

Take an order the cashier charged for

Needs `checkout.create`, from one of the outlet's devices in use. The device makes the order's ID (a CUID2) and its receipt number, so the ID is the order's idempotency key: sending the same order again, as after a lost answer, answers 200 with the order as it was taken, never a second one, even from a device revoked since. The same ID with anything else in it, or from another outlet, is 409 `order_id_conflict`.  Everything is checked in one transaction, against the outlet as it is when the order arrives:  - the receipt number is the device's (`order_no_prefix` of   `GET …/pos/device`), carries the outlet's day of   `client_created_at`, and isn't taken (409 `order_no_taken`: the   cashier asks for the next number and sends the order again); - the payment method is on (409 `payment_method_unavailable`); - each menu is on sale (409 `menu_unavailable`, `details.menus` its   IDs), at the price the cashier showed (409 `prices_changed`,   `details.menus` each `menu_id` with its `price`), with stock enough   for its lines together (409 `order_stock_insufficient`,   `details.menus` each `menu_id` with what is `available`); - the voucher, when `voucher_code` names one, is for the sale, as   `POST …/vouchers/validate` checks it (404 `voucher_not_found`, 409   `voucher_not_for_outlet`, `voucher_inactive`, `voucher_expired`,   `voucher_used_up`, `voucher_not_started`), and the subtotal   reaches its minimum spend (409 `voucher_min_spend`,   `details.min_spend`): the cashier takes it off and says why; - the order fits how the outlet seats its dine-in customers now   (`dine_in_mode`): where they sit at tables, no `stand_number`;   where they take number stands, no `table_id`, and a dine-in order   carries its stand's `stand_number` (409 `dine_in_mode_changed`,   `details.mode` the outlet's). The Manager changed it since the   catalog was loaded: the cashier loads it again, takes the table or   the number off, and says why; - the table, when `table_id` names one (dine-in only), can be sat at:   the outlet's, not deleted, and available or occupied (409   `table_unavailable`, `details.status` the table's, `inactive` or   `scheduled`, or `missing`): the cashier takes it off and says why; - `total` is the server's, from those prices, the voucher's terms   and the outlet's rates (409 `total_changed`, `details.total` the   server's): subtotal, less the voucher's discount, then the service   charge on that, then the tax on both, each rounded to the nearest   rupiah, half up. `api/test-vectors/order-totals.json` and   `voucher-discounts.json` hold worked cases.  The menus are locked in the order of their IDs, so two cashiers selling the last one at once sell it once; then the voucher, so two outlets taking its last use at once take it once; then the outlet's dine-in mode, shared, so a change of it waits for the sale; then the table, shared with other sales at it, so a change, a release or a delete of it waits for the sale. Then the order, with its voucher's code and its table's name as they are and its stand's number, its lines with the menus' names and prices as they are, and its payment are saved; tracked stock goes down, a sale movement per menu; the voucher's use is taken; and the Log Action records `order.created`. Cash gives change from `received`. 

### Example
```dart
import 'package:maki_api_client/api.dart';
// TODO Configure API key authorization: deviceCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceCookie').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: deviceToken
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceToken').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceToken').apiKeyPrefix = 'Bearer';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 
final CreateOrderRequest createOrderRequest = ; // CreateOrderRequest | 

try {
    final response = api.createOrder(oid, createOrderRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->createOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **createOrderRequest** | [**CreateOrderRequest**](CreateOrderRequest.md)|  | 

### Return type

[**Order**](Order.md)

### Authorization

[deviceCookie](../README.md#deviceCookie), [accessToken](../README.md#accessToken), [deviceToken](../README.md#deviceToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrder**
> Order getOrder(oid, orid)

An order, with its lines and payment

Needs `checkout.create` or `order.void`. For the receipt, printed again, and the void. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 
final String orid = orid_example; // String | 

try {
    final response = api.getOrder(oid, orid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->getOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **orid** | **String**|  | 

### Return type

[**Order**](Order.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPosCatalog**
> PosCatalog getPosCatalog(oid)

Everything the cashier sells from

Needs `checkout.create`. In one answer, so a device can later keep it offline whole: the outlet for the receipt, with its rates; the payment methods it takes; and its menus in the cashier's order, with the categories that hold them.  The menus are the active menus of active categories. Those that can be sold come first, out of stock last; within each, by the categories' order, then name. Inactive and deleted menus aren't there at all. The stock is as it is now: the cashier loads the catalog again after each sale, and now and then. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 

try {
    final response = api.getPosCatalog(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->getPosCatalog: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**PosCatalog**](PosCatalog.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPosDevice**
> PosDevice getPosDevice(oid)

The device the cashier runs on, and its receipt numbers today

Needs `checkout.create`, from one of the outlet's devices in use: sent as the cashier starts. Marks the device seen, and sends a browser's `maki_device` cookie again, so a device in use keeps it.  The device makes each receipt number itself: `order_no_prefix-YYYYMMDD-NNNN`, with the outlet's day and the device's count that day, at least four digits. `next_number` is the count its next one today takes; a new day starts it at 1. The cashier asks again after `order_no_taken`. 

### Example
```dart
import 'package:maki_api_client/api.dart';
// TODO Configure API key authorization: deviceCookie
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceCookie').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceCookie').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: deviceToken
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceToken').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('deviceToken').apiKeyPrefix = 'Bearer';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 

try {
    final response = api.getPosDevice(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->getPosDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**PosDevice**](PosDevice.md)

### Authorization

[deviceCookie](../README.md#deviceCookie), [accessToken](../README.md#accessToken), [deviceToken](../README.md#deviceToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrders**
> OrderList listOrders(oid, q, page, pageSize)

Today's orders

Needs `checkout.create` or `order.void`. The outlet's orders made today, in its time zone, newest first, voided ones included. `q` narrows them to the receipt numbers holding it, in any case. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 
final String q = q_example; // String | Part of a receipt number.
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listOrders(oid, q, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->listOrders: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **q** | **String**| Part of a receipt number. | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**OrderList**](OrderList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **voidOrder**
> Order voidOrder(oid, orid, voidOrderRequest)

Void an order

Needs `order.void`, and a reason. The order and its payment become `void`; nothing else of them changes. What it sold goes back to the stock of its menus still tracked, a void movement per menu; a deleted menu's stock stays as it is. Its voucher's use is given back, the voucher turned off since or not. Recorded as `order.voided`. An order is voided once (409 `order_already_void`). 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOrderApi();
final String oid = oid_example; // String | 
final String orid = orid_example; // String | 
final VoidOrderRequest voidOrderRequest = ; // VoidOrderRequest | 

try {
    final response = api.voidOrder(oid, orid, voidOrderRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OrderApi->voidOrder: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **orid** | **String**|  | 
 **voidOrderRequest** | [**VoidOrderRequest**](VoidOrderRequest.md)|  | 

### Return type

[**Order**](Order.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

