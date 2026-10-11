import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for OutletApi
void main() {
  final instance = MakiApiClient().getOutletApi();

  group(OutletApi, () {
    // Create an outlet
    //
    // The Owner only. The outlet starts active, with a cashier role (`checkout.create`) named in its language for its Manager to start from. 
    //
    //Future<Outlet> createOutlet(OutletInput outletInput) async
    test('test createOutlet', () async {
      // TODO
    });

    // Delete a deactivated outlet
    //
    // The Owner only. `confirm_name` must repeat the outlet's name. The outlet disappears from every list; its data stays, and its code is never used again. 
    //
    //Future deleteOutlet(String oid, DeleteOutletRequest deleteOutletRequest) async
    test('test deleteOutlet', () async {
      // TODO
    });

    // One outlet
    //
    // The Owner only.
    //
    //Future<Outlet> getOutlet(String oid) async
    test('test getOutlet', () async {
      // TODO
    });

    // List the outlets
    //
    // The Owner only. Sorted by name; deleted outlets never show.
    //
    //Future<OutletList> listOutlets({ String q, String status, int page, int pageSize }) async
    test('test listOutlets', () async {
      // TODO
    });

    // Activate or deactivate an outlet
    //
    // The Owner only. While an outlet is inactive its users can't sign in, and their sessions end at their next request. 
    //
    //Future<Outlet> setOutletStatus(String oid, OutletStatusRequest outletStatusRequest) async
    test('test setOutletStatus', () async {
      // TODO
    });

    // Change an outlet
    //
    // The Owner only. Every field but the status.
    //
    //Future<Outlet> updateOutlet(String oid, OutletInput outletInput) async
    test('test updateOutlet', () async {
      // TODO
    });

  });
}
