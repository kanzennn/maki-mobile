import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/auth/session_state.dart';

import '../../helpers/fakes.dart';

void main() {
  group('SessionCubit', () {
    test('starts signed out', () {
      expect(
        SessionCubit(FakeTokenStorage(), FakeSessionApi()).state,
        const SessionState.signedOut(),
      );
    });

    test(
      'keeps the refresh token in storage and the access token in memory',
      () async {
        final storage = FakeTokenStorage();
        final session = SessionCubit(storage, FakeSessionApi());
        addTearDown(session.close);

        await session.start(testSession());

        expect(storage.refreshToken, 'refresh-1');
        expect(session.accessToken, 'access-1');
        expect(session.user?.name, 'Budi');
      },
    );

    blocTest<SessionCubit, SessionState>(
      'restores a previous launch by refreshing its token',
      build: () => SessionCubit(
        FakeTokenStorage('saved'),
        FakeSessionApi(testSession(access: 'fresh', refresh: 'rotated')),
      ),
      act: (cubit) => cubit.restore(),
      expect: () => [
        SessionState.signedIn(accessToken: 'fresh', user: testAccount()),
      ],
    );

    test('stores the rotated refresh token', () async {
      final storage = FakeTokenStorage('saved');
      final session = SessionCubit(
        storage,
        FakeSessionApi(testSession(refresh: 'rotated')),
      );
      addTearDown(session.close);

      expect(await session.refresh(), isTrue);
      expect(storage.refreshToken, 'rotated');
    });

    test('shares one refresh between overlapping calls', () async {
      final api = FakeSessionApi(testSession());
      final session = SessionCubit(FakeTokenStorage('saved'), api);
      addTearDown(session.close);

      final results = await Future.wait([
        session.refresh(),
        session.refresh(),
        session.refresh(),
      ]);

      expect(results, [true, true, true]);
      expect(api.refreshed, [
        'saved',
      ], reason: 'a refresh token used twice ends the session');
    });

    test('signs out when the server refuses the token', () async {
      final storage = FakeTokenStorage('saved');
      final session = SessionCubit(
        storage,
        FakeSessionApi(const ApiException(code: 'unauthorized', message: '')),
      );
      addTearDown(session.close);
      await session.start(testSession(refresh: 'saved'));

      expect(await session.refresh(), isFalse);
      expect(session.state, const SessionState.signedOut());
      expect(storage.refreshToken, isNull);
    });

    test("keeps the token when the server can't be reached", () async {
      final storage = FakeTokenStorage('saved');
      final session = SessionCubit(
        storage,
        FakeSessionApi(const ApiException(code: 'network', message: '')),
      );
      addTearDown(session.close);

      expect(await session.refresh(), isFalse);
      expect(
        storage.refreshToken,
        'saved',
        reason: 'nothing says the session has ended',
      );
    });

    blocTest<SessionCubit, SessionState>(
      'stays signed out with nothing saved',
      build: () => SessionCubit(FakeTokenStorage(), FakeSessionApi()),
      act: (cubit) => cubit.restore(),
      expect: () => <SessionState>[],
    );

    test('signs out on the server and forgets the session', () async {
      final storage = FakeTokenStorage();
      final api = FakeSessionApi();
      final session = SessionCubit(storage, api);
      addTearDown(session.close);
      await session.start(testSession());

      await session.signOut();

      expect(api.loggedOut, ['refresh-1']);
      expect(storage.refreshToken, isNull);
      expect(session.state, const SessionState.signedOut());
    });

    test('says why, when the app signed out by itself', () async {
      final session = SessionCubit(FakeTokenStorage(), FakeSessionApi());
      addTearDown(session.close);
      await session.start(testSession());

      await session.signOut(reason: SignOutReason.deviceRevoked);

      expect(
        session.state,
        const SessionState.signedOut(reason: SignOutReason.deviceRevoked),
      );
    });

    test('replaces the user after a change to the account', () async {
      final session = SessionCubit(FakeTokenStorage(), FakeSessionApi());
      addTearDown(session.close);
      await session.start(
        testSession(user: testAccount(mustChangePassword: true)),
      );

      session.updateUser(testAccount());

      expect(session.user?.mustChangePassword, isFalse);
      expect(session.accessToken, 'access-1');
    });
  });
}
