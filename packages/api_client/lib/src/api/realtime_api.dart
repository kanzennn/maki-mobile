//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:maki_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:maki_api_client/src/model/error_envelope.dart';
import 'package:maki_api_client/src/model/realtime_ticket.dart';

class RealtimeApi {

  final Dio _dio;

  const RealtimeApi(this._dio);

  /// The outlet&#39;s live messages, over a WebSocket
  /// A WebSocket upgrade. Each message is JSON, &#x60;{\&quot;topics\&quot;: [...]}&#x60;, naming what changed: &#x60;catalog&#x60; (menus, prices, stock, rates, payment methods), &#x60;tables&#x60; (areas, tables, schedules, the dine-in mode) or &#x60;orders&#x60; (sales and voids); the client loads that data again through its usual endpoints. The server closes with code 4000 when the client should connect again with a new ticket, which it does at the latest after 15 minutes. A client that was away should reload everything it shows when it is back. 
  ///
  /// Parameters:
  /// * [ticket] 
  /// * [oid] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> connectRealtime({ 
    required String ticket,
    required String oid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/realtime'.replaceAll('{' r'oid' '}', oid.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'ticket': ticket,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// A ticket to connect to the outlet&#39;s live messages
  /// For whoever may act in the outlet. Good for one connection, within the seconds it says. 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [RealtimeTicket] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<RealtimeTicket>> createRealtimeTicket({ 
    required String oid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/realtime/ticket'.replaceAll('{' r'oid' '}', oid.toString());
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
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    RealtimeTicket? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<RealtimeTicket, RealtimeTicket>(rawData, 'RealtimeTicket', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<RealtimeTicket>(
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
