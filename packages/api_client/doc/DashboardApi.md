# maki_api_client.api.DashboardApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getOutletDashboard**](DashboardApi.md#getoutletdashboard) | **GET** /api/v1/outlets/{oid}/dashboard | The outlet&#39;s dashboard
[**getOwnerDashboard**](DashboardApi.md#getownerdashboard) | **GET** /api/v1/owner/dashboard | The dashboard of every outlet


# **getOutletDashboard**
> Dashboard getOutletDashboard(from, to, oid)

The outlet's dashboard

Needs `dashboard.view`. The dates are in the outlet's time zone. It fills `hours`, `cashiers` and `tables`, and leaves `outlets` empty. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getDashboardApi();
final DateTime from = 2013-10-20; // DateTime | The period's first day, included.
final DateTime to = 2013-10-20; // DateTime | The period's last day, included; at most 366 days long.
final String oid = oid_example; // String | 

try {
    final response = api.getOutletDashboard(from, to, oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DashboardApi->getOutletDashboard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**| The period's first day, included. | 
 **to** | **DateTime**| The period's last day, included; at most 366 days long. | 
 **oid** | **String**|  | 

### Return type

[**Dashboard**](Dashboard.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOwnerDashboard**
> Dashboard getOwnerDashboard(from, to, outletIds)

The dashboard of every outlet

The Owner, with `dashboard.view`. Each outlet's days are its own, in its time zone. It fills `outlets`, the best first, and leaves `hours`, `cashiers` and `tables` empty. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getDashboardApi();
final DateTime from = 2013-10-20; // DateTime | The period's first day, included.
final DateTime to = 2013-10-20; // DateTime | The period's last day, included; at most 366 days long.
final String outletIds = outletIds_example; // String | Comma-separated. These outlets alone; every outlet without it.

try {
    final response = api.getOwnerDashboard(from, to, outletIds);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DashboardApi->getOwnerDashboard: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**| The period's first day, included. | 
 **to** | **DateTime**| The period's last day, included; at most 366 days long. | 
 **outletIds** | **String**| Comma-separated. These outlets alone; every outlet without it. | [optional] 

### Return type

[**Dashboard**](Dashboard.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

