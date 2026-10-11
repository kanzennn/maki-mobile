import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for DeviceApi
void main() {
  final instance = MakiApiClient().getDeviceApi();

  group(DeviceApi, () {
    // Make this device one of the outlet's cashiers
    //
    // Sent from the device itself, by the outlet's Manager signed in on it; not the Owner, who runs no till. The device gets the next code (`K01`, `K02`, …, never used again, since it is in the receipt numbers it makes) and a token only it holds:  - a browser (`platform: web`) as the `maki_device` cookie: `HttpOnly`,   `SameSite=Strict`, 400 days, and sent again each time the cashier   starts, so a device in use keeps it; - the Android app (`platform: android`) in the body, to keep in its   secure storage and send as `X-Device-Token`.  A request whose device is the outlet's already, and in use, is 409 `device_already_active`. Recorded as `device.activated`. 
    //
    //Future<ActivatedDevice> activateDevice(String oid, ActivateDeviceRequest activateDeviceRequest) async
    test('test activateDevice', () async {
      // TODO
    });

    // The outlet's cashier devices
    //
    // The outlet's Manager, or the Owner. Those in use first, then the revoked, each by code. 
    //
    //Future<DeviceList> listDevices(String oid, { int page, int pageSize }) async
    test('test listDevices', () async {
      // TODO
    });

    // Revoke a device
    //
    // The outlet's Manager, or the Owner. The device can't sell from then on; a sale it has in progress finishes first. Revoking a revoked device changes nothing. Recorded as `device.revoked`. 
    //
    //Future revokeDevice(String oid, String did) async
    test('test revokeDevice', () async {
      // TODO
    });

  });
}
