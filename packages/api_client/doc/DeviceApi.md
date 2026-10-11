# maki_api_client.api.DeviceApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activateDevice**](DeviceApi.md#activatedevice) | **POST** /api/v1/outlets/{oid}/devices | Make this device one of the outlet&#39;s cashiers
[**listDevices**](DeviceApi.md#listdevices) | **GET** /api/v1/outlets/{oid}/devices | The outlet&#39;s cashier devices
[**revokeDevice**](DeviceApi.md#revokedevice) | **DELETE** /api/v1/outlets/{oid}/devices/{did} | Revoke a device


# **activateDevice**
> ActivatedDevice activateDevice(oid, activateDeviceRequest)

Make this device one of the outlet's cashiers

Sent from the device itself, by the outlet's Manager signed in on it; not the Owner, who runs no till. The device gets the next code (`K01`, `K02`, …, never used again, since it is in the receipt numbers it makes) and a token only it holds:  - a browser (`platform: web`) as the `maki_device` cookie: `HttpOnly`,   `SameSite=Strict`, 400 days, and sent again each time the cashier   starts, so a device in use keeps it; - the Android app (`platform: android`) in the body, to keep in its   secure storage and send as `X-Device-Token`.  A request whose device is the outlet's already, and in use, is 409 `device_already_active`. Recorded as `device.activated`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getDeviceApi();
final String oid = oid_example; // String | 
final ActivateDeviceRequest activateDeviceRequest = ; // ActivateDeviceRequest | 

try {
    final response = api.activateDevice(oid, activateDeviceRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->activateDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **activateDeviceRequest** | [**ActivateDeviceRequest**](ActivateDeviceRequest.md)|  | 

### Return type

[**ActivatedDevice**](ActivatedDevice.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDevices**
> DeviceList listDevices(oid, page, pageSize)

The outlet's cashier devices

The outlet's Manager, or the Owner. Those in use first, then the revoked, each by code. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getDeviceApi();
final String oid = oid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listDevices(oid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->listDevices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**DeviceList**](DeviceList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeDevice**
> revokeDevice(oid, did)

Revoke a device

The outlet's Manager, or the Owner. The device can't sell from then on; a sale it has in progress finishes first. Revoking a revoked device changes nothing. Recorded as `device.revoked`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getDeviceApi();
final String oid = oid_example; // String | 
final String did = did_example; // String | 

try {
    api.revokeDevice(oid, did);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->revokeDevice: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **did** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

