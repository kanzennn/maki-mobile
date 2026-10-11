import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for AuthApi
void main() {
  final instance = MakiApiClient().getAuthApi();

  group(AuthApi, () {
    // Ask for a password reset link
    //
    // Only the Owner resets their own password this way; Managers and staff are reset by the Owner or their Manager. If `login` is the Owner's username or verified email, a link valid for 30 minutes is emailed. The answer is the same whether or not that happened, so it reveals nothing about which accounts exist. 
    //
    //Future forgotPassword(ForgotPasswordRequest forgotPasswordRequest) async
    test('test forgotPassword', () async {
      // TODO
    });

    // Sign in with username and password
    //
    // Starts a session. With `client: web` the refresh token comes as the `maki_refresh` cookie (HttpOnly, SameSite=Strict, path `/api/v1/auth`); with `client: mobile` it comes in the body.  A user whose password was set by someone else can sign in, but has `must_change_password: true` and gets 403 `password_change_required` from every endpoint except `GET /me` and `PUT /me/password` until they change it. 
    //
    //Future<Session> login(LoginRequest loginRequest) async
    test('test login', () async {
      // TODO
    });

    // Sign out of this session
    //
    // Ends the session named by the refresh token (the cookie, or `refresh_token` in the body) or else by the access token, and clears the cookie. Always succeeds, so it is safe to call twice. 
    //
    //Future logout({ RefreshRequest refreshRequest }) async
    test('test logout', () async {
      // TODO
    });

    // Exchange the refresh token for a new access token
    //
    // The web app sends no body: the browser sends the `maki_refresh` cookie, and the new refresh token comes back as the cookie. The Android app sends `refresh_token` and gets the new one in the body. Either way the old refresh token stops working. 
    //
    //Future<Session> refreshSession({ RefreshRequest refreshRequest }) async
    test('test refreshSession', () async {
      // TODO
    });

    // Choose a new password with the emailed link's token
    //
    // The token comes from the link's URL fragment (`#token=…`). On success every session of the account is signed out and a notice is emailed. 
    //
    //Future resetPassword(ResetPasswordRequest resetPasswordRequest) async
    test('test resetPassword', () async {
      // TODO
    });

    // Confirm an email address with the emailed link's token
    //
    // The token comes from the link's URL fragment (`#token=…`). The new address replaces the old one only now. 
    //
    //Future verifyEmail(TokenRequest tokenRequest) async
    test('test verifyEmail', () async {
      // TODO
    });

  });
}
