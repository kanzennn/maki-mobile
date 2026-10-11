import 'package:dio/dio.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_api.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/core/auth/token_storage.dart';
import 'package:maki_mobile/core/config/app_config.dart';

/// The generated client on the app's single Dio instance, and the session it
/// keeps signed in.
({MakiApiClient api, SessionCubit session}) createApi({
  required AppConfig config,
  required TokenStorage tokens,
  required DeviceTokenStore deviceTokens,
  required String Function() deviceLanguage,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  // An empty list keeps the generator's own auth interceptors out: the
  // session interceptor below is the only one that sets Authorization.
  final api = MakiApiClient(dio: dio, interceptors: const []);
  final session = SessionCubit(tokens, ClientSessionApi(api));
  dio.interceptors.add(
    ApiInterceptor(
      dio: dio,
      session: session,
      deviceTokens: deviceTokens,
      deviceLanguage: deviceLanguage,
    ),
  );
  return (api: api, session: session);
}

/// Adds the access token, the device token and the language to every
/// request. On a 401 it refreshes the session once and retries the request;
/// on `device_revoked` it wipes the device token and the session. Every
/// failure that is left becomes an [ApiException].
class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    required this._dio,
    required this._session,
    required this._deviceTokens,
    required this._deviceLanguage,
  });

  static const _retried = 'maki.retried';

  /// The header the backend reads the Android app's device token from.
  static const deviceTokenHeader = 'X-Device-Token';

  final Dio _dio;
  final SessionCubit _session;
  final DeviceTokenStore _deviceTokens;
  final String Function() _deviceLanguage;
  Future<void>? _revoking;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _session.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      options.headers.remove('Authorization');
    }
    // Every API route, as the browser's device cookie: only the cashier's
    // read it.
    final device = _deviceTokens.token;
    if (device != null) {
      options.headers[deviceTokenHeader] = device;
    } else {
      options.headers.remove(deviceTokenHeader);
    }
    // The user's own language once signed in, the device's before.
    options.headers['Accept-Language'] =
        _session.user?.language ?? _deviceLanguage();
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    // A 401 from sign-in or refresh is the answer itself, and a request is
    // retried once at most.
    final expired =
        err.response?.statusCode == 401 &&
        !options.uri.path.startsWith('/api/v1/auth/') &&
        options.extra[_retried] != true;
    if (expired && await _session.refresh()) {
      try {
        options.extra[_retried] = true;
        return handler.resolve(await _dio.fetch<dynamic>(options));
      } on DioException catch (retryError) {
        // Its own onError has already converted it.
        return handler.next(retryError);
      }
    }
    final error = ApiException.fromDioException(err);
    if (error.code == 'device_revoked') await _revoked();
    handler.next(err.copyWith(error: error));
  }

  /// A revoked phone keeps nothing that let it in: neither its device token
  /// nor the session of whoever is signed in on it, who could still read
  /// today's orders or void them (architecture standard §9). Requests that
  /// learn it at once share one sign-out.
  Future<void> _revoked() => _revoking ??= () async {
    await _deviceTokens.clear();
    await _session.signOut(reason: SignOutReason.deviceRevoked);
  }().whenComplete(() => _revoking = null);
}
