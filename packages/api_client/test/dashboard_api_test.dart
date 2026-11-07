import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for DashboardApi
void main() {
  final instance = MakiApiClient().getDashboardApi();

  group(DashboardApi, () {
    // The outlet's dashboard
    //
    // Needs `dashboard.view`. The dates are in the outlet's time zone. It fills `hours`, `cashiers` and `tables`, and leaves `outlets` empty. 
    //
    //Future<Dashboard> getOutletDashboard(DateTime from, DateTime to, String oid) async
    test('test getOutletDashboard', () async {
      // TODO
    });

    // The dashboard of every outlet
    //
    // The Owner, with `dashboard.view`. Each outlet's days are its own, in its time zone. It fills `outlets`, the best first, and leaves `hours`, `cashiers` and `tables` empty. 
    //
    //Future<Dashboard> getOwnerDashboard(DateTime from, DateTime to, { String outletIds }) async
    test('test getOwnerDashboard', () async {
      // TODO
    });

  });
}
