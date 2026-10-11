import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/auth/permissions.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/pos/data/pos_repository.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/catalog_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/order_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/pos_shell.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/receipt_view.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/void_dialog.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// One of today's orders: its receipt, and, with `order.void`, its void.
class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({required this.orderId, super.key});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final order = OrderCubit(context.read<PosRepository>(), orderId);
        unawaited(order.load());
        return order;
      },
      child: const _OrderDetail(),
    );
  }
}

class _OrderDetail extends StatelessWidget {
  const _OrderDetail();

  Future<void> _void(BuildContext context, Order order) async {
    final cubit = context.read<OrderCubit>();
    final reason = await askVoidReason(context, order.orderNo);
    if (reason != null) await cubit.voidOrder(reason);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final canVoid = context.select<SessionCubit, bool>(
      (s) => s.user?.can(Permissions.orderVoid) ?? false,
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.orderTitle)),
      body: BlocConsumer<OrderCubit, OrderState>(
        listenWhen: (before, now) =>
            before is OrderReady &&
            before.order.status == OrderStatus.paid &&
            now is OrderReady &&
            now.order.status == OrderStatus.voided &&
            now.voidError == null,
        listener: (context, state) {
          final order = (state as OrderReady).order;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.voidDone(order.orderNo))));
          // Its stock came back.
          unawaited(context.read<CatalogCubit>().refresh());
        },
        builder: (context, state) => switch (state) {
          OrderLoading() => const Center(child: CircularProgressIndicator()),
          OrderFailed(:final error) => LoadFailed(
            title: l10n.orderLoadFailed,
            error: error,
            onRetry: context.read<OrderCubit>().load,
          ),
          OrderReady(:final order, :final voiding, :final voidError) =>
            ListView(
              padding: const EdgeInsets.all(MakiSpacing.lg),
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: StatusBadge(order.status),
                ),
                const SizedBox(height: MakiSpacing.md),
                if (voidError != null) ...[
                  FormBanner.error(apiErrorMessage(l10n, voidError)),
                  const SizedBox(height: MakiSpacing.md),
                ],
                ReceiptView(order: order, outlet: receiptOutlet(context)),
                if (canVoid && order.status == OrderStatus.paid) ...[
                  const SizedBox(height: MakiSpacing.xl),
                  Center(
                    child: OutlinedButton.icon(
                      style: inlineButton.merge(
                        OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      onPressed: voiding ? null : () => _void(context, order),
                      icon: const Icon(Icons.block),
                      label: Text(voiding ? l10n.paySending : l10n.voidAction),
                    ),
                  ),
                ],
              ],
            ),
        },
      ),
    );
  }
}
