import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';

// tests for VoucherInput
void main() {
  final VoucherInput? instance = /* VoucherInput(...) */ null;
  // TODO add properties to the entity

  group(VoucherInput, () {
    // 3–20 letters and digits, kept in capitals; unique among the vouchers not deleted.
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // VoucherType type
    test('to test the property `type`', () async {
      // TODO
    });

    // Basis points for a percentage (1–10000), rupiah for an amount (1–1,000,000,000).
    // int value
    test('to test the property `value`', () async {
      // TODO
    });

    // A percentage's most, in rupiah; dropped for an amount.
    // int maxDiscount
    test('to test the property `maxDiscount`', () async {
      // TODO
    });

    // The subtotal the voucher needs, in rupiah.
    // int minSpend
    test('to test the property `minSpend`', () async {
      // TODO
    });

    // How many sales may use it, in every outlet together.
    // int quota
    test('to test the property `quota`', () async {
      // TODO
    });

    // When it starts, to the second; null starts at once.
    // DateTime startAt
    test('to test the property `startAt`', () async {
      // TODO
    });

    // When it stops, to the second; after `start_at`.
    // DateTime expiredAt
    test('to test the property `expiredAt`', () async {
      // TODO
    });

    // Every outlet, those still to come too; else the ones in `outlet_ids`.
    // bool allOutlets
    test('to test the property `allOutlets`', () async {
      // TODO
    });

    // The outlets it is for when it isn't for all of them; ignored when it is.
    // List<String> outletIds
    test('to test the property `outletIds`', () async {
      // TODO
    });

    // A new voucher's status, active when left out; ignored by PUT.
    // bool isActive
    test('to test the property `isActive`', () async {
      // TODO
    });

  });
}
