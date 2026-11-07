# maki_api_client.api.LogApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listOutletLogs**](LogApi.md#listoutletlogs) | **GET** /api/v1/outlets/{oid}/logs | The outlet&#39;s Log Action
[**listOwnerLogs**](LogApi.md#listownerlogs) | **GET** /api/v1/owner/logs | The Log Action of every outlet


# **listOutletLogs**
> ActionLogList listOutletLogs(oid, from, to, action, userId, page, pageSize)

The outlet's Log Action

Needs `log.view`. The outlet's entries alone, newest first.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getLogApi();
final String oid = oid_example; // String | 
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | From this instant.
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | Up to, not including, this instant, after `from`.
final String action = action_example; // String | Comma-separated. These actions alone.
final String userId = userId_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listOutletLogs(oid, from, to, action, userId, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LogApi->listOutletLogs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **from** | **DateTime**| From this instant. | [optional] 
 **to** | **DateTime**| Up to, not including, this instant, after `from`. | [optional] 
 **action** | **String**| Comma-separated. These actions alone. | [optional] 
 **userId** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**ActionLogList**](ActionLogList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOwnerLogs**
> ActionLogList listOwnerLogs(from, to, action, outletIds, self, page, pageSize)

The Log Action of every outlet

The Owner, with `log.view`. Every entry, newest first.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getLogApi();
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | From this instant.
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | Up to, not including, this instant, after `from`.
final String action = action_example; // String | Comma-separated. These actions alone.
final String outletIds = outletIds_example; // String | Comma-separated. Entries of these outlets alone.
final bool self = true; // bool | The Owner's own actions alone.
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listOwnerLogs(from, to, action, outletIds, self, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LogApi->listOwnerLogs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**| From this instant. | [optional] 
 **to** | **DateTime**| Up to, not including, this instant, after `from`. | [optional] 
 **action** | **String**| Comma-separated. These actions alone. | [optional] 
 **outletIds** | **String**| Comma-separated. Entries of these outlets alone. | [optional] 
 **self** | **bool**| The Owner's own actions alone. | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**ActionLogList**](ActionLogList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

