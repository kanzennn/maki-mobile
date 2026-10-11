# maki_api_client.api.OutletApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOutlet**](OutletApi.md#createoutlet) | **POST** /api/v1/outlets | Create an outlet
[**deleteOutlet**](OutletApi.md#deleteoutlet) | **DELETE** /api/v1/outlets/{oid} | Delete a deactivated outlet
[**getOutlet**](OutletApi.md#getoutlet) | **GET** /api/v1/outlets/{oid} | One outlet
[**listOutlets**](OutletApi.md#listoutlets) | **GET** /api/v1/outlets | List the outlets
[**setOutletStatus**](OutletApi.md#setoutletstatus) | **PATCH** /api/v1/outlets/{oid}/status | Activate or deactivate an outlet
[**updateOutlet**](OutletApi.md#updateoutlet) | **PUT** /api/v1/outlets/{oid} | Change an outlet


# **createOutlet**
> Outlet createOutlet(outletInput)

Create an outlet

The Owner only. The outlet starts active, with a cashier role (`checkout.create`) named in its language for its Manager to start from. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final OutletInput outletInput = ; // OutletInput | 

try {
    final response = api.createOutlet(outletInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OutletApi->createOutlet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **outletInput** | [**OutletInput**](OutletInput.md)|  | 

### Return type

[**Outlet**](Outlet.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOutlet**
> deleteOutlet(oid, deleteOutletRequest)

Delete a deactivated outlet

The Owner only. `confirm_name` must repeat the outlet's name. The outlet disappears from every list; its data stays, and its code is never used again. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final String oid = oid_example; // String | 
final DeleteOutletRequest deleteOutletRequest = ; // DeleteOutletRequest | 

try {
    api.deleteOutlet(oid, deleteOutletRequest);
} on DioException catch (e) {
    print('Exception when calling OutletApi->deleteOutlet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **deleteOutletRequest** | [**DeleteOutletRequest**](DeleteOutletRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOutlet**
> Outlet getOutlet(oid)

One outlet

The Owner only.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final String oid = oid_example; // String | 

try {
    final response = api.getOutlet(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OutletApi->getOutlet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**Outlet**](Outlet.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOutlets**
> OutletList listOutlets(q, status, page, pageSize)

List the outlets

The Owner only. Sorted by name; deleted outlets never show.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final String q = q_example; // String | Part of the name or the code, in any case.
final String status = status_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listOutlets(q, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OutletApi->listOutlets: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String**| Part of the name or the code, in any case. | [optional] 
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**OutletList**](OutletList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setOutletStatus**
> Outlet setOutletStatus(oid, outletStatusRequest)

Activate or deactivate an outlet

The Owner only. While an outlet is inactive its users can't sign in, and their sessions end at their next request. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final String oid = oid_example; // String | 
final OutletStatusRequest outletStatusRequest = ; // OutletStatusRequest | 

try {
    final response = api.setOutletStatus(oid, outletStatusRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OutletApi->setOutletStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **outletStatusRequest** | [**OutletStatusRequest**](OutletStatusRequest.md)|  | 

### Return type

[**Outlet**](Outlet.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOutlet**
> Outlet updateOutlet(oid, outletInput)

Change an outlet

The Owner only. Every field but the status.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getOutletApi();
final String oid = oid_example; // String | 
final OutletInput outletInput = ; // OutletInput | 

try {
    final response = api.updateOutlet(oid, outletInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OutletApi->updateOutlet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **outletInput** | [**OutletInput**](OutletInput.md)|  | 

### Return type

[**Outlet**](Outlet.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

