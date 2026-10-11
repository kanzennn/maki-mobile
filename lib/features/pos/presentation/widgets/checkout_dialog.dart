import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/receipt_view.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The most cash one payment takes in: the server's limit.
const maxReceived = 100000000000;

/// The quick amounts the spec names, after the exact one.
const _quick = [50000, 100000];

/// Charges the order in cash, in a dialog: the cash handed over, the sale on
/// its way, sending it again when no answer came, and the receipt once it
/// is taken. [resend] opens it to send the order that got no answer again.
/// Once the cashier closes the receipt, the next customer's order begins.
Future<void> openCheckout(
  BuildContext context, {
  required Catalog catalog,
  required TillDevice device,
  bool resend = false,
}) async {
  final sale = context.read<SaleCubit>();
  if (resend) unawaited(sale.resend());
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => BlocProvider.value(
      value: sale,
      child: CheckoutDialog(catalog: catalog, device: device),
    ),
  );
  if (sale.state.sold != null) sale.nextCustomer();
}

class CheckoutDialog extends StatefulWidget {
  const CheckoutDialog({
    required this.catalog,
    required this.device,
    super.key,
  });

  final Catalog catalog;
  final TillDevice device;

  @override
  State<CheckoutDialog> createState() => _CheckoutDialogState();
}

class _CheckoutDialogState extends State<CheckoutDialog> {
  final _received = TextEditingController();

  /// The sale went without an answer: from then on the dialog offers to
  /// send it again, never a new one.
  late bool _unanswered = context.read<SaleCubit>().state.pending != null;

  @override
  void dispose() {
    _received.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaleCubit, SaleState>(
      // Only what the sale itself does: the order following a reloaded
      // catalog changes the state too.
      listenWhen: (before, now) =>
          (now.unanswered && !before.unanswered) ||
          (before.pending != null && now.pending == null && now.sold == null),
      listener: (context, sale) {
        if (sale.unanswered) {
          setState(() => _unanswered = true);
        } else {
          // Refused, or let go of: the sell screen says what to do next.
          Navigator.of(context).pop();
        }
      },
      builder: (context, sale) {
        final Widget content;
        if (sale.sold case final order?) {
          content = _Sold(order: order, outlet: widget.catalog.outlet);
        } else if (_unanswered) {
          content = _Unanswered(sale: sale);
        } else {
          content = _Cash(
            total: priced(
              sale.lines,
              widget.catalog,
              voucher: sale.voucher,
            ).totals.total,
            received: _received,
            sending: sale.sending,
            onPay: (received) => unawaited(
              context.read<SaleCubit>().pay(
                catalog: widget.catalog,
                device: widget.device,
                received: received,
              ),
            ),
          );
        }
        return PopScope(
          // A sale on its way can't be walked away from.
          canPop: !sale.sending,
          child: Dialog(
            // Room on a phone for three quick amounts side by side.
            insetPadding: const EdgeInsets.symmetric(
              horizontal: MakiSpacing.lg,
              vertical: MakiSpacing.xl,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(MakiSpacing.xl),
                child: content,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// What the customer hands over — typed, or a quick amount — and the change,
/// worked out as it is typed. Pay stays off until the cash covers the
/// total.
class _Cash extends StatelessWidget {
  const _Cash({
    required this.total,
    required this.received,
    required this.sending,
    required this.onPay,
  });

  final int total;
  final TextEditingController received;
  final bool sending;
  final ValueChanged<int> onPay;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    String money(int amount) => formatRupiah(amount, l10n.localeName);
    return ValueListenableBuilder(
      valueListenable: received,
      builder: (context, value, _) {
        final cash = parseGroupedDigits(value.text);
        final covered = cash != null && cash >= total && cash <= maxReceived;
        final short = cash != null && cash < total;
        void pay() {
          if (covered && !sending) onPay(cash);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(l10n.payTitle, style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: MakiSpacing.md),
            Text(
              l10n.payTotal,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(money(total), style: theme.textTheme.titleLarge),
            const SizedBox(height: MakiSpacing.lg),
            TextField(
              controller: received,
              enabled: !sending,
              autofocus: true,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [GroupedDigits(l10n.localeName)],
              style: theme.textTheme.titleMedium,
              decoration: InputDecoration(
                labelText: l10n.payReceived,
                prefixText: 'Rp ',
              ),
              onSubmitted: (_) => pay(),
            ),
            const SizedBox(height: MakiSpacing.md),
            Semantics(
              label: l10n.payQuick,
              container: true,
              explicitChildNodes: true,
              child: Row(
                children: [
                  for (final (i, (label, amount)) in [
                    (l10n.payExact, total),
                    for (final amount in _quick) (money(amount), amount),
                  ].indexed) ...[
                    if (i > 0) const SizedBox(width: MakiSpacing.sm),
                    Expanded(
                      child: OutlinedButton(
                        style: inlineButton.merge(
                          OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: MakiSpacing.xs,
                            ),
                          ),
                        ),
                        onPressed: sending || amount < total
                            ? null
                            : () => received.text = NumberFormat.decimalPattern(
                                l10n.localeName,
                              ).format(amount),
                        // One line, smaller if it must: an amount broken in
                        // two reads as two.
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(label, maxLines: 1),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: MakiSpacing.lg),
            Semantics(
              liveRegion: true,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: short
                      ? theme.colorScheme.errorContainer
                      : theme.colorScheme.surfaceContainerLow,
                  border: Border.all(
                    color: short
                        ? theme.colorScheme.errorContainer
                        : theme.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(MakiRadii.tile),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: MakiSpacing.lg,
                    vertical: MakiSpacing.md,
                  ),
                  child: LabelValue(
                    l10n.payChange,
                    cash == null
                        ? money(0)
                        : short
                        ? l10n.payShort(money(total - cash))
                        : money(cash - total),
                    labelStyle: theme.textTheme.titleSmall?.copyWith(
                      color: short ? theme.colorScheme.onErrorContainer : null,
                    ),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: short ? theme.colorScheme.onErrorContainer : null,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MakiSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: inlineButton,
                    onPressed: sending
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: Text(l10n.cancel),
                  ),
                ),
                const SizedBox(width: MakiSpacing.sm),
                Expanded(
                  child: FilledButton(
                    style: inlineButton,
                    onPressed: covered && !sending ? pay : null,
                    child: Text(sending ? l10n.paySending : l10n.payConfirm),
                  ),
                ),
              ],
            ),
            if (sending) ...[
              const SizedBox(height: MakiSpacing.sm),
              const LinearProgressIndicator(),
            ],
          ],
        );
      },
    );
  }
}

/// The sale went without an answer, so it may have been taken: it is sent
/// again as it was, or let go of with a warning to check today's orders.
class _Unanswered extends StatelessWidget {
  const _Unanswered({required this.sale});

  final SaleState sale;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<SaleCubit>();
    final total = sale.pending?.total ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          header: true,
          child: Text(l10n.payTitle, style: theme.textTheme.titleLarge),
        ),
        const SizedBox(height: MakiSpacing.md),
        Text(
          formatRupiah(total, l10n.localeName),
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: MakiSpacing.lg),
        FormBanner.error(l10n.payUnknown),
        const SizedBox(height: MakiSpacing.lg),
        FilledButton(
          onPressed: sale.sending ? null : () => unawaited(cubit.resend()),
          child: Text(sale.sending ? l10n.paySending : l10n.payResend),
        ),
        const SizedBox(height: MakiSpacing.sm),
        OutlinedButton(
          onPressed: sale.sending ? null : cubit.abandon,
          child: Text(l10n.payAbandon),
        ),
        const SizedBox(height: MakiSpacing.sm),
        Text(
          l10n.payAbandonWarning,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (sale.sending) ...[
          const SizedBox(height: MakiSpacing.sm),
          const LinearProgressIndicator(),
        ],
      ],
    );
  }
}

/// The sale is saved: the change to hand back, the receipt to look over,
/// and the way to the next customer.
class _Sold extends StatelessWidget {
  const _Sold({required this.order, required this.outlet});

  final Order order;
  final CatalogOutlet outlet;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final change = order.payment.change;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle_outline, color: context.tokens.brand),
            const SizedBox(width: MakiSpacing.sm),
            Expanded(
              child: Semantics(
                header: true,
                liveRegion: true,
                child: Text(l10n.doneTitle, style: theme.textTheme.titleLarge),
              ),
            ),
          ],
        ),
        if (change != null) ...[
          const SizedBox(height: MakiSpacing.sm),
          Text(
            l10n.doneChange(formatRupiah(change, l10n.localeName)),
            style: theme.textTheme.titleMedium,
          ),
        ],
        const SizedBox(height: MakiSpacing.lg),
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(MakiRadii.card),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MakiSpacing.md),
            child: ReceiptView(order: order, outlet: outlet),
          ),
        ),
        const SizedBox(height: MakiSpacing.lg),
        FilledButton(
          autofocus: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.doneNew),
        ),
      ],
    );
  }
}

/// Digits only, grouped as the language groups them while they are typed,
/// at most [maxDigits] of them.
class GroupedDigits extends TextInputFormatter {
  GroupedDigits(this.locale, {this.maxDigits = 12});

  final String locale;
  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    if (digits.isEmpty) return TextEditingValue.empty;
    if (digits.length > maxDigits) return oldValue;
    final text = NumberFormat.decimalPattern(locale).format(int.parse(digits));
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

/// The amount grouped digits stand for; null for none.
int? parseGroupedDigits(String text) {
  final digits = text.replaceAll(RegExp('[^0-9]'), '');
  return digits.isEmpty ? null : int.parse(digits);
}
