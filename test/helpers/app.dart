import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maki_mobile/app/app.dart';
import 'package:maki_mobile/app/router.dart';
import 'package:maki_mobile/core/api/api_client.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/config/app_config.dart';

import 'fakes.dart';

/// A phone in portrait, and a tablet in landscape: the two layouts.
const phoneSize = Size(390, 844);
const tabletSize = Size(1280, 800);
const Map<String, Size> testSizes = {'phone': phoneSize, 'tablet': tabletSize};

const testConfig = AppConfig(
  environment: 'test',
  apiBaseUrl: 'http://api.test',
  sentryDsn: '',
);

/// The app as main.dart builds it, over [FakeHttpAdapter].
typedef TestApp = ({
  SessionCubit session,
  FakeHttpAdapter adapter,
  FakeTokenStorage tokens,
  FakeDeviceTokenStorage deviceStorage,
  DeviceTokenStore deviceTokens,
});

/// 10:00 on 1 October 2026 in Bandung: the cashier's clock in tests.
final testNow = DateTime.utc(2026, 10, 1, 3);

/// Pumps the whole app at [size], in Indonesian, answering requests from
/// [routes]. A [savedRefreshToken] is a previous launch's session, restored
/// before the first frame; a [deviceToken] makes the phone an activated
/// cashier device. The cashier's clock is [now], [testNow] unless given.
Future<TestApp> pumpApp(
  WidgetTester tester, {
  Size size = phoneSize,
  String? savedRefreshToken,
  String? deviceToken,
  Map<String, (int, Object?) Function(RequestOptions)> routes = const {},
  DateTime Function()? now,
  double textScale = 1,
}) async {
  tester.view
    ..physicalSize = size
    ..devicePixelRatio = 1;
  tester.platformDispatcher
    ..localesTestValue = const [Locale('id')]
    ..textScaleFactorTestValue = textScale;
  addTearDown(tester.view.reset);
  addTearDown(tester.platformDispatcher.clearLocalesTestValue);
  addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

  final tokens = FakeTokenStorage(savedRefreshToken);
  final deviceStorage = FakeDeviceTokenStorage(deviceToken);
  final deviceTokens = DeviceTokenStore(deviceStorage);
  await deviceTokens.load();
  final (:api, :session) = createApi(
    config: testConfig,
    tokens: tokens,
    deviceTokens: deviceTokens,
    deviceLanguage: () => 'id',
  );
  addTearDown(session.close);
  final adapter = FakeHttpAdapter(routes);
  api.dio.httpClientAdapter = adapter;
  await tester.runAsync(session.restore);

  await tester.pumpWidget(
    App(
      config: testConfig,
      api: api,
      deviceTokens: deviceTokens,
      session: session,
      router: createRouter(session, now: now ?? () => testNow),
    ),
  );
  await tester.pumpAndSettle();
  return (
    session: session,
    adapter: adapter,
    tokens: tokens,
    deviceStorage: deviceStorage,
    deviceTokens: deviceTokens,
  );
}
