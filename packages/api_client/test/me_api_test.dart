import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for MeApi
void main() {
  final instance = MakiApiClient().getMeApi();

  group(MeApi, () {
    // Start changing the signed-in user's email address
    //
    // Needs the current password. Emails a confirmation link (valid 24 hours) to the new address and a notice to the current one. The current address stays in use until the new one is confirmed with `POST /api/v1/auth/email/verify`; `Me.pending_email` shows it until then. 
    //
    //Future changeEmail(ChangeEmailRequest changeEmailRequest) async
    test('test changeEmail', () async {
      // TODO
    });

    // Change the signed-in user's password
    //
    // Needs the current password. Every other session of the account is signed out; this one stays. Clears `must_change_password`. 
    //
    //Future changePassword(ChangePasswordRequest changePasswordRequest) async
    test('test changePassword', () async {
      // TODO
    });

    // The signed-in user
    //
    // Open even while the password must be changed.
    //
    //Future<Me> getMe() async
    test('test getMe', () async {
      // TODO
    });

    // Change the signed-in user's own settings
    //
    // `locale` sets the user's language on every device; `null` follows the outlet's language. 
    //
    //Future<Me> updateMe(UpdateMeRequest updateMeRequest) async
    test('test updateMe', () async {
      // TODO
    });

  });
}
