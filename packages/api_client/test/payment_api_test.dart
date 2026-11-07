import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for PaymentApi
void main() {
  final instance = MakiApiClient().getPaymentApi();

  group(PaymentApi, () {
    // The outlet's Payment Control
    //
    // Needs `payment.manage`. Every method, in the cashier's order.
    //
    //Future<PaymentMethods> listPaymentMethods(String oid) async
    test('test listPaymentMethods', () async {
      // TODO
    });

    // Turn the outlet's payment methods on or off
    //
    // Needs `payment.manage`. Methods left out stay as they are. Cash stays on (`payment_method_required`), and a method not released yet can't be turned on (`payment_method_coming_soon`). A change is `payment.updated` in the Log Action; saving what is so records nothing. Each method's `method` is `required`, `oneof` or `duplicate`, and its `is_enabled` is `required`. 
    //
    //Future<PaymentMethods> setPaymentMethods(String oid, SetPaymentMethodsRequest setPaymentMethodsRequest) async
    test('test setPaymentMethods', () async {
      // TODO
    });

  });
}
