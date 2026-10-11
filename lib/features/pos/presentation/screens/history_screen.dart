import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maki_mobile/app/routes.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/auth/account.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/today_orders_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// Today's orders, in the outlet's time zone, newest first, voided ones
/// included: to find a receipt by part of its number, look at it again, or
/// void it.
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final orders = TodayOrdersCubit(context.read<PosRepository>());
        unawaited(orders.load());
        return orders;
      },
      child: const _History(),
    );
  }
}

class _History extends StatefulWidget {
  const _History();

  @override
  State<_History> createState() => _HistoryState();
}

class _HistoryState extends State<_History> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _open(OrderSummary order) async {
    final orders = context.read<TodayOrdersCubit>();
    await context.pushNamed(
      Routes.posOrderDetail,
      pathParameters: {'orid': order.orderId},
    );
    // It may have been voided there.
    unawaited(orders.reload());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<TodayOrdersCubit>();
    return Scaffold(
      appBar: AppBar(title: Text(l10n.historyTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              MakiSpacing.lg,
              MakiSpacing.sm,
              MakiSpacing.lg,
              MakiSpacing.md,
            ),
            child: ValueListenableBuilder(
              valueListenable: _search,
              builder: (context, value, _) => TextField(
                controller: _search,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: l10n.historySearch,
                  hintText: l10n.historySearchHint,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: value.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: l10n.posClearSearch,
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _search.clear();
                            unawaited(cubit.load());
                          },
                        ),
                ),
                onSubmitted: (q) => cubit.load(q.trim()),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodayOrdersCubit, TodayOrdersState>(
              builder: (context, state) => switch (state) {
                TodayOrdersLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                TodayOrdersFailed(:final error) => LoadFailed(
                  title: l10n.historyLoadFailed,
                  error: error,
                  onRetry: cubit.reload,
                ),
                final TodayOrdersReady ready => RefreshIndicator(
                  onRefresh: cubit.reload,
                  child: ready.orders.isEmpty
                      ? ListView(
                          padding: const EdgeInsets.all(MakiSpacing.lg),
                          children: [
                            Text(
                              ready.search.isEmpty
                                  ? l10n.historyEmpty
                                  : l10n.historyNoMatch,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.only(
                            bottom: MakiSpacing.lg,
                          ),
                          itemCount: ready.orders.length + 1,
                          separatorBuilder: (_, _) => const Divider(height: 1),
                          itemBuilder: (context, i) => i < ready.orders.length
                              ? _OrderRow(
                                  order: ready.orders[i],
                                  onTap: () => _open(ready.orders[i]),
                                )
                              : _More(state: ready, onMore: cubit.loadMore),
                        ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// An order in the list: its number on one line, then its time, items and
/// cashier; beside it, the total and whether it's paid or void.
class _OrderRow extends StatelessWidget {
  const _OrderRow({required this.order, required this.onTap});

  final OrderSummary order;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final outlet = context.select<SessionCubit, AccountOutlet?>(
      (s) => s.user?.outlet,
    );
    final time = formatTime(
      order.clientCreatedAt,
      l10n.localeName,
      outlet?.timeZone ?? 'UTC',
    );
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: MakiSpacing.lg,
          vertical: MakiSpacing.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.orderNo,
                    style: theme.textTheme.titleSmall,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    [
                      time,
                      if (order.tableName case final table?)
                        l10n.historyTable(table),
                      if (order.standNumber case final stand?)
                        l10n.historyStand(stand),
                      l10n.historyItems(order.itemCount),
                      order.cashierName,
                    ].join(' · '),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: MakiSpacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatRupiah(order.total, l10n.localeName),
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: MakiSpacing.xs),
                StatusBadge(order.status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// The end of the list: more to load, its failure, or nothing.
class _More extends StatelessWidget {
  const _More({required this.state, required this.onMore});

  final TodayOrdersReady state;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (!hasMoreOrders(state)) return const SizedBox.shrink();
    final error = state.moreError;
    return Padding(
      padding: const EdgeInsets.all(MakiSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (error != null) ...[
            Text(
              apiErrorMessage(l10n, error),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            const SizedBox(height: MakiSpacing.sm),
          ],
          OutlinedButton(
            onPressed: state.loadingMore ? null : onMore,
            child: Text(l10n.historyMore),
          ),
          if (state.loadingMore) ...[
            const SizedBox(height: MakiSpacing.sm),
            const LinearProgressIndicator(),
          ],
        ],
      ),
    );
  }
}
