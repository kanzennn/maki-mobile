import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for Dashboard
void main() {
  final Dashboard? instance = /* Dashboard(...) */ null;
  // TODO add properties to the entity

  group(Dashboard, () {
    // DateTime from
    test('to test the property `from`', () async {
      // TODO
    });

    // DateTime to
    test('to test the property `to`', () async {
      // TODO
    });

    // DateTime previousFrom
    test('to test the property `previousFrom`', () async {
      // TODO
    });

    // DateTime previousTo
    test('to test the property `previousTo`', () async {
      // TODO
    });

    // DashboardSummary summary
    test('to test the property `summary`', () async {
      // TODO
    });

    // Every day of the period, those without a sale too.
    // List<DashboardDaysInner> days
    test('to test the property `days`', () async {
      // TODO
    });

    // An outlet's, every hour of the day, 0 to 23.
    // List<DashboardHoursInner> hours
    test('to test the property `hours`', () async {
      // TODO
    });

    // The Owner's ranking, the best first.
    // List<DashboardOutletsInner> outlets
    test('to test the property `outlets`', () async {
      // TODO
    });

    // List<DashboardPaymentMethodsInner> paymentMethods
    test('to test the property `paymentMethods`', () async {
      // TODO
    });

    // At most ten, the most sold first.
    // List<DashboardTopMenusInner> topMenus
    test('to test the property `topMenus`', () async {
      // TODO
    });

    // Menus at or below their alert, or out of stock, now, whatever the period. At most 50, the emptiest first.
    // List<DashboardLowStockInner> lowStock
    test('to test the property `lowStock`', () async {
      // TODO
    });

    // An outlet's, the most sold first.
    // List<DashboardCashiersInner> cashiers
    test('to test the property `cashiers`', () async {
      // TODO
    });

    // An outlet's tables customers are seated at now, whatever the period.
    // List<DashboardTablesInner> tables
    test('to test the property `tables`', () async {
      // TODO
    });

  });
}
