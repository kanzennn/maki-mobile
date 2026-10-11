import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for StockMovement
void main() {
  final StockMovement? instance = /* StockMovement(...) */ null;
  // TODO add properties to the entity

  group(StockMovement, () {
    // String stockMovementId
    test('to test the property `stockMovementId`', () async {
      // TODO
    });

    // `initial`: the count tracking started from; `in`, `out`, `set`: an adjustment; `sale`, `void`: the cashier's, with their order. 
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // The change to the count, new minus old; 0 for a stock take that matched.
    // int qtyChange
    test('to test the property `qtyChange`', () async {
      // TODO
    });

    // The count it left.
    // int stockAfter
    test('to test the property `stockAfter`', () async {
      // TODO
    });

    // An adjustment's reason, or `initial`; null for a sale or void.
    // String reason
    test('to test the property `reason`', () async {
      // TODO
    });

    // String note
    test('to test the property `note`', () async {
      // TODO
    });

    // StockMovementUser user
    test('to test the property `user`', () async {
      // TODO
    });

    // The order of a sale or void.
    // String orderId
    test('to test the property `orderId`', () async {
      // TODO
    });

    // DateTime createdAt
    test('to test the property `createdAt`', () async {
      // TODO
    });

  });
}
