import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/core/config/app_config.dart';

void main() {
  test('reads a complete configuration', () {
    final config = AppConfig.fromValues(const {
      'APP_ENV': 'development',
      'API_BASE_URL': 'http://10.0.2.2:8080',
    });

    expect(config.environment, 'development');
    expect(config.apiBaseUrl, 'http://10.0.2.2:8080');
    expect(config.sentryDsn, isEmpty);
  });

  test('names every missing value at once', () {
    expect(
      () => AppConfig.fromValues(const {}),
      throwsA(
        isA<StateError>().having(
          (error) => error.message,
          'message',
          allOf(contains('APP_ENV'), contains('API_BASE_URL')),
        ),
      ),
    );
  });
}
