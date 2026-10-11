# maki_api_client.api.HealthApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getHealthz**](HealthApi.md#gethealthz) | **GET** /healthz | Liveness probe
[**getReadyz**](HealthApi.md#getreadyz) | **GET** /readyz | Readiness probe


# **getHealthz**
> Status getHealthz()

Liveness probe

Reports that the process is up. Never touches dependencies.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getHealthApi();

try {
    final response = api.getHealthz();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->getHealthz: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Status**](Status.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getReadyz**
> Status getReadyz()

Readiness probe

Reports whether the database answers within two seconds.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getHealthApi();

try {
    final response = api.getReadyz();
    print(response);
} on DioException catch (e) {
    print('Exception when calling HealthApi->getReadyz: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Status**](Status.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

