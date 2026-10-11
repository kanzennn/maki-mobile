import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for CreateOrderRequest
void main() {
  final CreateOrderRequest? instance = /* CreateOrderRequest(...) */ null;
  // TODO add properties to the entity

  group(CreateOrderRequest, () {
    // Made by the device, a CUID2; the order's idempotency key.
    // String orderId
    test('to test the property `orderId`', () async {
      // TODO
    });

    // String orderNo
    test('to test the property `orderNo`', () async {
      // TODO
    });

    // OrderType type
    test('to test the property `type`', () async {
      // TODO
    });

    // The table a dine-in order seats its customers at; null or blank for none, as it may be.
    // String tableId
    test('to test the property `tableId`', () async {
      // TODO
    });

    // The number on the stand a dine-in customer took, where the outlet seats them by number stands: 1–10 letters, digits and hyphens, a hyphen only between them, kept in capitals. Null or blank for none. 
    // String standNumber
    test('to test the property `standNumber`', () async {
      // TODO
    });

    // When the device made the order.
    // DateTime clientCreatedAt
    test('to test the property `clientCreatedAt`', () async {
      // TODO
    });

    // List<CreateOrderItem> items
    test('to test the property `items`', () async {
      // TODO
    });

    // The voucher the customer gave, in any case; one per order. Null or blank for none.
    // String voucherCode
    test('to test the property `voucherCode`', () async {
      // TODO
    });

    // What the cashier charged, which must be the server's total.
    // int total
    test('to test the property `total`', () async {
      // TODO
    });

    // CreateOrderPayment payment
    test('to test the property `payment`', () async {
      // TODO
    });

  });
}
