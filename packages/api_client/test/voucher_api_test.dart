import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for VoucherApi
void main() {
  final instance = MakiApiClient().getVoucherApi();

  group(VoucherApi, () {
    // Create a voucher
    //
    // The Owner only. Active unless `is_active` says otherwise. Recorded as `voucher.created`. 
    //
    //Future<Voucher> createVoucher(VoucherInput voucherInput) async
    test('test createVoucher', () async {
      // TODO
    });

    // Delete a voucher no sale has used
    //
    // The Owner only. The voucher disappears from every list, and its code is free again. A voucher a sale has used stays with the orders that name it (409 `voucher_used`): deactivate it instead. Recorded as `voucher.deleted`. 
    //
    //Future deleteVoucher(String vid) async
    test('test deleteVoucher', () async {
      // TODO
    });

    // One voucher
    //
    // The Owner only.
    //
    //Future<Voucher> getVoucher(String vid) async
    test('test getVoucher', () async {
      // TODO
    });

    // The vouchers an outlet's cashier can take
    //
    // The outlet's Manager, and the Owner. The vouchers for every outlet and for this one among others, whatever their status, sorted as the Owner's list. Of the outlets a voucher is for, only this one shows. 
    //
    //Future<VoucherList> listOutletVouchers(String oid, { String q, VoucherStatus status, int page, int pageSize }) async
    test('test listOutletVouchers', () async {
      // TODO
    });

    // The sales that used a voucher
    //
    // The Owner only. In every outlet, newest first, voided ones too: a void gave its use back. 
    //
    //Future<VoucherRedemptionList> listVoucherRedemptions(String vid, { int page, int pageSize }) async
    test('test listVoucherRedemptions', () async {
      // TODO
    });

    // List the vouchers
    //
    // The Owner only. The ones that run out last come first, then by code; deleted vouchers never show. 
    //
    //Future<VoucherList> listVouchers({ String q, VoucherStatus status, int page, int pageSize }) async
    test('test listVouchers', () async {
      // TODO
    });

    // Turn a voucher on or off
    //
    // The Owner only. Off, no sale can take it from the next one on; its history stays. Recorded as `voucher.activated` or `voucher.deactivated`; setting it as it is records nothing. 
    //
    //Future<Voucher> setVoucherStatus(String vid, ActiveRequest activeRequest) async
    test('test setVoucherStatus', () async {
      // TODO
    });

    // Change a voucher
    //
    // The Owner only. Every field but the status (`is_active` here is ignored). Before a sale has used the voucher everything may change; once one has (`first_used_at`), voided since or not, its code and type stay, its quota only grows and its expiry only moves later. A new expiry is in the future either way. Recorded as `voucher.updated`, with the fields that changed; a change of nothing records nothing. 
    //
    //Future<Voucher> updateVoucher(String vid, VoucherInput voucherInput) async
    test('test updateVoucher', () async {
      // TODO
    });

    // Check the code a customer gave
    //
    // Needs `checkout.create`, from one of the outlet's devices in use, as a sale does, so codes can't be tried from anywhere. Takes nothing: the sale takes its use, when it is saved.  Answers the voucher's terms, for the cashier to work its discount out again as the cart changes, and its discount on `subtotal` now. `applies` is false while `subtotal` is short of `min_spend`: the cart may still grow, and the cashier holds the payment until it does. A voucher the sale can't take is refused, first for an outlet it isn't for, then by its status. 
    //
    //Future<VoucherQuote> validateVoucher(String oid, ValidateVoucherRequest validateVoucherRequest) async
    test('test validateVoucher', () async {
      // TODO
    });

  });
}
