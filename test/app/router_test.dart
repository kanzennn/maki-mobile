import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/app/router.dart';
import 'package:maki_mobile/core/auth/session_api.dart';
import 'package:maki_mobile/core/auth/session_state.dart';

import '../helpers/fakes.dart';

void main() {
  const signedOut = SessionState.signedOut();
  final signedIn = SessionState.signedIn(accessToken: 'a', user: testAccount());
  final mustChange = SessionState.signedIn(
    accessToken: 'a',
    user: testAccount(mustChangePassword: true),
  );
  final waiter = SessionState.signedIn(
    accessToken: 'a',
    user: testAccount(permissions: const ['table.view']),
  );
  final owner = SessionState.signedIn(
    accessToken: 'a',
    user: accountFromDto(testOwnerMe()),
  );

  test('keeps a signed-out user on the sign-in screen', () {
    expect(redirectFor(signedOut, '/pos'), '/login');
    expect(redirectFor(signedOut, '/change-password'), '/login');
    expect(redirectFor(signedOut, '/no-access'), '/login');
    expect(redirectFor(signedOut, '/login'), isNull);
  });

  test('takes a signed-in user past sign-in', () {
    expect(redirectFor(signedIn, '/login'), '/pos');
    expect(redirectFor(signedIn, '/pos'), isNull);
    expect(redirectFor(signedIn, '/no-access'), '/pos');
    expect(
      redirectFor(signedIn, '/change-password'),
      isNull,
      reason: 'changing it by choice',
    );
  });

  test('holds a user who must change their password', () {
    expect(redirectFor(mustChange, '/pos'), '/change-password');
    expect(redirectFor(mustChange, '/login'), '/change-password');
    expect(redirectFor(mustChange, '/change-password'), isNull);
  });

  test('tells whoever may not check out that the app is not theirs', () {
    for (final user in [waiter, owner]) {
      expect(redirectFor(user, '/login'), '/no-access');
      expect(redirectFor(user, '/pos'), '/no-access');
      expect(redirectFor(user, '/change-password'), '/no-access');
      expect(redirectFor(user, '/no-access'), isNull);
    }
  });

  test('says so before asking for a new password', () {
    final both = SessionState.signedIn(
      accessToken: 'a',
      user: testAccount(permissions: const [], mustChangePassword: true),
    );

    expect(redirectFor(both, '/pos'), '/no-access');
  });
}
