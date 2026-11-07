//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:maki_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:maki_api_client/src/model/error_envelope.dart';
import 'package:maki_api_client/src/model/presign_upload_request.dart';
import 'package:maki_api_client/src/model/upload_ticket.dart';

class UploadsApi {

  final Dio _dio;

  const UploadsApi(this._dio);

  /// Ask for a place to upload a photo to
  /// The client then sends the file with &#x60;PUT&#x60; to &#x60;upload_url&#x60;, straight to the private bucket, with the &#x60;Content-Type&#x60; it named here and exactly the size it named here, both of which are signed in. It has 5 minutes. It then sends &#x60;upload_key&#x60; when saving a menu or an account, or to &#x60;PUT /api/v1/me/photo&#x60;. An upload nobody claims is deleted after 24 hours.  The worker opens the file: it must really be a JPG, PNG or WebP of at most 8000 × 8000 pixels. One that isn&#39;t is logged and deleted, and the row keeps the photo it has. 
  ///
  /// Parameters:
  /// * [presignUploadRequest] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [UploadTicket] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<UploadTicket>> presignUpload({ 
    required PresignUploadRequest presignUploadRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/uploads/presign';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'accessToken',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(presignUploadRequest);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    UploadTicket? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<UploadTicket, UploadTicket>(rawData, 'UploadTicket', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<UploadTicket>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
