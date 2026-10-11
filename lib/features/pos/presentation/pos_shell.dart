import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_api_client/maki_api_client.dart';
import 'package:maki_mobile/app/routes.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/auth/device_token.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/window_size.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/floor_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The cashier's frame. It holds what its screens share for as long as the
/// cashier is open — the catalog, the tables, this device, the order being
/// rung up — so the order stays while the cashier looks at today's orders,
/// and goes once the user signs out. Below 840dp it has DESIGN.md's bottom
/// navigation with the cart bar above it; from 840dp, a navigation rail.
/// Tables is in the navigation when the outlet has some.
class PosShell extends StatelessWidget {
  const PosShell({
    required this.location,
    required this.child,
    super.key,
    this.now = DateTime.now,
  });

  /// The path shown, which picks the navigation item.
  final String location;
  final Widget child;

  /// The clock the orders are made by; tests pass a fixed one.
  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PosRepository(
        context.read<MakiApiClient>(),
        context.read<DeviceTokenStore>(),
        // The router lets in only a user who may check out, and so works in
        // an outlet. Read once: signing out rebuilds this frame once more
        // before the router takes it away.
        outletId: context.read<SessionCubit>().user!.outletId!,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) {
              final catalog = CatalogCubit(context.read<PosRepository>());
              unawaited(catalog.start());
              return catalog;
            },
          ),
          BlocProvider(
            lazy: false,
            create: (context) {
              final floor = FloorCubit(context.read<PosRepository>());
              unawaited(floor.start());
              return floor;
            },
          ),
          BlocProvider(
            lazy: false,
            create: (context) {
              final device = DeviceCubit(context.read<PosRepository>());
              unawaited(device.load());
              return device;
            },
          ),
          BlocProvider(
            create: (context) =>
                SaleCubit(context.read<PosRepository>(), now: now),
          ),
        ],
        child: _Bridges(
          child: _Frame(location: location, child: child),
        ),
      ),
    );
  }
}

/// What one of the cashier's Cubits does that another must follow: Cubits
/// don't call each other (architecture standard §4), so the frame does.
///
/// - The catalog loads: the order follows it.
/// - A sale is taken: the device's count moves past its number, and the
///   catalog loads again for the stock it took, the tables for the
///   customers it seated.
/// - A sale is refused: what the refusal names loads again — the device for
///   a `device_*` code, the tables for `table_unavailable`, the catalog and
///   the tables for `dine_in_mode_changed`, the catalog for the rest.
/// - The app comes back to the front: they all load again; in the
///   background, the catalog and the tables stop loading.
class _Bridges extends StatefulWidget {
  const _Bridges({required this.child});

  final Widget child;

  @override
  State<_Bridges> createState() => _BridgesState();
}

class _BridgesState extends State<_Bridges> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final catalog = context.read<CatalogCubit>();
    final floor = context.read<FloorCubit>();
    switch (state) {
      case AppLifecycleState.resumed:
        unawaited(catalog.resumed());
        unawaited(floor.resumed());
        unawaited(context.read<DeviceCubit>().refresh());
      case AppLifecycleState.hidden || AppLifecycleState.paused:
        catalog.paused();
        floor.paused();
      case AppLifecycleState.inactive || AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CatalogCubit, CatalogState>(
          listener: (context, state) {
            if (state case CatalogReady(:final catalog)) {
              context.read<SaleCubit>().follow(catalog);
            }
          },
        ),
        BlocListener<SaleCubit, SaleState>(
          listenWhen: (before, now) => before.sold == null && now.sold != null,
          listener: (context, sale) {
            context.read<DeviceCubit>().sold(sale.sold!.orderNo);
            unawaited(context.read<CatalogCubit>().refresh());
            unawaited(context.read<FloorCubit>().refresh());
          },
        ),
        BlocListener<SaleCubit, SaleState>(
          listenWhen: (before, now) =>
              now.refused != null && before.refused != now.refused,
          listener: (context, sale) {
            if (sale.refused!.code.startsWith('device_')) {
              unawaited(context.read<DeviceCubit>().refresh());
            } else if (sale.refused!.code == 'table_unavailable') {
              unawaited(context.read<FloorCubit>().refresh());
            } else if (sale.refused!.code == 'dine_in_mode_changed') {
              unawaited(context.read<CatalogCubit>().refresh());
              unawaited(context.read<FloorCubit>().refresh());
            } else {
              unawaited(context.read<CatalogCubit>().refresh());
            }
          },
        ),
      ],
      child: widget.child,
    );
  }
}

/// Where in the frame [location] is: one of the navigation's places, and
/// whether the order is full screen there.
({String here, bool fullScreen}) _place(String location) => (
  here: location.startsWith('/pos/history')
      ? Routes.posHistory
      : location.startsWith('/pos/account')
      ? Routes.posAccount
      : location.startsWith('/pos/tables')
      ? Routes.posTables
      : Routes.pos,
  // The order full screen has the pay button where the navigation is.
  fullScreen: location == '/pos/order',
);

class _Frame extends StatefulWidget {
  const _Frame({required this.location, required this.child});

  final String location;
  final Widget child;

  @override
  State<_Frame> createState() => _FrameState();
}

class _FrameState extends State<_Frame> {
  @override
  void didUpdateWidget(_Frame old) {
    super.didUpdateWidget(old);
    // A snackbar speaks of the place it showed on ("Meja A1 dikosongkan."),
    // and shows where the order's pay button is: it goes with its place
    // rather than cover what the next place has there.
    if (_place(old.location) != _place(widget.location)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) ScaffoldMessenger.of(context).removeCurrentSnackBar();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasTables = context.select<FloorCubit, bool>((c) => c.hasTables);
    final items = [
      (
        Routes.pos,
        Icons.point_of_sale_outlined,
        Icons.point_of_sale,
        l10n.navCashier,
      ),
      if (hasTables)
        (
          Routes.posTables,
          Icons.table_restaurant_outlined,
          Icons.table_restaurant,
          l10n.navTables,
        ),
      (
        Routes.posHistory,
        Icons.receipt_long_outlined,
        Icons.receipt_long,
        l10n.navHistory,
      ),
      (
        Routes.posAccount,
        Icons.account_circle_outlined,
        Icons.account_circle,
        l10n.navAccount,
      ),
    ];
    final (:here, :fullScreen) = _place(widget.location);
    // The tables' page stays where it is when the outlet's last table goes.
    final index = items.indexWhere((item) => item.$1 == here);
    void go(int i) => context.goNamed(items[i].$1);

    if (context.windowSize == WindowSize.expanded) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              right: false,
              child: NavigationRail(
                selectedIndex: index < 0 ? null : index,
                onDestinationSelected: go,
                labelType: NavigationRailLabelType.all,
                destinations: [
                  for (final (_, icon, selected, label) in items)
                    NavigationRailDestination(
                      icon: Icon(icon),
                      selectedIcon: Icon(selected),
                      label: Text(label),
                    ),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(child: widget.child),
          ],
        ),
      );
    }
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: fullScreen
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (here == Routes.pos) const _CartBar(),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ),
                  child: NavigationBar(
                    // A bar always has one selected: the cashier's, on the
                    // tables' page of an outlet whose last table just went.
                    selectedIndex: index < 0 ? 0 : index,
                    onDestinationSelected: go,
                    destinations: [
                      for (final (_, icon, selected, label) in items)
                        NavigationDestination(
                          icon: Icon(icon),
                          selectedIcon: Icon(selected),
                          label: label,
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

/// DESIGN.md's cart bar, once the order has a line: the item count and the
/// total, and the button that opens the order full screen.
class _CartBar extends StatelessWidget {
  const _CartBar();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final catalog = context.select<CatalogCubit, Catalog?>(
      (cubit) => switch (cubit.state) {
        CatalogReady(:final catalog) => catalog,
        _ => null,
      },
    );
    return BlocBuilder<SaleCubit, SaleState>(
      builder: (context, sale) {
        if (catalog == null || (sale.lines.isEmpty && sale.pending == null)) {
          return const SizedBox.shrink();
        }
        final sold = priced(sale.lines, catalog);
        return DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border(top: BorderSide(color: theme.colorScheme.outline)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MakiSpacing.lg,
              vertical: MakiSpacing.sm,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.cartItems(sold.count),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        formatRupiah(sold.totals.total, l10n.localeName),
                        style: context.tokens.priceLarge.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  style: inlineButton,
                  onPressed: () => context.goNamed(Routes.posOrder),
                  child: Text(l10n.cartView),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// The outlet as a receipt shows it: the catalog's, or the user's own
/// outlet while the catalog hasn't loaded.
CatalogOutlet receiptOutlet(BuildContext context) {
  final catalog = context.read<CatalogCubit>().state;
  if (catalog case CatalogReady(:final catalog)) return catalog.outlet;
  final outlet = context.read<SessionCubit>().user?.outlet;
  return CatalogOutlet(
    outletId: outlet?.outletId ?? '',
    code: outlet?.code ?? '',
    name: outlet?.name ?? '',
    timeZone: outlet?.timeZone ?? 'UTC',
    locale: outlet?.locale ?? 'id',
    taxBps: 0,
    serviceBps: 0,
  );
}
