import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/auth/account.dart';

part 'session_state.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  /// Signed out; [reason] says why, when the app ended the session itself
  /// for a reason the user should hear on the sign-in screen.
  const factory SessionState.signedOut({SignOutReason? reason}) =
      SessionSignedOut;

  /// Signed in: the access token, in memory only, and the user from the
  /// same response.
  const factory SessionState.signedIn({
    required String accessToken,
    required Account user,
  }) = SessionSignedIn;
}

/// Why the app ended a session without the user asking.
enum SignOutReason {
  /// The outlet revoked this phone as a cashier device, so nothing of the
  /// session stays on it (architecture standard §9).
  deviceRevoked,
}
