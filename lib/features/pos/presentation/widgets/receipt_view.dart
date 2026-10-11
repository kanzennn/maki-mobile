import 'package:flutter/material.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/number.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/pos_text.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// A receipt: the outlet, the stand's number large for the waiter who
/// brings the order to it, the order's number, time, cashier, type and
/// table, its lines, the figures and the payment, and VOID with its reason
/// for a voided order. In the outlet's language and number style, whatever
/// the screen's, as the spec prints receipts and the web app shows them; on
/// paper-white, the width of a 58 mm roll.
class ReceiptView extends StatelessWidget {
  const ReceiptView({required this.order, required this.outlet, super.key});

  final Order order;

  /// Its name, address, phone, language and time zone are the receipt's.
  final CatalogOutlet outlet;

  @override
  Widget build(BuildContext context) {
    final t = lookupAppLocalizations(Locale(outlet.locale));
    final theme = Theme.of(context);
    final ink = theme.colorScheme.onSurface;
    final base = theme.textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.w400,
      color: ink,
    );
    final bold = base.copyWith(fontWeight: FontWeight.w600);
    final big = theme.textTheme.titleSmall!.copyWith(color: ink);
    String money(int amount) => formatRupiah(amount, outlet.locale);
    String rate(int bps) => formatRate(bps, outlet.locale);
    final voided = order.status == OrderStatus.voided;
    final change = order.payment.change;

    Widget row(String label, String value, {TextStyle? style}) =>
        LabelValue(label, value, style: style ?? base);

    return Semantics(
      label: t.receiptLabel(order.orderNo),
      container: true,
      child: Center(
        child: ConstrainedBox(
          // A 58 mm roll prints 48 mm: about 32 characters a line.
          constraints: const BoxConstraints(maxWidth: 300),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              border: Border.all(color: theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(MakiRadii.card),
            ),
            child: Padding(
              padding: const EdgeInsets.all(MakiSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(outlet.name, style: big, textAlign: TextAlign.center),
                  if (outlet.address case final address?)
                    Text(address, style: base, textAlign: TextAlign.center),
                  if (outlet.phone case final phone?)
                    Text(phone, style: base, textAlign: TextAlign.center),
                  if (voided) ...[
                    const SizedBox(height: MakiSpacing.md),
                    DashedDivider(color: ink),
                    const SizedBox(height: MakiSpacing.xs),
                    Text(
                      t.receiptVoid,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ink,
                        letterSpacing: 4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (order.voidReason case final reason?)
                      Text(
                        t.receiptVoidReason(reason),
                        style: base,
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: MakiSpacing.xs),
                    DashedDivider(color: ink),
                  ],
                  if (order.standNumber case final stand?) ...[
                    const SizedBox(height: MakiSpacing.md),
                    Text(
                      t.receiptStand,
                      style: base,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      stand,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: ink,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: MakiSpacing.md),
                  // On a line of its own: a 58 mm roll has no room for it
                  // beside its label.
                  Text(t.receiptNumber, style: base),
                  Text(order.orderNo, style: bold),
                  row(
                    t.receiptDate,
                    formatDateTime(
                      order.clientCreatedAt,
                      outlet.locale,
                      outlet.timeZone,
                    ),
                  ),
                  row(t.receiptCashier, order.cashierName),
                  row(t.receiptType, orderTypeLabel(t, order.type)),
                  if (order.tableName case final table?)
                    row(t.receiptTable, table),
                  const SizedBox(height: MakiSpacing.sm),
                  DashedDivider(color: ink),
                  const SizedBox(height: MakiSpacing.sm),
                  for (final line in order.lines) ...[
                    Text(line.name, style: bold),
                    row(
                      t.cartLine(line.qty, money(line.price)),
                      money(line.lineTotal),
                    ),
                    if (line.note case final note?)
                      Text(
                        note,
                        style: base.copyWith(fontStyle: FontStyle.italic),
                      ),
                    const SizedBox(height: MakiSpacing.xs),
                  ],
                  const SizedBox(height: MakiSpacing.xs),
                  DashedDivider(color: ink),
                  const SizedBox(height: MakiSpacing.sm),
                  row(t.summarySubtotal, money(order.subtotal)),
                  if (order.discount > 0)
                    row(switch (order.voucherCode) {
                      final code? => t.summaryVoucher(code),
                      null => t.summaryDiscount,
                    }, '-${money(order.discount)}'),
                  if (order.serviceBps > 0)
                    row(
                      t.receiptService(rate(order.serviceBps)),
                      money(order.service),
                    ),
                  if (order.taxBps > 0)
                    row(t.receiptTax(rate(order.taxBps)), money(order.tax)),
                  const SizedBox(height: MakiSpacing.xs),
                  DashedDivider(color: ink),
                  const SizedBox(height: MakiSpacing.xs),
                  row(t.summaryTotal, money(order.total), style: big),
                  row(
                    methodLabel(t, order.payment.method),
                    money(order.payment.received ?? order.payment.amount),
                  ),
                  if (change != null) row(t.receiptChange, money(change)),
                  const SizedBox(height: MakiSpacing.md),
                  Text(
                    t.receiptThanks,
                    style: base,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
