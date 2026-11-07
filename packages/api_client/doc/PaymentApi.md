# maki_api_client.api.PaymentApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listPaymentMethods**](PaymentApi.md#listpaymentmethods) | **GET** /api/v1/outlets/{oid}/payment-methods | The outlet&#39;s Payment Control
[**setPaymentMethods**](PaymentApi.md#setpaymentmethods) | **PUT** /api/v1/outlets/{oid}/payment-methods | Turn the outlet&#39;s payment methods on or off


# **listPaymentMethods**
> PaymentMethods listPaymentMethods(oid)

The outlet's Payment Control

Needs `payment.manage`. Every method, in the cashier's order.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getPaymentApi();
final String oid = oid_example; // String | 

try {
    final response = api.listPaymentMethods(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentApi->listPaymentMethods: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**PaymentMethods**](PaymentMethods.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setPaymentMethods**
> PaymentMethods setPaymentMethods(oid, setPaymentMethodsRequest)

Turn the outlet's payment methods on or off

Needs `payment.manage`. Methods left out stay as they are. Cash stays on (`payment_method_required`), and a method not released yet can't be turned on (`payment_method_coming_soon`). A change is `payment.updated` in the Log Action; saving what is so records nothing. Each method's `method` is `required`, `oneof` or `duplicate`, and its `is_enabled` is `required`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getPaymentApi();
final String oid = oid_example; // String | 
final SetPaymentMethodsRequest setPaymentMethodsRequest = ; // SetPaymentMethodsRequest | 

try {
    final response = api.setPaymentMethods(oid, setPaymentMethodsRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling PaymentApi->setPaymentMethods: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **setPaymentMethodsRequest** | [**SetPaymentMethodsRequest**](SetPaymentMethodsRequest.md)|  | 

### Return type

[**PaymentMethods**](PaymentMethods.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

