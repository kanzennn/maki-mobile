/// Build-time configuration, passed with
/// `--dart-define-from-file=env/<flavor>.json`. Everything here is compiled
/// into the app and can be read out of it, so it never holds a secret.
class AppConfig {
  const AppConfig({
    required this.environment,
    required this.apiBaseUrl,
    required this.sentryDsn,
  });

  /// Reads the values compiled in with `--dart-define`.
  factory AppConfig.fromEnvironment() => AppConfig.fromValues(const {
    'APP_ENV': String.fromEnvironment('APP_ENV'),
    'API_BASE_URL': String.fromEnvironment('API_BASE_URL'),
    'SENTRY_DSN': String.fromEnvironment('SENTRY_DSN'),
  });

  /// Fails at startup, naming every missing value, instead of failing later
  /// on the first request.
  factory AppConfig.fromValues(Map<String, String> values) {
    final missing = [
      for (final key in const ['APP_ENV', 'API_BASE_URL'])
        if ((values[key] ?? '').isEmpty) key,
    ];
    if (missing.isNotEmpty) {
      throw StateError(
        'Missing build configuration: ${missing.join(', ')}. '
        'Run with --dart-define-from-file=env/<flavor>.json.',
      );
    }
    return AppConfig(
      environment: values['APP_ENV']!,
      apiBaseUrl: values['API_BASE_URL']!,
      sentryDsn: values['SENTRY_DSN'] ?? '',
    );
  }

  final String environment;
  final String apiBaseUrl;

  /// Empty turns error reporting off.
  final String sentryDsn;
}
