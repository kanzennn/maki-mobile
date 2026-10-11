import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/core/utils/window_size.dart';
import 'package:maki_mobile/features/pos/domain/browse.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/device_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/pos_text.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/checkout_dialog.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/detail_items.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/device_gate.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/menu_browser.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The sell screen (DESIGN.md): the menus to pick from, and the order with
/// its pay button — from 840dp a panel beside them, below it the cart bar
/// that opens the order full screen. It sells only on one of the outlet's
/// devices; on any other phone it says how to activate it.
class SellScreen extends StatelessWidget {
  const SellScreen({super.key, this.now = DateTime.now});

  /// The clock for today's date; tests pass a fixed one.
  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<DeviceCubit, DeviceState>(
      builder: (context, device) => switch (device) {
        DeviceLoading() => const _Loading(),
        DeviceUnregistered() => DeviceGate(state: device),
        DeviceFailed(:final error) => Scaffold(
          body: SafeArea(
            child: LoadFailed(
              title: l10n.deviceCheckFailed,
              error: error,
              onRetry: () => context.read<DeviceCubit>().load(),
            ),
          ),
        ),
        DeviceReady(device: final till) =>
          BlocBuilder<CatalogCubit, CatalogState>(
            builder: (context, catalog) => switch (catalog) {
              CatalogLoading() => const _Loading(),
              CatalogFailed(:final error) => Scaffold(
                body: SafeArea(
                  child: LoadFailed(
                    title: l10n.posLoadFailed,
                    error: error,
                    onRetry: () => context.read<CatalogCubit>().retry(),
                  ),
                ),
              ),
              CatalogReady(:final catalog) => _Sell(
                catalog: catalog,
                device: till,
                now: now,
              ),
            },
          ),
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: CircularProgressIndicator()));
}

class _Sell extends StatefulWidget {
  const _Sell({required this.catalog, required this.device, required this.now});

  final Catalog catalog;
  final TillDevice device;
  final DateTime Function() now;

  @override
  State<_Sell> createState() => _SellState();
}

class _SellState extends State<_Sell> {
  final _search = TextEditingController();
  String? _category;

  @override
  void initState() {
    super.initState();
    _search.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleCubit, SaleState>(
      buildWhen: (before, now) =>
          before.lines != now.lines || before.notices != now.notices,
      builder: _build,
    );
  }

  Widget _build(BuildContext context, SaleState sale) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final size = context.windowSize;
    final catalog = widget.catalog;
    final cubit = context.read<SaleCubit>();
    // A category the catalog no longer has shows every menu.
    final category = catalog.category(_category ?? '')?.categoryId;
    final menus = shown(
      catalog.menus,
      category: category,
      search: _search.text,
    );
    final inCart = {for (final l in sale.lines) l.menuId: l.qty};

    Widget notices(EdgeInsets padding) => sale.notices.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: padding,
            child: NoticeBox(
              sentences: [
                for (final notice in sale.notices) noticeText(l10n, notice),
              ],
              onDismiss: cubit.dismissNotices,
            ),
          );
    Widget tiles(EdgeInsets padding, {required bool compact}) => CategoryTiles(
      catalog: catalog,
      selected: category,
      onSelected: (id) => setState(() => _category = id),
      compact: compact,
      padding: padding,
    );
    Widget grid(int columns, EdgeInsets padding) => MenuGrid(
      catalog: catalog,
      menus: menus,
      inCart: inCart,
      onAdd: cubit.add,
      columns: columns,
      padding: padding,
    );

    if (size != WindowSize.expanded) {
      return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  MakiSpacing.lg,
                  MakiSpacing.md,
                  MakiSpacing.lg,
                  MakiSpacing.sm,
                ),
                child: MenuSearchField(controller: _search),
              ),
              notices(
                const EdgeInsets.fromLTRB(
                  MakiSpacing.lg,
                  0,
                  MakiSpacing.lg,
                  MakiSpacing.sm,
                ),
              ),
              tiles(
                const EdgeInsets.symmetric(horizontal: MakiSpacing.lg),
                compact: true,
              ),
              const SizedBox(height: MakiSpacing.md),
              Expanded(
                child: grid(
                  size == WindowSize.compact ? 2 : 3,
                  const EdgeInsets.fromLTRB(
                    MakiSpacing.lg,
                    0,
                    MakiSpacing.lg,
                    MakiSpacing.lg,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final outlet = catalog.outlet;
    final deviceAndDay = [
      l10n.posDevice(widget.device.code, widget.device.name),
      formatDate(widget.now().toUtc(), l10n.localeName, outlet.timeZone),
    ].join(' · ');
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      MakiSpacing.xl,
                      MakiSpacing.lg,
                      MakiSpacing.xl,
                      MakiSpacing.md,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: MakiSpacing.lg,
                      runSpacing: MakiSpacing.sm,
                      children: [
                        Semantics(
                          header: true,
                          child: Text(
                            l10n.posMenuHeading,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.phone_android,
                              size: 16,
                              color: context.tokens.iconMuted,
                            ),
                            const SizedBox(width: MakiSpacing.xs),
                            Text(
                              deviceAndDay,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      MakiSpacing.xl,
                      0,
                      MakiSpacing.xl,
                      MakiSpacing.md,
                    ),
                    child: MenuSearchField(controller: _search),
                  ),
                  notices(
                    const EdgeInsets.fromLTRB(
                      MakiSpacing.xl,
                      0,
                      MakiSpacing.xl,
                      MakiSpacing.md,
                    ),
                  ),
                  tiles(
                    const EdgeInsets.symmetric(horizontal: MakiSpacing.xl),
                    compact: false,
                  ),
                  const SizedBox(height: MakiSpacing.lg),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => grid(
                        (constraints.maxWidth / 200).floor().clamp(2, 4),
                        const EdgeInsets.fromLTRB(
                          MakiSpacing.xl,
                          0,
                          MakiSpacing.xl,
                          MakiSpacing.xl,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            SizedBox(
              width: 360,
              child: DetailItems(
                catalog: catalog,
                onPay: () => openCheckout(
                  context,
                  catalog: catalog,
                  device: widget.device,
                ),
                onResend: () => openCheckout(
                  context,
                  catalog: catalog,
                  device: widget.device,
                  resend: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
