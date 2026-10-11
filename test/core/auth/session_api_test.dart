import 'package:flutter_test/flutter_test.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_api.dart';

import '../../helpers/fakes.dart';

void main() {
  // The values differ from field to field, and the flags come in two
  // opposite sets, so a field mapped from the wrong source fails.
  for (final (owner, manager, verified, mustChange) in [
    (true, true, false, false),
    (true, false, true, false),
  ]) {
    test('carries every field of the API user into the account '
        '(owner $owner, manager $manager)', () {
      final me = Me(
        userId: 'u1',
        username: 'kasir1',
        name: 'Budi',
        email: 'budi@example.com',
        emailVerified: verified,
        pendingEmail: 'budi.baru@example.com',
        locale: 'en',
        language: 'id',
        isOwner: owner,
        isManager: manager,
        outletId: 'o1',
        mustChangePassword: mustChange,
        permissions: const ['checkout.create', 'menu.view'],
        outlet: OutletSummary(
          outletId: 'o1',
          code: 'BDG01',
          name: 'Maki Bandung',
          timezone: 'Asia/Makassar',
          locale: 'en',
        ),
      );

      expect(
        accountFromDto(me),
        Account(
          userId: 'u1',
          username: 'kasir1',
          name: 'Budi',
          email: 'budi@example.com',
          emailVerified: verified,
          pendingEmail: 'budi.baru@example.com',
          locale: 'en',
          language: 'id',
          isOwner: owner,
          isManager: manager,
          outletId: 'o1',
          mustChangePassword: mustChange,
          permissions: const {'checkout.create', 'menu.view'},
          outlet: const AccountOutlet(
            outletId: 'o1',
            code: 'BDG01',
            name: 'Maki Bandung',
            timeZone: 'Asia/Makassar',
            locale: 'en',
          ),
        ),
      );
    });
  }

  test('maps the Owner, who has no outlet of their own', () {
    final account = accountFromDto(testOwnerMe());

    expect(account.outlet, isNull);
    expect(account.can('user.manage'), isTrue);
    expect(account.canUseCashier, isFalse);
  });

  test('lets whoever may check out use the cashier', () {
    expect(testAccount().canUseCashier, isTrue);
    expect(
      testAccount(permissions: const ['table.view']).canUseCashier,
      isFalse,
    );
  });

  Session session({String? refreshToken}) => Session(
    accessToken: 'access-1',
    tokenType: SessionTokenTypeEnum.bearer,
    expiresIn: 900,
    refreshToken: refreshToken,
    user: testUser(),
  );

  test('keeps both tokens and the user of a session', () {
    final issued = issuedSessionFromDto(session(refreshToken: 'refresh-1'));

    expect(issued.accessToken, 'access-1');
    expect(issued.refreshToken, 'refresh-1');
    expect(issued.user.username, 'kasir1');
    expect(issued.user.outlet?.timeZone, 'Asia/Jakarta');
  });

  test('refuses a session without its refresh token', () {
    expect(() => issuedSessionFromDto(session()), throwsStateError);
  });
}
