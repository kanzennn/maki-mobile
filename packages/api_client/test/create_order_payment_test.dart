import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for CreateOrderPayment
void main() {
  final CreateOrderPayment? instance = /* CreateOrderPayment(...) */ null;
  // TODO add properties to the entity

  group(CreateOrderPayment, () {
    // PaymentMethod method
    test('to test the property `method`', () async {
      // TODO
    });

    // Cash, what the customer handed over, at least the total; the other methods have none.
    // int received
    test('to test the property `received`', () async {
      // TODO
    });

    // Debit, and only debit: the retrieval reference or approval code on the EDC machine's slip, 4 to 32 letters, digits and hyphens, in any case. Never a card's number, which is refused (`payment.reference`: `card_number`). The field's other rules are `required`, `format` and, on another method, `not_allowed`. 
    // String reference
    test('to test the property `reference`', () async {
      // TODO
    });

  });
}
