# maki_api_client.api.RealtimeApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**connectRealtime**](RealtimeApi.md#connectrealtime) | **GET** /api/v1/outlets/{oid}/realtime | The outlet&#39;s live messages, over a WebSocket
[**createRealtimeTicket**](RealtimeApi.md#createrealtimeticket) | **POST** /api/v1/outlets/{oid}/realtime/ticket | A ticket to connect to the outlet&#39;s live messages


# **connectRealtime**
> connectRealtime(ticket, oid)

The outlet's live messages, over a WebSocket

A WebSocket upgrade. Each message is JSON, `{\"topics\": [...]}`, naming what changed: `catalog` (menus, prices, stock, rates, payment methods), `tables` (areas, tables, schedules, the dine-in mode) or `orders` (sales and voids); the client loads that data again through its usual endpoints. The server closes with code 4000 when the client should connect again with a new ticket, which it does at the latest after 15 minutes. A client that was away should reload everything it shows when it is back. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRealtimeApi();
final String ticket = ticket_example; // String | 
final String oid = oid_example; // String | 

try {
    api.connectRealtime(ticket, oid);
} on DioException catch (e) {
    print('Exception when calling RealtimeApi->connectRealtime: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ticket** | **String**|  | 
 **oid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createRealtimeTicket**
> RealtimeTicket createRealtimeTicket(oid)

A ticket to connect to the outlet's live messages

For whoever may act in the outlet. Good for one connection, within the seconds it says. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getRealtimeApi();
final String oid = oid_example; // String | 

try {
    final response = api.createRealtimeTicket(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RealtimeApi->createRealtimeTicket: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**RealtimeTicket**](RealtimeTicket.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

