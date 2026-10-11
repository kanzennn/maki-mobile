import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_mobile/app/routes.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/core/utils/window_size.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/floor_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/floor_view.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The cashier's tables: the outlet's floor as it is now, an area at a
/// time, with each table's status. It loads again as it opens. A table
/// opens its detail, to order at it or to release it once its customers
/// have gone. Where the outlet seats its customers by number stands, the
/// page says so instead.
class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(context.read<FloorCubit>().refresh());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<FloorCubit>();
    final wide = context.windowSize == WindowSize.expanded;
    // Where the outlet seats its customers by number stands, as the catalog
    // says, there are no tables to show, and the page says why.
    final byStand = context.select<CatalogCubit, bool>(
      (c) => switch (c.state) {
        CatalogReady(:final catalog) => catalog.dineInMode == DineInMode.number,
        _ => false,
      },
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tablesTitle)),
      body: BlocBuilder<FloorCubit, FloorState>(
        builder: (context, state) => switch (state) {
          FloorLoading() => const Center(child: CircularProgressIndicator()),
          FloorFailed(:final error) => LoadFailed(
            title: l10n.tablesLoadFailed,
            error: error,
            onRetry: cubit.retry,
          ),
          FloorReady(:final floor) => RefreshIndicator(
            onRefresh: cubit.refresh,
            child: _FloorPage(
              intro: byStand ? null : l10n.tablesIntro,
              fill: wide && floor.hasTables && !byStand,
              child: floor.hasTables && !byStand
                  ? FloorPanel(
                      floor: floor,
                      fill: wide,
                      onPick: (table) => showTableDetail(context, table),
                    )
                  : Text(
                      byStand ? l10n.tablesNumberMode : l10n.tablesEmpty,
                      style: theme.textTheme.bodyMedium,
                    ),
            ),
          ),
        },
      ),
    );
  }
}

/// A page with the floor under its intro, if it has one. On a phone it is a
/// list, the layout panning inside it. On a tablet it fills the screen, the
/// floor taking what the intro leaves, so the layout shows whole at once; it
/// still scrolls, for a pull to refresh.
class _FloorPage extends StatelessWidget {
  const _FloorPage({
    required this.intro,
    required this.fill,
    required this.child,
  });

  final String? intro;
  final bool fill;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parts = [
      if (intro case final intro?) ...[
        Text(
          intro,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: MakiSpacing.lg),
      ],
    ];
    const padding = EdgeInsets.all(MakiSpacing.lg);
    if (!fill) {
      return ListView(padding: padding, children: [...parts, child]);
    }
    // The layout's last row stays clear of the system's gesture bar.
    final system = MediaQuery.paddingOf(context).bottom;
    return LayoutBuilder(
      builder: (context, viewport) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: viewport.maxHeight,
          child: Padding(
            padding: padding.copyWith(bottom: MakiSpacing.lg + system),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...parts,
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A table at the cashier, in a sheet: its status and, while customers are
/// seated there, since when and how many sales; ordering at it while it can
/// be picked; and releasing it once its customers have left, after asking.
Future<void> showTableDetail(BuildContext context, FloorTable table) {
  final floor = context.read<FloorCubit>();
  final sale = context.read<SaleCubit>();
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (sheet) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: floor),
        BlocProvider.value(value: sale),
      ],
      child: _TableDetail(tableId: table.tableId, fallback: table),
    ),
  );
}

class _TableDetail extends StatelessWidget {
  const _TableDetail({required this.tableId, required this.fallback});

  final String tableId;

  /// The table as it was tapped, while the floor in hand doesn't have it.
  final FloorTable fallback;

  Future<void> _release(BuildContext context, FloorTable table) async {
    final l10n = AppLocalizations.of(context);
    final floor = context.read<FloorCubit>();
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final sure = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(l10n.tableReleaseTitle(table.name)),
        content: Text(l10n.tableReleaseBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialog).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialog).pop(true),
            child: Text(l10n.tableRelease),
          ),
        ],
      ),
    );
    if (sure != true) return;
    try {
      await floor.release(table.tableId);
      navigator.pop();
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.tableReleased(table.name))),
      );
    } on ApiException catch (error) {
      messenger.showSnackBar(
        SnackBar(content: Text(apiErrorMessage(l10n, error))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final outlet = context.select<SessionCubit, AccountOutlet?>(
      (s) => s.user?.outlet,
    );
    final pending = context.select<SaleCubit, bool>(
      (c) => c.state.pending != null,
    );
    return BlocBuilder<FloorCubit, FloorState>(
      builder: (context, state) {
        final found = switch (state) {
          FloorReady(:final floor) => floor.find(tableId),
          _ => null,
        };
        final table = found?.table ?? fallback;
        final seated = table.seated;
        final muted = theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        );
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              MakiSpacing.lg,
              0,
              MakiSpacing.lg,
              MakiSpacing.lg,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(
                  header: true,
                  child: Text(
                    l10n.tableDetailTitle(table.name),
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                if (found != null) Text(found.area.name, style: muted),
                const SizedBox(height: MakiSpacing.md),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TableStatusChip(table.status),
                ),
                const SizedBox(height: MakiSpacing.md),
                LabelValue(l10n.tableSeatsTerm, switch (table.capacity) {
                  final int seats => l10n.tableSeats(seats),
                  null => l10n.tableNoSeats,
                }),
                if (seated != null) ...[
                  const SizedBox(height: MakiSpacing.xs),
                  LabelValue(
                    l10n.tableSince,
                    formatTime(
                      seated.since,
                      l10n.localeName,
                      outlet?.timeZone ?? 'UTC',
                    ),
                  ),
                  const SizedBox(height: MakiSpacing.xs),
                  LabelValue(l10n.tableOrders, '${seated.orders}'),
                ],
                if (table.status == TableStatus.inactive) ...[
                  const SizedBox(height: MakiSpacing.md),
                  Text(l10n.tableInactiveNote, style: muted),
                ],
                if (table.status == TableStatus.scheduled) ...[
                  const SizedBox(height: MakiSpacing.md),
                  Text(l10n.tableScheduledNote, style: muted),
                ],
                if (pending && table.selectable) ...[
                  const SizedBox(height: MakiSpacing.md),
                  Text(l10n.tablePendingHint, style: muted),
                ],
                const SizedBox(height: MakiSpacing.lg),
                if (table.selectable)
                  FilledButton(
                    onPressed: pending
                        ? null
                        : () {
                            context.read<SaleCubit>()
                              ..setType(OrderType.dineIn)
                              ..setTable(
                                OrderTable(
                                  tableId: table.tableId,
                                  name: table.name,
                                ),
                              );
                            Navigator.of(context).pop();
                            context.goNamed(Routes.pos);
                          },
                    child: Text(l10n.tableOrderHere),
                  ),
                if (table.status == TableStatus.occupied) ...[
                  const SizedBox(height: MakiSpacing.sm),
                  OutlinedButton(
                    onPressed: () => _release(context, table),
                    child: Text(l10n.tableRelease),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Picks the order's table from the floor as it is now, loaded again as it
/// opens: one the cashier can sell at, available or occupied. Full screen
/// on a phone, a dialog on a tablet.
Future<FloorTable?> pickTable(BuildContext context, {String? picked}) {
  final floor = context.read<FloorCubit>();
  unawaited(floor.refresh());
  final wide = context.windowSize == WindowSize.expanded;
  return showDialog<FloorTable>(
    context: context,
    builder: (dialog) {
      final body = BlocProvider.value(
        value: floor,
        child: _Picker(picked: picked),
      );
      return wide
          ? Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: body,
              ),
            )
          : Dialog.fullscreen(child: body);
    },
  );
}

class _Picker extends StatelessWidget {
  const _Picker({required this.picked});

  final String? picked;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<FloorCubit>();
    final wide = context.windowSize == WindowSize.expanded;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tablePickTitle),
        leading: IconButton(
          tooltip: l10n.close,
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<FloorCubit, FloorState>(
        builder: (context, state) => switch (state) {
          FloorLoading() => const Center(child: CircularProgressIndicator()),
          FloorFailed(:final error) => LoadFailed(
            title: l10n.tablesLoadFailed,
            error: error,
            onRetry: cubit.retry,
          ),
          FloorReady(:final floor) => _FloorPage(
            intro: l10n.tablePickIntro,
            fill: wide,
            child: FloorPanel(
              floor: floor,
              picked: picked,
              fill: wide,
              canPick: (table) => table.selectable,
              onPick: (table) => Navigator.of(context).pop(table),
            ),
          ),
        },
      ),
    );
  }
}
