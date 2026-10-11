import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:maki_mobile/app/app.dart';
import 'package:maki_mobile/app/locale.dart';
import 'package:maki_mobile/app/router.dart';
import 'package:maki_mobile/core/api/api_client.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/token_storage.dart';
import 'package:maki_mobile/core/config/app_config.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Plus Jakarta Sans'], license);
  });

  final config = AppConfig.fromEnvironment();
  initializeTimeZones();

  // Read once, so every request can carry it without a trip to the
  // Keystore.
  final deviceTokens = DeviceTokenStore(SecureDeviceTokenStorage());
  await deviceTokens.load();

  final (:api, :session) = createApi(
    config: config,
    tokens: SecureTokenStorage(),
    deviceTokens: deviceTokens,
    deviceLanguage: () => resolveLocale(
      PlatformDispatcher.instance.locale,
      AppLocalizations.supportedLocales,
    ).languageCode,
  );
  // The access token isn't kept between launches: a stored refresh token
  // gets a new one before the first screen, so a signed-in user skips the
  // sign-in screen.
  await session.restore();

  final app = App(
    config: config,
    api: api,
    deviceTokens: deviceTokens,
    session: session,
    router: createRouter(session),
  );

  if (config.sentryDsn.isEmpty) {
    runApp(app);
    return;
  }
  await SentryFlutter.init(
    (options) => options
      ..dsn = config.sentryDsn
      ..environment = config.environment,
    appRunner: () => runApp(app),
  );
}
