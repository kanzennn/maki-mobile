# maki_api_client.api.VoucherApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createVoucher**](VoucherApi.md#createvoucher) | **POST** /api/v1/vouchers | Create a voucher
[**deleteVoucher**](VoucherApi.md#deletevoucher) | **DELETE** /api/v1/vouchers/{vid} | Delete a voucher no sale has used
[**getVoucher**](VoucherApi.md#getvoucher) | **GET** /api/v1/vouchers/{vid} | One voucher
[**listOutletVouchers**](VoucherApi.md#listoutletvouchers) | **GET** /api/v1/outlets/{oid}/vouchers | The vouchers an outlet&#39;s cashier can take
[**listVoucherRedemptions**](VoucherApi.md#listvoucherredemptions) | **GET** /api/v1/vouchers/{vid}/redemptions | The sales that used a voucher
[**listVouchers**](VoucherApi.md#listvouchers) | **GET** /api/v1/vouchers | List the vouchers
[**setVoucherStatus**](VoucherApi.md#setvoucherstatus) | **PATCH** /api/v1/vouchers/{vid}/status | Turn a voucher on or off
[**updateVoucher**](VoucherApi.md#updatevoucher) | **PUT** /api/v1/vouchers/{vid} | Change a voucher
[**validateVoucher**](VoucherApi.md#validatevoucher) | **POST** /api/v1/outlets/{oid}/vouchers/validate | Check the code a customer gave


# **createVoucher**
> Voucher createVoucher(voucherInput)

Create a voucher

The Owner only. Active unless `is_active` says otherwise. Recorded as `voucher.created`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final VoucherInput voucherInput = ; // VoucherInput | 

try {
    final response = api.createVoucher(voucherInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->createVoucher: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **voucherInput** | [**VoucherInput**](VoucherInput.md)|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVoucher**
> deleteVoucher(vid)

Delete a voucher no sale has used

The Owner only. The voucher disappears from every list, and its code is free again. A voucher a sale has used stays with the orders that name it (409 `voucher_used`): deactivate it instead. Recorded as `voucher.deleted`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String vid = vid_example; // String | 

try {
    api.deleteVoucher(vid);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->deleteVoucher: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVoucher**
> Voucher getVoucher(vid)

One voucher

The Owner only.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String vid = vid_example; // String | 

try {
    final response = api.getVoucher(vid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->getVoucher: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vid** | **String**|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOutletVouchers**
> VoucherList listOutletVouchers(oid, q, status, page, pageSize)

The vouchers an outlet's cashier can take

The outlet's Manager, and the Owner. The vouchers for every outlet and for this one among others, whatever their status, sorted as the Owner's list. Of the outlets a voucher is for, only this one shows. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String oid = oid_example; // String | 
final String q = q_example; // String | Part of the code or the name, in any case.
final VoucherStatus status = ; // VoucherStatus | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listOutletVouchers(oid, q, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->listOutletVouchers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **q** | **String**| Part of the code or the name, in any case. | [optional] 
 **status** | [**VoucherStatus**](.md)|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**VoucherList**](VoucherList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVoucherRedemptions**
> VoucherRedemptionList listVoucherRedemptions(vid, page, pageSize)

The sales that used a voucher

The Owner only. In every outlet, newest first, voided ones too: a void gave its use back. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String vid = vid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listVoucherRedemptions(vid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->listVoucherRedemptions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**VoucherRedemptionList**](VoucherRedemptionList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVouchers**
> VoucherList listVouchers(q, status, page, pageSize)

List the vouchers

The Owner only. The ones that run out last come first, then by code; deleted vouchers never show. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String q = q_example; // String | Part of the code or the name, in any case.
final VoucherStatus status = ; // VoucherStatus | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listVouchers(q, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->listVouchers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**| Part of the code or the name, in any case. | [optional] 
 **status** | [**VoucherStatus**](.md)|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**VoucherList**](VoucherList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setVoucherStatus**
> Voucher setVoucherStatus(vid, activeRequest)

Turn a voucher on or off

The Owner only. Off, no sale can take it from the next one on; its history stays. Recorded as `voucher.activated` or `voucher.deactivated`; setting it as it is records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String vid = vid_example; // String | 
final ActiveRequest activeRequest = ; // ActiveRequest | 

try {
    final response = api.setVoucherStatus(vid, activeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->setVoucherStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vid** | **String**|  | 
 **activeRequest** | [**ActiveRequest**](ActiveRequest.md)|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVoucher**
> Voucher updateVoucher(vid, voucherInput)

Change a voucher

The Owner only. Every field but the status (`is_active` here is ignored). Before a sale has used the voucher everything may change; once one has (`first_used_at`), voided since or not, its code and type stay, its quota only grows and its expiry only moves later. A new expiry is in the future either way. Recorded as `voucher.updated`, with the fields that changed; a change of nothing records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getVoucherApi();
final String vid = vid_example; // String | 
final VoucherInput voucherInput = ; // VoucherInput | 

try {
    final response = api.updateVoucher(vid, voucherInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->updateVoucher: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vid** | **String**|  | 
 **voucherInput** | [**VoucherInput**](VoucherInput.md)|  | 

### Return type

[**Voucher**](Voucher.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validateVoucher**
> VoucherQuote validateVoucher(oid, validateVoucherRequest)

Check the code a customer gave

Needs `checkout.create`, from one of the outlet's devices in use, as a sale does, so codes can't be tried from anywhere. Takes nothing: the sale takes its use, when it is saved.  Answers the voucher's terms, for the cashier to work its discount out again as the cart changes, and its discount on `subtotal` now. `applies` is false while `subtotal` is short of `min_spend`: the cart may still grow, and the cashier holds the payment until it does. A voucher the sale can't take is refused, first for an outlet it isn't for, then by its status. 

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

final api = MakiApiClient().getVoucherApi();
final String oid = oid_example; // String | 
final ValidateVoucherRequest validateVoucherRequest = ; // ValidateVoucherRequest | 

try {
    final response = api.validateVoucher(oid, validateVoucherRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling VoucherApi->validateVoucher: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **validateVoucherRequest** | [**ValidateVoucherRequest**](ValidateVoucherRequest.md)|  | 

### Return type

[**VoucherQuote**](VoucherQuote.md)

### Authorization

[deviceCookie](../README.md#deviceCookie), [accessToken](../README.md#accessToken), [deviceToken](../README.md#deviceToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

