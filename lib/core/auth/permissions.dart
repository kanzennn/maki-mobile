/// The permission codes the app checks, from the backend's catalog
/// (`GET /api/v1/permissions`). Codes are stable: roles store them. Add one
/// here when a screen starts to depend on it.
abstract final class Permissions {
  /// Checking out at the cashier, which this app is for.
  static const checkoutCreate = 'checkout.create';

  /// Voiding one of today's orders, for a reason.
  static const orderVoid = 'order.void';
}
