import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/api/api_call.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_api.dart';

/// The auth endpoints the screens use. Refreshing and signing out belong to
/// the session itself (core/auth).
class AuthRepository {
  AuthRepository(this._api);

  final MakiApiClient _api;

  /// Signs in as the Android app: the refresh token comes in the body.
  Future<IssuedSession> login(String username, String password) async =>
      issuedSessionFromDto(
        await apiCall(
          _api.getAuthApi().login(
            loginRequest: LoginRequest(
              username: username.trim(),
              password: password,
              client: LoginRequestClientEnum.mobile,
            ),
          ),
        ),
      );

  /// Changes the password; the user's other sessions end, this one stays.
  Future<void> changePassword(String current, String next) => apiCall(
    _api.getMeApi().changePassword(
      changePasswordRequest: ChangePasswordRequest(
        currentPassword: current,
        newPassword: next,
      ),
    ),
  );

  Future<Account> me() async =>
      accountFromDto(await apiCall(_api.getMeApi().getMe()));
}
