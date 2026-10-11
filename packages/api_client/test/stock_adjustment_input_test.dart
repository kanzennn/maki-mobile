import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for StockAdjustmentInput
void main() {
  final StockAdjustmentInput? instance = /* StockAdjustmentInput(...) */ null;
  // TODO add properties to the entity

  group(StockAdjustmentInput, () {
    // `in` adds, `out` takes away, `set` is a stock take: the count found.
    // String type
    test('to test the property `type`', () async {
      // TODO
    });

    // The amount to add or take away (at least 1), or the count found.
    // int qty
    test('to test the property `qty`', () async {
      // TODO
    });

    // `damaged` is damaged or spoiled; `other` says what in `note`.
    // String reason
    test('to test the property `reason`', () async {
      // TODO
    });

    // Required for the reason `other`. Shown as typed, never translated.
    // String note
    test('to test the property `note`', () async {
      // TODO
    });

  });
}
