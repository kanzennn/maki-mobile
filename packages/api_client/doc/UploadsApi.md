# maki_api_client.api.UploadsApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**presignUpload**](UploadsApi.md#presignupload) | **POST** /api/v1/uploads/presign | Ask for a place to upload a photo to


# **presignUpload**
> UploadTicket presignUpload(presignUploadRequest)

Ask for a place to upload a photo to

The client then sends the file with `PUT` to `upload_url`, straight to the private bucket, with the `Content-Type` it named here and exactly the size it named here, both of which are signed in. It has 5 minutes. It then sends `upload_key` when saving a menu or an account, or to `PUT /api/v1/me/photo`. An upload nobody claims is deleted after 24 hours.  The worker opens the file: it must really be a JPG, PNG or WebP of at most 8000 × 8000 pixels. One that isn't is logged and deleted, and the row keeps the photo it has. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getUploadsApi();
final PresignUploadRequest presignUploadRequest = ; // PresignUploadRequest | 

try {
    final response = api.presignUpload(presignUploadRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UploadsApi->presignUpload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **presignUploadRequest** | [**PresignUploadRequest**](PresignUploadRequest.md)|  | 

### Return type

[**UploadTicket**](UploadTicket.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

