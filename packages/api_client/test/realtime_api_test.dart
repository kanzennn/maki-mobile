import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for RealtimeApi
void main() {
  final instance = MakiApiClient().getRealtimeApi();

  group(RealtimeApi, () {
    // The outlet's live messages, over a WebSocket
    //
    // A WebSocket upgrade. Each message is JSON, `{\"topics\": [...]}`, naming what changed: `catalog` (menus, prices, stock, rates, payment methods), `tables` (areas, tables, schedules, the dine-in mode) or `orders` (sales and voids); the client loads that data again through its usual endpoints. The server closes with code 4000 when the client should connect again with a new ticket, which it does at the latest after 15 minutes. A client that was away should reload everything it shows when it is back. 
    //
    //Future connectRealtime(String ticket, String oid) async
    test('test connectRealtime', () async {
      // TODO
    });

    // A ticket to connect to the outlet's live messages
    //
    // For whoever may act in the outlet. Good for one connection, within the seconds it says. 
    //
    //Future<RealtimeTicket> createRealtimeTicket(String oid) async
    test('test createRealtimeTicket', () async {
      // TODO
    });

  });
}
