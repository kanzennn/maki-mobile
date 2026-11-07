//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:maki_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:maki_api_client/src/model/error_envelope.dart';
import 'package:maki_api_client/src/model/payment_methods.dart';
import 'package:maki_api_client/src/model/set_payment_methods_request.dart';

class PaymentApi {

  final Dio _dio;

  const PaymentApi(this._dio);

  /// The outlet&#39;s Payment Control
  /// Needs &#x60;payment.manage&#x60;. Every method, in the cashier&#39;s order.
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
  /// Returns a [Future] containing a [Response] with a [PaymentMethods] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PaymentMethods>> listPaymentMethods({ 
    required String oid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/payment-methods'.replaceAll('{' r'oid' '}', oid.toString());
    final _options = Options(
      method: r'GET',
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

    PaymentMethods? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PaymentMethods, PaymentMethods>(rawData, 'PaymentMethods', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PaymentMethods>(
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

  /// Turn the outlet&#39;s payment methods on or off
  /// Needs &#x60;payment.manage&#x60;. Methods left out stay as they are. Cash stays on (&#x60;payment_method_required&#x60;), and a method not released yet can&#39;t be turned on (&#x60;payment_method_coming_soon&#x60;). A change is &#x60;payment.updated&#x60; in the Log Action; saving what is so records nothing. Each method&#39;s &#x60;method&#x60; is &#x60;required&#x60;, &#x60;oneof&#x60; or &#x60;duplicate&#x60;, and its &#x60;is_enabled&#x60; is &#x60;required&#x60;. 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [setPaymentMethodsRequest] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [PaymentMethods] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PaymentMethods>> setPaymentMethods({ 
    required String oid,
    required SetPaymentMethodsRequest setPaymentMethodsRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/payment-methods'.replaceAll('{' r'oid' '}', oid.toString());
    final _options = Options(
      method: r'PUT',
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
      _bodyData = jsonEncode(setPaymentMethodsRequest);

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

    PaymentMethods? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PaymentMethods, PaymentMethods>(rawData, 'PaymentMethods', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PaymentMethods>(
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
