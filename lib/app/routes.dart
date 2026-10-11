/// The routes' names, for `context.goNamed`. Apart from the router, so a
/// screen that navigates doesn't import it.
abstract final class Routes {
  static const login = 'login';
  static const changePassword = 'change-password';
  static const noAccess = 'no-access';

  /// The cashier: selling, the order full screen on a phone, the tables,
  /// today's orders, one order, and the account.
  static const pos = 'pos';
  static const posOrder = 'pos-order';
  static const posTables = 'pos-tables';
  static const posHistory = 'pos-history';
  static const posOrderDetail = 'pos-order-detail';
  static const posAccount = 'pos-account';
}
