import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/api/api_call.dart';
import 'package:maki_mobile/core/api/api_client.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/core/config/app_config.dart';

import '../../helpers/fakes.dart';

void main() {
  const config = AppConfig(
    environment: 'test',
    apiBaseUrl: 'http://api.test',
    sentryDsn: '',
  );

  late FakeTokenStorage storage;
  late FakeDeviceTokenStorage deviceStorage;
  late DeviceTokenStore deviceTokens;

  setUp(() async {
    storage = FakeTokenStorage();
    deviceStorage = FakeDeviceTokenStorage();
    deviceTokens = DeviceTokenStore(deviceStorage);
    await deviceTokens.load();
  });

  (MakiApiClient, SessionCubit, FakeHttpAdapter) clientWith(
    Map<String, (int, Object?) Function(RequestOptions)> routes,
  ) {
    final (:api, :session) = createApi(
      config: config,
      tokens: storage,
      deviceTokens: deviceTokens,
      deviceLanguage: () => 'en',
    );
    addTearDown(session.close);
    final adapter = FakeHttpAdapter(routes);
    api.dio.httpClientAdapter = adapter;
    return (api, session, adapter);
  }

  (int, Object?) meWith(String token, RequestOptions request) =>
      request.headers['Authorization'] == 'Bearer $token'
      ? (200, testUser().toJson())
      : apiError(401, 'unauthorized');

  test('sends the access token and the language', () async {
    final (api, session, adapter) = clientWith({
      'GET /healthz': (_) => (200, {'status': 'ok'}),
    });
    await session.start(testSession(user: testAccount(language: 'en')));

    await api.getHealthApi().getHealthz();

    final headers = adapter.requests.single.headers;
    expect(headers['Authorization'], 'Bearer access-1');
    expect(headers['Accept-Language'], 'en');
  });

  test('uses the device language and no token when signed out', () async {
    final (api, _, adapter) = clientWith({
      'GET /healthz': (_) => (200, {'status': 'ok'}),
    });

    await api.getHealthApi().getHealthz();

    expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    expect(adapter.requests.single.headers['Accept-Language'], 'en');
  });

  test("sends the phone's device token once it has one", () async {
    final (api, _, adapter) = clientWith({
      'GET /healthz': (_) => (200, {'status': 'ok'}),
    });

    await api.getHealthApi().getHealthz();
    await deviceTokens.save('device-1');
    await api.getHealthApi().getHealthz();

    expect(
      adapter.requests.first.headers,
      isNot(contains(ApiInterceptor.deviceTokenHeader)),
    );
    expect(
      adapter.requests.last.headers[ApiInterceptor.deviceTokenHeader],
      'device-1',
    );
    expect(deviceStorage.token, 'device-1');
  });

  test(
    'wipes the device token and the session when the device is revoked',
    () async {
      await deviceTokens.save('device-1');
      final (api, session, adapter) = clientWith({
        'GET /api/v1/outlets/o1/pos/device': (_) =>
            apiError(403, 'device_revoked'),
        'POST /api/v1/auth/logout': (_) => (204, null),
      });
      await session.start(testSession());

      // Two requests learn it at the same moment: one sign-out.
      final calls = [
        for (var i = 0; i < 2; i++)
          apiCall(api.getOrderApi().getPosDevice(oid: 'o1')),
      ];
      for (final call in calls) {
        await expectLater(
          call,
          throwsA(
            isA<ApiException>().having((e) => e.code, 'code', 'device_revoked'),
          ),
        );
      }

      expect(deviceTokens.token, isNull);
      expect(deviceStorage.token, isNull);
      expect(storage.refreshToken, isNull);
      expect(
        session.state,
        const SessionState.signedOut(reason: SignOutReason.deviceRevoked),
      );
      expect(
        adapter.calls.where((c) => c == 'POST /api/v1/auth/logout'),
        hasLength(1),
      );
      // The logout no longer carries the token it just lost.
      final logout = adapter.requests.last;
      expect(logout.headers, isNot(contains(ApiInterceptor.deviceTokenHeader)));
    },
  );

  test(
    'keeps the device token when the device is only not registered',
    () async {
      await deviceTokens.save('device-1');
      final (api, session, _) = clientWith({
        'GET /api/v1/outlets/o1/pos/device': (_) =>
            apiError(403, 'device_not_registered'),
      });
      await session.start(testSession());

      await expectLater(
        apiCall(api.getOrderApi().getPosDevice(oid: 'o1')),
        throwsA(isA<ApiException>()),
      );

      // Another outlet's, perhaps: its Manager activating this phone replaces
      // it, and the outlet it belongs to can revoke it.
      expect(deviceTokens.token, 'device-1');
      expect(session.accessToken, 'access-1');
    },
  );

  test('refreshes an expired token once and retries the request', () async {
    final (api, session, adapter) = clientWith({
      'POST /api/v1/auth/refresh': (_) =>
          (200, sessionJson(access: 'fresh', refresh: 'rotated')),
      'GET /api/v1/me': (request) => meWith('fresh', request),
    });
    await session.start(testSession(access: 'expired'));

    final me = await apiCall(api.getMeApi().getMe());

    expect(me.name, 'Budi');
    expect(adapter.calls, [
      'GET /api/v1/me',
      'POST /api/v1/auth/refresh',
      'GET /api/v1/me',
    ]);
    expect(storage.refreshToken, 'rotated');
    expect(session.accessToken, 'fresh');
  });

  test('refreshes once for many requests at the same moment', () async {
    final (api, session, adapter) = clientWith({
      'POST /api/v1/auth/refresh': (_) => (200, sessionJson(access: 'fresh')),
      'GET /api/v1/me': (request) => meWith('fresh', request),
    });
    await session.start(testSession(access: 'expired'));

    await Future.wait([
      for (var i = 0; i < 3; i++) apiCall(api.getMeApi().getMe()),
    ]);

    expect(
      adapter.calls.where((c) => c.endsWith('/auth/refresh')),
      hasLength(1),
    );
  });

  test('signs out when the refresh is refused too', () async {
    final (api, session, _) = clientWith({
      'POST /api/v1/auth/refresh': (_) => apiError(401, 'unauthorized'),
      'GET /api/v1/me': (_) => apiError(401, 'unauthorized'),
    });
    await session.start(testSession(access: 'expired'));

    await expectLater(
      apiCall(api.getMeApi().getMe()),
      throwsA(
        isA<ApiException>().having((e) => e.code, 'code', 'unauthorized'),
      ),
    );
    expect(session.accessToken, isNull);
    expect(storage.refreshToken, isNull);
  });

  test("doesn't refresh for a 401 from signing in", () async {
    final (api, _, adapter) = clientWith({
      'POST /api/v1/auth/login': (_) => apiError(401, 'invalid_credentials'),
    });

    await expectLater(
      apiCall(
        api.getAuthApi().login(
          loginRequest: LoginRequest(
            username: 'kasir1',
            password: 'salah',
            client: LoginRequestClientEnum.mobile,
          ),
        ),
      ),
      throwsA(
        isA<ApiException>().having(
          (e) => e.code,
          'code',
          'invalid_credentials',
        ),
      ),
    );
    expect(adapter.calls, ['POST /api/v1/auth/login']);
  });

  test('turns the error envelope into an ApiException with details', () async {
    final (api, _, _) = clientWith({
      'GET /readyz': (_) => apiError(503, 'not_ready', {'retry_after': 5}),
    });

    await expectLater(
      apiCall(api.getHealthApi().getReadyz()),
      throwsA(
        isA<ApiException>()
            .having((e) => e.code, 'code', 'not_ready')
            .having((e) => e.statusCode, 'statusCode', 503)
            .having((e) => e.details['retry_after'], 'retry_after', 5),
      ),
    );
  });

  test('reads a response without the envelope as a server error', () {
    final exception = ApiException.fromDioException(
      DioException.badResponse(
        statusCode: 502,
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 502,
          data: '<html>Bad gateway</html>',
        ),
      ),
    );

    expect(exception.code, 'internal_error');
    expect(exception.statusCode, 502);
  });

  test('reads a request that got no response as a network error', () {
    final exception = ApiException.fromDioException(
      DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: 'connection refused',
      ),
    );

    expect(exception.code, 'network');
  });
}
