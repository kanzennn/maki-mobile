import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_api.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/core/auth/token_storage.dart';

/// App-wide session. The router's redirect and the API client read it; the
/// auth feature signs in and out through it.
///
/// The refresh token sits in secure storage and every refresh replaces it;
/// the access token lives in memory only, so a new launch starts with a
/// refresh.
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._tokens, this._api) : super(const SessionState.signedOut());

  final TokenStorage _tokens;
  final SessionApi _api;
  Future<bool>? _refreshing;

  String? get accessToken => switch (state) {
    SessionSignedIn(:final accessToken) => accessToken,
    SessionSignedOut() => null,
  };

  Account? get user => switch (state) {
    SessionSignedIn(:final user) => user,
    SessionSignedOut() => null,
  };

  /// Keeps a session that signing in or refreshing returned.
  Future<void> start(IssuedSession session) async {
    await _tokens.writeRefreshToken(session.refreshToken);
    emit(
      SessionState.signedIn(
        accessToken: session.accessToken,
        user: session.user,
      ),
    );
  }

  /// Replaces the signed-in user, after a change to their account.
  void updateUser(Account user) {
    if (state case SessionSignedIn(:final accessToken)) {
      emit(SessionState.signedIn(accessToken: accessToken, user: user));
    }
  }

  /// Picks up the session of a previous launch.
  Future<void> restore() => refresh();

  /// Exchanges the stored refresh token for a new access token. Calls that
  /// overlap share one refresh: a refresh token used twice ends the session.
  /// Resolves to whether the user is signed in afterwards.
  ///
  /// A refused token signs out; a network failure keeps it for the next
  /// attempt, since nothing says the session has ended.
  Future<bool> refresh() => _refreshing ??= _refresh().whenComplete(() {
    _refreshing = null;
  });

  Future<bool> _refresh() async {
    final token = await _tokens.readRefreshToken();
    if (token == null) return _signedOut();
    try {
      await start(await _api.refresh(token));
      return true;
    } on ApiException catch (error) {
      if (error.code == 'network') return false;
      await _tokens.clear();
      return _signedOut();
    }
  }

  /// Ends the session on the server — when it can be reached — and forgets
  /// it on this device either way. [reason] is why the app ended it, when
  /// the user didn't ask.
  Future<void> signOut({SignOutReason? reason}) async {
    final token = await _tokens.readRefreshToken();
    if (token != null) {
      try {
        await _api.logout(token);
      } on ApiException {
        // Unreachable server: the session expires on its own.
      }
    }
    await _tokens.clear();
    _signedOut(reason);
  }

  bool _signedOut([SignOutReason? reason]) {
    if (state is! SessionSignedOut) {
      emit(SessionState.signedOut(reason: reason));
    }
    return false;
  }
}
