import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/app/locale.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/config/app_config.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Provides the app-wide dependencies above [MaterialApp]; everything else
/// is scoped to the screens that use it.
class App extends StatelessWidget {
  const App({
    required this.config,
    required this.api,
    required this.deviceTokens,
    required this.session,
    required this.router,
    super.key,
  });

  final AppConfig config;
  final MakiApiClient api;
  final DeviceTokenStore deviceTokens;
  final SessionCubit session;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: config),
        RepositoryProvider.value(value: api),
        RepositoryProvider.value(value: deviceTokens),
      ],
      child: BlocProvider.value(
        value: session,
        // Signed in, the app speaks the user's own language — set on the
        // server, the same on every device; before that, the device's.
        child: BlocSelector<SessionCubit, Object?, String?>(
          selector: (_) => session.user?.language,
          builder: (context, language) => MaterialApp.router(
            onGenerateTitle: (context) => AppLocalizations.of(context).appName,
            theme: buildAppTheme(),
            routerConfig: router,
            locale: language == null ? null : Locale(language),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: resolveLocale,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
