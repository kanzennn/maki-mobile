import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_api.dart';
import 'package:maki_mobile/core/auth/token_storage.dart';

/// The outlet the staff below work in.
OutletSummary testOutlet({String timezone = 'Asia/Jakarta'}) => OutletSummary(
  outletId: 'o1',
  code: 'BDG01',
  name: 'Maki Bandung',
  timezone: timezone,
  locale: 'id',
);

/// A signed-in cashier, as GET /me returns them: their role gives
/// checkout.create.
Me testUser({
  bool mustChangePassword = false,
  String language = 'id',
  List<String> permissions = const ['checkout.create'],
  OutletSummary? outlet,
  bool isManager = false,
}) => Me(
  userId: 'u1',
  username: 'kasir1',
  name: 'Budi',
  email: null,
  emailVerified: false,
  pendingEmail: null,
  locale: null,
  language: language,
  isOwner: false,
  isManager: isManager,
  outletId: 'o1',
  mustChangePassword: mustChangePassword,
  permissions: permissions,
  outlet: outlet ?? testOutlet(),
);

/// The outlet's Manager, as GET /me returns them: every permission in the
/// outlet, voiding included.
Me testManager() => testUser(
  isManager: true,
  permissions: const [
    'checkout.create',
    'order.void',
    'menu.view',
    'menu.manage',
    'stock.manage',
    'user.view',
    'user.manage',
    'role.view',
    'role.manage',
  ],
);

/// The Owner, as GET /me returns them: every outlet to look into, none to
/// check out in.
Me testOwnerMe() => Me(
  userId: 'owner',
  username: 'pemilik',
  name: 'Faiz',
  email: 'pemilik@maki.test',
  emailVerified: true,
  pendingEmail: null,
  locale: null,
  language: 'id',
  isOwner: true,
  isManager: false,
  outletId: null,
  mustChangePassword: false,
  permissions: const [
    'dashboard.view',
    'log.view',
    'menu.view',
    'role.view',
    'table.view',
    'user.manage',
    'user.view',
  ],
  outlet: null,
);

/// The same cashier as the app keeps them.
Account testAccount({
  bool mustChangePassword = false,
  String language = 'id',
  List<String> permissions = const ['checkout.create'],
  OutletSummary? outlet,
}) => accountFromDto(
  testUser(
    mustChangePassword: mustChangePassword,
    language: language,
    permissions: permissions,
    outlet: outlet,
  ),
);

/// A session as the app keeps it after sign-in or a refresh.
IssuedSession testSession({
  String access = 'access-1',
  String refresh = 'refresh-1',
  Account? user,
}) => (accessToken: access, refreshToken: refresh, user: user ?? testAccount());

/// A session as sign-in or refresh returns it to the Android app.
Map<String, Object?> sessionJson({
  String access = 'access-1',
  String refresh = 'refresh-1',
  Me? user,
}) => Session(
  accessToken: access,
  tokenType: SessionTokenTypeEnum.bearer,
  expiresIn: 900,
  refreshToken: refresh,
  refreshExpiresIn: 2592000,
  user: user ?? testUser(),
).toJson();

class FakeTokenStorage implements TokenStorage {
  FakeTokenStorage([this.refreshToken]);

  String? refreshToken;

  @override
  Future<String?> readRefreshToken() async => refreshToken;

  @override
  Future<void> writeRefreshToken(String token) async => refreshToken = token;

  @override
  Future<void> clear() async => refreshToken = null;
}

class FakeDeviceTokenStorage implements DeviceTokenStorage {
  FakeDeviceTokenStorage([this.token]);

  String? token;

  @override
  Future<String?> read() async => token;

  @override
  Future<void> write(String token) async => this.token = token;

  @override
  Future<void> delete() async => token = null;
}

/// A device token store holding [token], as main.dart loads it at startup.
Future<DeviceTokenStore> deviceTokensWith([String? token]) async {
  final store = DeviceTokenStore(FakeDeviceTokenStorage(token));
  await store.load();
  return store;
}

/// Answers refresh with [refreshWith] — an IssuedSession, or an
/// ApiException to throw — and records every call.
class FakeSessionApi implements SessionApi {
  FakeSessionApi([this.refreshWith]);

  Object? refreshWith;
  final refreshed = <String>[];
  final loggedOut = <String>[];

  @override
  Future<IssuedSession> refresh(String refreshToken) async {
    refreshed.add(refreshToken);
    await Future<void>.delayed(Duration.zero);
    return switch (refreshWith) {
      final IssuedSession session => session,
      final ApiException error => throw error,
      _ => throw const ApiException(code: 'unauthorized', message: ''),
    };
  }

  @override
  Future<void> logout(String refreshToken) async => loggedOut.add(refreshToken);
}

/// Answers each request from [routes], keyed 'METHOD /path'; anything else
/// is a 404. A route that throws is a request that got no answer. Records
/// every request.
class FakeHttpAdapter implements HttpClientAdapter {
  FakeHttpAdapter(this.routes);

  final Map<String, (int, Object?) Function(RequestOptions request)> routes;
  final requests = <RequestOptions>[];

  List<String> get calls => [
    for (final r in requests) '${r.method} ${r.uri.path}',
  ];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final route = routes['${options.method} ${options.uri.path}'];
    final (status, body) = route == null
        ? (
            404,
            {
              'error': {'code': 'not_found', 'message': 'no route'},
            },
          )
        : route(options);
    return ResponseBody.fromString(
      body == null ? '' : jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

(int, Object?) apiError(
  int status,
  String code, [
  Map<String, Object?>? details,
]) => (
  status,
  {
    'error': {'code': code, 'message': 'server: $code', 'details': ?details},
  },
);
