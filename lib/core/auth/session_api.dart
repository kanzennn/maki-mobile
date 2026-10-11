import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/api/api_call.dart';
import 'package:maki_mobile/core/auth/account.dart';

/// The two calls that keep a session going, apart from signing in.
abstract interface class SessionApi {
  /// Exchanges [refreshToken] for a new session; the old token stops working.
  Future<IssuedSession> refresh(String refreshToken);

  /// Ends the session [refreshToken] belongs to.
  Future<void> logout(String refreshToken);
}

/// [SessionApi] over the generated client.
class ClientSessionApi implements SessionApi {
  ClientSessionApi(this._api);

  final MakiApiClient _api;

  @override
  Future<IssuedSession> refresh(String refreshToken) async =>
      issuedSessionFromDto(
        await apiCall(
          _api.getAuthApi().refreshSession(
            refreshRequest: RefreshRequest(refreshToken: refreshToken),
          ),
        ),
      );

  @override
  Future<void> logout(String refreshToken) => apiCall(
    _api.getAuthApi().logout(
      refreshRequest: RefreshRequest(refreshToken: refreshToken),
    ),
  );
}

/// The API's session as the app keeps it. The Android app always gets its
/// refresh token in the body; a session without one is a contract error.
IssuedSession issuedSessionFromDto(Session dto) {
  final refreshToken = dto.refreshToken;
  if (refreshToken == null) {
    throw StateError('a mobile session needs its refresh token');
  }
  return (
    accessToken: dto.accessToken,
    refreshToken: refreshToken,
    user: accountFromDto(dto.user),
  );
}

/// The API's `Me` as an [Account].
Account accountFromDto(Me dto) => Account(
  userId: dto.userId,
  username: dto.username,
  name: dto.name,
  email: dto.email,
  emailVerified: dto.emailVerified,
  pendingEmail: dto.pendingEmail,
  locale: dto.locale,
  language: dto.language,
  isOwner: dto.isOwner,
  isManager: dto.isManager,
  outletId: dto.outletId,
  mustChangePassword: dto.mustChangePassword,
  permissions: {...dto.permissions},
  outlet: switch (dto.outlet) {
    final OutletSummary outlet => AccountOutlet(
      outletId: outlet.outletId,
      code: outlet.code,
      name: outlet.name,
      timeZone: outlet.timezone,
      locale: outlet.locale,
    ),
    null => null,
  },
);
