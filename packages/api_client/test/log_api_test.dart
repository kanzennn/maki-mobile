import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for LogApi
void main() {
  final instance = MakiApiClient().getLogApi();

  group(LogApi, () {
    // The outlet's Log Action
    //
    // Needs `log.view`. The outlet's entries alone, newest first.
    //
    //Future<ActionLogList> listOutletLogs(String oid, { DateTime from, DateTime to, String action, String userId, int page, int pageSize }) async
    test('test listOutletLogs', () async {
      // TODO
    });

    // The Log Action of every outlet
    //
    // The Owner, with `log.view`. Every entry, newest first.
    //
    //Future<ActionLogList> listOwnerLogs({ DateTime from, DateTime to, String action, String outletIds, bool self, int page, int pageSize }) async
    test('test listOwnerLogs', () async {
      // TODO
    });

  });
}
