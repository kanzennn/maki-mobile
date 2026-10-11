import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_mobile/app/routes.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/auth/session_state.dart';
import 'package:maki_mobile/features/auth/presentation/screens/change_password_screen.dart';
import 'package:maki_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:maki_mobile/features/auth/presentation/screens/no_access_screen.dart';
import 'package:maki_mobile/features/pos/presentation/pos_shell.dart';
import 'package:maki_mobile/features/pos/presentation/screens/account_screen.dart';
import 'package:maki_mobile/features/pos/presentation/screens/history_screen.dart';
import 'package:maki_mobile/features/pos/presentation/screens/order_detail_screen.dart';
import 'package:maki_mobile/features/pos/presentation/screens/order_screen.dart';
import 'package:maki_mobile/features/pos/presentation/screens/sell_screen.dart';
import 'package:maki_mobile/features/pos/presentation/screens/tables_screen.dart';

export 'package:maki_mobile/app/routes.dart';

/// The app's routes. The redirect keeps a signed-out user on the sign-in
/// screen — deep links included — tells a user who may not check out that
/// this app isn't for them, holds a user who must change their password on
/// that screen, and runs again whenever the session changes. The backend
/// enforces every permission regardless.
///
/// The cashier's routes share one frame ([PosShell]), which holds the
/// catalog, this device and the order being rung up while the cashier moves
/// between them. [now] is the clock its screens and orders go by.
GoRouter createRouter(
  SessionCubit session, {
  DateTime Function() now = DateTime.now,
}) {
  return GoRouter(
    initialLocation: '/pos',
    refreshListenable: _StreamListenable(session.stream),
    redirect: (context, state) =>
        redirectFor(session.state, state.matchedLocation),
    routes: [
      GoRoute(
        path: '/login',
        name: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/change-password',
        name: Routes.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/no-access',
        name: Routes.noAccess,
        builder: (context, state) => const NoAccessScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            PosShell(location: state.uri.path, now: now, child: child),
        routes: [
          // The navigation's places change without a transition, as tabs
          // do; what opens from them slides in.
          GoRoute(
            path: '/pos',
            name: Routes.pos,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: SellScreen(now: now)),
            routes: [
              GoRoute(
                path: 'order',
                name: Routes.posOrder,
                builder: (context, state) => const OrderScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/pos/tables',
            name: Routes.posTables,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TablesScreen()),
          ),
          GoRoute(
            path: '/pos/history',
            name: Routes.posHistory,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HistoryScreen()),
            routes: [
              GoRoute(
                path: ':orid',
                name: Routes.posOrderDetail,
                builder: (context, state) =>
                    OrderDetailScreen(orderId: state.pathParameters['orid']!),
              ),
            ],
          ),
          GoRoute(
            path: '/pos/account',
            name: Routes.posAccount,
            pageBuilder: (context, state) =>
                NoTransitionPage(child: AccountScreen(now: now)),
          ),
        ],
      ),
    ],
  );
}

/// Where [location] should go instead, for a user in [session]; null stays.
@visibleForTesting
String? redirectFor(SessionState session, String location) {
  return switch (session) {
    SessionSignedOut() => location == '/login' ? null : '/login',
    // First, since the rest of the app isn't theirs: not even a password
    // of their own is needed to be told so.
    SessionSignedIn(:final user) when !user.canUseCashier =>
      location == '/no-access' ? null : '/no-access',
    SessionSignedIn(:final user) when user.mustChangePassword =>
      location == '/change-password' ? null : '/change-password',
    SessionSignedIn() =>
      location == '/login' || location == '/no-access' ? '/pos' : null,
  };
}

/// Adapts a Bloc's stream to the [Listenable] go_router listens to.
class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<Object?> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
