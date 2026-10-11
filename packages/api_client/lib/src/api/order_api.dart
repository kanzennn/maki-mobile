//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:maki_api_client/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:maki_api_client/src/model/create_order_request.dart';
import 'package:maki_api_client/src/model/error_envelope.dart';
import 'package:maki_api_client/src/model/order.dart';
import 'package:maki_api_client/src/model/order_list.dart';
import 'package:maki_api_client/src/model/pos_catalog.dart';
import 'package:maki_api_client/src/model/pos_device.dart';
import 'package:maki_api_client/src/model/void_order_request.dart';

class OrderApi {

  final Dio _dio;

  const OrderApi(this._dio);

  /// Take an order the cashier charged for
  /// Needs &#x60;checkout.create&#x60;, from one of the outlet&#39;s devices in use. The device makes the order&#39;s ID (a CUID2) and its receipt number, so the ID is the order&#39;s idempotency key: sending the same order again, as after a lost answer, answers 200 with the order as it was taken, never a second one, even from a device revoked since. The same ID with anything else in it, or from another outlet, is 409 &#x60;order_id_conflict&#x60;.  Everything is checked in one transaction, against the outlet as it is when the order arrives:  - the receipt number is the device&#39;s (&#x60;order_no_prefix&#x60; of   &#x60;GET …/pos/device&#x60;), carries the outlet&#39;s day of   &#x60;client_created_at&#x60;, and isn&#39;t taken (409 &#x60;order_no_taken&#x60;: the   cashier asks for the next number and sends the order again); - the payment method is on (409 &#x60;payment_method_unavailable&#x60;); - each menu is on sale (409 &#x60;menu_unavailable&#x60;, &#x60;details.menus&#x60; its   IDs), at the price the cashier showed (409 &#x60;prices_changed&#x60;,   &#x60;details.menus&#x60; each &#x60;menu_id&#x60; with its &#x60;price&#x60;), with stock enough   for its lines together (409 &#x60;order_stock_insufficient&#x60;,   &#x60;details.menus&#x60; each &#x60;menu_id&#x60; with what is &#x60;available&#x60;); - the voucher, when &#x60;voucher_code&#x60; names one, is for the sale, as   &#x60;POST …/vouchers/validate&#x60; checks it (404 &#x60;voucher_not_found&#x60;, 409   &#x60;voucher_not_for_outlet&#x60;, &#x60;voucher_inactive&#x60;, &#x60;voucher_expired&#x60;,   &#x60;voucher_used_up&#x60;, &#x60;voucher_not_started&#x60;), and the subtotal   reaches its minimum spend (409 &#x60;voucher_min_spend&#x60;,   &#x60;details.min_spend&#x60;): the cashier takes it off and says why; - the order fits how the outlet seats its dine-in customers now   (&#x60;dine_in_mode&#x60;): where they sit at tables, no &#x60;stand_number&#x60;;   where they take number stands, no &#x60;table_id&#x60;, and a dine-in order   carries its stand&#39;s &#x60;stand_number&#x60; (409 &#x60;dine_in_mode_changed&#x60;,   &#x60;details.mode&#x60; the outlet&#39;s). The Manager changed it since the   catalog was loaded: the cashier loads it again, takes the table or   the number off, and says why; - the table, when &#x60;table_id&#x60; names one (dine-in only), can be sat at:   the outlet&#39;s, not deleted, and available or occupied (409   &#x60;table_unavailable&#x60;, &#x60;details.status&#x60; the table&#39;s, &#x60;inactive&#x60; or   &#x60;scheduled&#x60;, or &#x60;missing&#x60;): the cashier takes it off and says why; - &#x60;total&#x60; is the server&#39;s, from those prices, the voucher&#39;s terms   and the outlet&#39;s rates (409 &#x60;total_changed&#x60;, &#x60;details.total&#x60; the   server&#39;s): subtotal, less the voucher&#39;s discount, then the service   charge on that, then the tax on both, each rounded to the nearest   rupiah, half up. &#x60;api/test-vectors/order-totals.json&#x60; and   &#x60;voucher-discounts.json&#x60; hold worked cases.  The menus are locked in the order of their IDs, so two cashiers selling the last one at once sell it once; then the voucher, so two outlets taking its last use at once take it once; then the outlet&#39;s dine-in mode, shared, so a change of it waits for the sale; then the table, shared with other sales at it, so a change, a release or a delete of it waits for the sale. Then the order, with its voucher&#39;s code and its table&#39;s name as they are and its stand&#39;s number, its lines with the menus&#39; names and prices as they are, and its payment are saved; tracked stock goes down, a sale movement per menu; the voucher&#39;s use is taken; and the Log Action records &#x60;order.created&#x60;. Cash gives change from &#x60;received&#x60;. 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [createOrderRequest] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Order] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Order>> createOrder({ 
    required String oid,
    required CreateOrderRequest createOrderRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/orders'.replaceAll('{' r'oid' '}', oid.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'deviceCookie',
            'keyName': 'maki_device',
            'where': '',
          },{
            'type': 'http',
            'scheme': 'bearer',
            'name': 'accessToken',
          },{
            'type': 'apiKey',
            'name': 'deviceToken',
            'keyName': 'X-Device-Token',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(createOrderRequest);

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

    Order? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Order, Order>(rawData, 'Order', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Order>(
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

  /// An order, with its lines and payment
  /// Needs &#x60;checkout.create&#x60; or &#x60;order.void&#x60;. For the receipt, printed again, and the void. 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [orid] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Order] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Order>> getOrder({ 
    required String oid,
    required String orid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/orders/{orid}'.replaceAll('{' r'oid' '}', oid.toString()).replaceAll('{' r'orid' '}', orid.toString());
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

    Order? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Order, Order>(rawData, 'Order', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Order>(
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

  /// Everything the cashier sells from
  /// Needs &#x60;checkout.create&#x60;. In one answer, so a device can later keep it offline whole: the outlet for the receipt, with its rates; the payment methods it takes; and its menus in the cashier&#39;s order, with the categories that hold them.  The menus are the active menus of active categories. Those that can be sold come first, out of stock last; within each, by the categories&#39; order, then name. Inactive and deleted menus aren&#39;t there at all. The stock is as it is now: the cashier loads the catalog again after each sale, and now and then. 
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
  /// Returns a [Future] containing a [Response] with a [PosCatalog] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PosCatalog>> getPosCatalog({ 
    required String oid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/pos/catalog'.replaceAll('{' r'oid' '}', oid.toString());
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

    PosCatalog? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PosCatalog, PosCatalog>(rawData, 'PosCatalog', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PosCatalog>(
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

  /// The device the cashier runs on, and its receipt numbers today
  /// Needs &#x60;checkout.create&#x60;, from one of the outlet&#39;s devices in use: sent as the cashier starts. Marks the device seen, and sends a browser&#39;s &#x60;maki_device&#x60; cookie again, so a device in use keeps it.  The device makes each receipt number itself: &#x60;order_no_prefix-YYYYMMDD-NNNN&#x60;, with the outlet&#39;s day and the device&#39;s count that day, at least four digits. &#x60;next_number&#x60; is the count its next one today takes; a new day starts it at 1. The cashier asks again after &#x60;order_no_taken&#x60;. 
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
  /// Returns a [Future] containing a [Response] with a [PosDevice] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PosDevice>> getPosDevice({ 
    required String oid,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/pos/device'.replaceAll('{' r'oid' '}', oid.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'deviceCookie',
            'keyName': 'maki_device',
            'where': '',
          },{
            'type': 'http',
            'scheme': 'bearer',
            'name': 'accessToken',
          },{
            'type': 'apiKey',
            'name': 'deviceToken',
            'keyName': 'X-Device-Token',
            'where': 'header',
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

    PosDevice? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<PosDevice, PosDevice>(rawData, 'PosDevice', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PosDevice>(
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

  /// Today&#39;s orders
  /// Needs &#x60;checkout.create&#x60; or &#x60;order.void&#x60;. The outlet&#39;s orders made today, in its time zone, newest first, voided ones included. &#x60;q&#x60; narrows them to the receipt numbers holding it, in any case. 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [q] - Part of a receipt number.
  /// * [page] 
  /// * [pageSize] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [OrderList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<OrderList>> listOrders({ 
    required String oid,
    String? q,
    int? page = 1,
    int? pageSize = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/orders'.replaceAll('{' r'oid' '}', oid.toString());
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

    final _queryParameters = <String, dynamic>{
      if (q != null) r'q': q,
      if (page != null) r'page': page,
      if (pageSize != null) r'page_size': pageSize,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    OrderList? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<OrderList, OrderList>(rawData, 'OrderList', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<OrderList>(
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

  /// Void an order
  /// Needs &#x60;order.void&#x60;, and a reason. The order and its payment become &#x60;void&#x60;; nothing else of them changes. What it sold goes back to the stock of its menus still tracked, a void movement per menu; a deleted menu&#39;s stock stays as it is. Its voucher&#39;s use is given back, the voucher turned off since or not. Recorded as &#x60;order.voided&#x60;. An order is voided once (409 &#x60;order_already_void&#x60;). 
  ///
  /// Parameters:
  /// * [oid] 
  /// * [orid] 
  /// * [voidOrderRequest] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Order] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Order>> voidOrder({ 
    required String oid,
    required String orid,
    required VoidOrderRequest voidOrderRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/v1/outlets/{oid}/orders/{orid}/void'.replaceAll('{' r'oid' '}', oid.toString()).replaceAll('{' r'orid' '}', orid.toString());
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
      _bodyData = jsonEncode(voidOrderRequest);

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

    Order? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<Order, Order>(rawData, 'Order', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Order>(
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
