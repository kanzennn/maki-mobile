import 'package:test/test.dart';
import 'package:maki_api_client/maki_api_client.dart';


/// tests for HealthApi
void main() {
  final instance = MakiApiClient().getHealthApi();

  group(HealthApi, () {
    // Liveness probe
    //
    // Reports that the process is up. Never touches dependencies.
    //
    //Future<Status> getHealthz() async
    test('test getHealthz', () async {
      // TODO
    });

    // Readiness probe
    //
    // Reports whether the database answers within two seconds.
    //
    //Future<Status> getReadyz() async
    test('test getReadyz', () async {
      // TODO
    });

  });
}
