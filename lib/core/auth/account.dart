import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/auth/permissions.dart';

part 'account.freezed.dart';

/// The signed-in user. The data layer builds it from the API's `Me`, so no
/// screen depends on a generated type.
@freezed
abstract class Account with _$Account {
  const factory Account({
    required String userId,
    required String username,
    required String name,
    required bool emailVerified,

    /// What the user sees: their own [locale], else their outlet's, else
    /// Indonesian.
    required String language,
    required bool isOwner,
    required bool isManager,
    required bool mustChangePassword,

    /// What the user may do: in their outlet, or for the Owner in every
    /// outlet. The app shows what these allow; the server checks them on
    /// every request regardless.
    required Set<String> permissions,
    String? email,
    String? pendingEmail,

    /// Their own choice of language; null follows the outlet.
    String? locale,
    String? outletId,

    /// Where the user works; null for the Owner.
    AccountOutlet? outlet,
  }) = _Account;

  const Account._();

  /// Whether the user holds [permission], one of [Permissions].
  bool can(String permission) => permissions.contains(permission);

  /// This app is the cashier: it's for whoever may check out — a Manager,
  /// or staff whose role allows it. Not the Owner.
  bool get canUseCashier => can(Permissions.checkoutCreate);
}

/// The outlet a user works in: its times show in its [timeZone].
@freezed
abstract class AccountOutlet with _$AccountOutlet {
  const factory AccountOutlet({
    required String outletId,
    required String code,
    required String name,

    /// IANA name, such as Asia/Jakarta.
    required String timeZone,

    /// The outlet's default language.
    required String locale,
  }) = _AccountOutlet;
}

/// A session the server has just issued, by sign-in or a refresh.
typedef IssuedSession = ({
  String accessToken,
  String refreshToken,
  Account user,
});
