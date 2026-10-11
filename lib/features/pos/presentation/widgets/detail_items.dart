import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maki_mobile/app/theme/app_theme.dart';
import 'package:maki_mobile/app/theme/tokens.dart';
import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/number.dart';
import 'package:maki_mobile/core/widgets/form_banner.dart';
import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/checkout.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/domain/stand.dart';
import 'package:maki_mobile/features/pos/domain/totals.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/floor_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/features/pos/presentation/pos_text.dart';
import 'package:maki_mobile/features/pos/presentation/screens/tables_screen.dart';
import 'package:maki_mobile/features/pos/presentation/widgets/pos_parts.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// DESIGN.md's Detail Items: the order type and, for dine-in, its table if
/// the outlet has tables, or the number on the customer's stand where the
/// outlet seats its customers by number stands; the lines with their
/// steppers and notes, the voucher, the summary, the payment methods, and
/// the pay button pinned at the foot. While a sale's answer hasn't come,
/// the order can't change: the button sends it again instead.
class DetailItems extends StatelessWidget {
  const DetailItems({
    required this.catalog,
    required this.onPay,
    required this.onResend,
    super.key,
    this.showTitle = true,
    this.showNotices = false,
  });

  final Catalog catalog;
  final VoidCallback onPay;
  final VoidCallback onResend;

  /// The panel's own title, which a full screen has in its app bar instead.
  final bool showTitle;

  /// What changed, said here too where the menus aren't in view.
  final bool showNotices;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<SaleCubit>();
    final hasTables = context.select<FloorCubit, bool>((c) => c.hasTables);
    return BlocBuilder<SaleCubit, SaleState>(
      builder: (context, sale) {
        final sold = priced(sale.lines, catalog, voucher: sale.voucher);
        final menus = catalog.menusById;
        final locked = sale.pending != null;
        final cash = catalog.paymentMethods.contains(PaymentMethod.cash);
        final tooMuch = sold.totals.subtotal > maxSubtotal;
        final money = formatRupiah(sold.totals.total, l10n.localeName);
        // One way to seat a dine-in order, the outlet's: a table, always
        // optional, or a stand's number, needed before paying. What an
        // order on its way carries shows either way.
        final dineIn = sale.type == OrderType.dineIn;
        final byStand = catalog.dineInMode == DineInMode.number;
        final standMissing = dineIn && byStand && !validStand(sale.standNumber);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(MakiSpacing.lg),
                children: [
                  if (showNotices && sale.notices.isNotEmpty) ...[
                    NoticeBox(
                      sentences: [
                        for (final notice in sale.notices)
                          noticeText(l10n, notice),
                      ],
                      onDismiss: cubit.dismissNotices,
                    ),
                    const SizedBox(height: MakiSpacing.lg),
                  ],
                  if (showTitle) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Semantics(
                            header: true,
                            child: Text(
                              l10n.cartTitle,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Text(
                          l10n.cartItems(sold.count),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: MakiSpacing.md),
                  ],
                  OrderTypeTiles(
                    value: sale.type,
                    onChanged: locked ? null : cubit.setType,
                  ),
                  if (dineIn &&
                      (sale.table != null || (!byStand && hasTables))) ...[
                    const SizedBox(height: MakiSpacing.sm),
                    TableChoice(
                      table: sale.table,
                      onPick: locked
                          ? null
                          : () async {
                              final picked = await pickTable(
                                context,
                                picked: sale.table?.tableId,
                              );
                              if (picked != null) {
                                cubit.setTable(
                                  OrderTable(
                                    tableId: picked.tableId,
                                    name: picked.name,
                                  ),
                                );
                              }
                            },
                      onRemove: locked ? null : () => cubit.setTable(null),
                    ),
                  ],
                  if (dineIn && (byStand || sale.standNumber.isNotEmpty)) ...[
                    const SizedBox(height: MakiSpacing.md),
                    StandField(value: sale.standNumber, locked: locked),
                  ],
                  const SizedBox(height: MakiSpacing.sm),
                  if (sale.lines.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: MakiSpacing.xl,
                      ),
                      child: Text(
                        l10n.cartEmpty,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  else
                    for (final line in sale.lines)
                      if (menus[line.menuId] case final menu?)
                        CartLineTile(
                          key: ValueKey(line.menuId),
                          line: line,
                          menu: menu,
                          category: catalog.category(menu.categoryId),
                          locked: locked,
                        ),
                  const SizedBox(height: MakiSpacing.md),
                  VoucherSection(
                    catalog: catalog,
                    applies: sold.voucherApplies,
                  ),
                  const Divider(height: MakiSpacing.xl),
                  OrderSummary(
                    count: sold.count,
                    totals: sold.totals,
                    outlet: catalog.outlet,
                    voucherCode: sale.voucher?.code,
                  ),
                  const SizedBox(height: MakiSpacing.xl),
                  PaymentTiles(available: catalog.paymentMethods),
                  if (tooMuch) ...[
                    const SizedBox(height: MakiSpacing.lg),
                    FormBanner.error(
                      l10n.cartTooMuch(
                        formatRupiah(maxSubtotal, l10n.localeName),
                      ),
                    ),
                  ],
                  if (!cash) ...[
                    const SizedBox(height: MakiSpacing.lg),
                    FormBanner.error(l10n.cartNoCash),
                  ],
                  if (locked) ...[
                    const SizedBox(height: MakiSpacing.lg),
                    FormBanner.error(l10n.cartLocked),
                  ],
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: theme.colorScheme.outline),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(MakiSpacing.lg),
                  child: locked
                      ? FilledButton(
                          onPressed: sale.sending ? null : onResend,
                          child: Text(
                            sale.sending ? l10n.paySending : l10n.payResend,
                          ),
                        )
                      : FilledButton(
                          onPressed:
                              sale.lines.isEmpty ||
                                  tooMuch ||
                                  !cash ||
                                  !sold.voucherApplies ||
                                  standMissing
                              ? null
                              : onPay,
                          child: Text(l10n.cartPay(money)),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// The voucher the customer gives, one per order: typed and checked with
/// the server, then shown with the way to take it off. Short of its minimum
/// spend it says so, and the order can't be paid yet.
class VoucherSection extends StatefulWidget {
  const VoucherSection({
    required this.catalog,
    required this.applies,
    super.key,
  });

  /// The prices the cart's subtotal is checked at.
  final Catalog catalog;

  /// False while the subtotal is short of the voucher's minimum spend.
  final bool applies;

  @override
  State<VoucherSection> createState() => _VoucherSectionState();
}

class _VoucherSectionState extends State<VoucherSection> {
  final _code = TextEditingController();

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  void _apply() => unawaited(
    context.read<SaleCubit>().applyVoucher(_code.text, widget.catalog),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tokens = context.tokens;
    return BlocConsumer<SaleCubit, SaleState>(
      listenWhen: (before, now) =>
          before.voucher == null && now.voucher != null,
      listener: (context, sale) => _code.clear(),
      builder: (context, sale) {
        final locked = sale.pending != null;
        final voucher = sale.voucher;
        if (voucher != null) {
          final minSpend = voucher.minSpend;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  border: Border.all(color: theme.colorScheme.primary),
                  borderRadius: BorderRadius.circular(MakiRadii.tile),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: MakiSpacing.md,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_offer_outlined,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: MakiSpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              voucher.code,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                            if (voucher.name case final name?)
                              Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.voucherRemove(voucher.code),
                        onPressed: locked
                            ? null
                            : context.read<SaleCubit>().removeVoucher,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
              ),
              if (!widget.applies && minSpend != null) ...[
                const SizedBox(height: MakiSpacing.sm),
                Semantics(
                  liveRegion: true,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: tokens.warningContainer,
                      borderRadius: BorderRadius.circular(MakiRadii.control),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(MakiSpacing.sm),
                      child: Text(
                        l10n.voucherMinSpend(
                          formatRupiah(minSpend, l10n.localeName),
                        ),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: tokens.onWarningContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          );
        }
        final error = sale.voucherError;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _code,
                enabled: !locked,
                textCapitalization: TextCapitalization.characters,
                autocorrect: false,
                enableSuggestions: false,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _apply(),
                decoration: InputDecoration(
                  labelText: l10n.voucherLabel,
                  hintText: l10n.voucherHint,
                  errorText: error == null
                      ? null
                      : apiErrorMessage(l10n, error),
                  errorMaxLines: 3,
                ),
              ),
            ),
            const SizedBox(width: MakiSpacing.sm),
            // Level with the field's box, which starts at the field's top;
            // a refused code's reason goes below it.
            ListenableBuilder(
              listenable: _code,
              builder: (context, _) => OutlinedButton(
                style: inlineButton,
                onPressed:
                    locked || sale.checkingVoucher || _code.text.trim().isEmpty
                    ? null
                    : _apply,
                child: Text(
                  sale.checkingVoucher
                      ? l10n.voucherChecking
                      : l10n.voucherApply,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Dine-in or takeaway, as two tiles that work as radio buttons.
/// The dine-in order's table: a button to pick one, always optional, or
/// the one picked, with ways to change it or let it go.
class TableChoice extends StatelessWidget {
  const TableChoice({
    required this.table,
    required this.onPick,
    required this.onRemove,
    super.key,
  });

  final OrderTable? table;

  /// Null while the order can't change.
  final VoidCallback? onPick;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final table = this.table;
    if (table == null) {
      return OutlinedButton.icon(
        onPressed: onPick,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          alignment: AlignmentDirectional.centerStart,
        ),
        icon: const Icon(Icons.table_restaurant_outlined),
        label: Row(
          children: [
            Expanded(child: Text(l10n.tablePick)),
            Text(
              l10n.tablePickOptional,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        border: Border.all(color: context.tokens.brand),
        borderRadius: BorderRadius.circular(MakiRadii.tile),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: MakiSpacing.md),
        child: Row(
          children: [
            Icon(
              Icons.table_restaurant,
              size: 18,
              color: theme.colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: MakiSpacing.sm),
            Expanded(
              child: Text(
                l10n.tableChosen(table.name),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            TextButton(onPressed: onPick, child: Text(l10n.tableChange)),
            IconButton(
              tooltip: l10n.tableLetGo(table.name),
              onPressed: onRemove,
              icon: const Icon(Icons.close),
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}

/// The number on the dine-in customer's stand, typed as the stand shows it
/// and needed before paying. What it takes is said once the cashier leaves
/// the field with a number the server wouldn't keep.
class StandField extends StatefulWidget {
  const StandField({required this.value, required this.locked, super.key});

  /// The number as the order has it.
  final String value;

  /// An order is on its way: the number stays as it was sent.
  final bool locked;

  @override
  State<StandField> createState() => _StandFieldState();
}

class _StandFieldState extends State<StandField> {
  late final _number = TextEditingController(text: widget.value);
  final _focus = FocusNode();
  bool _left = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (!_focus.hasFocus && !_left) setState(() => _left = true);
    });
  }

  @override
  void didUpdateWidget(StandField old) {
    super.didUpdateWidget(old);
    // The order let go of the number (the next customer, the outlet's way
    // changing): the field follows.
    if (widget.value != _number.text) _number.text = widget.value;
  }

  @override
  void dispose() {
    _number.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final value = widget.value;
    final wrong = _left && value.trim().isNotEmpty && !validStand(value);
    return TextField(
      controller: _number,
      focusNode: _focus,
      enabled: !widget.locked,
      textCapitalization: TextCapitalization.characters,
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.done,
      inputFormatters: const [CodePointLimit(maxStand), Capitals()],
      decoration: InputDecoration(
        labelText: l10n.standLabel,
        hintText: l10n.standPlaceholder,
        helperText: l10n.standHint,
        helperMaxLines: 2,
        errorText: wrong ? l10n.standFormat : null,
        errorMaxLines: 2,
        prefixIcon: const Icon(Icons.tag),
      ),
      onChanged: context.read<SaleCubit>().setStandNumber,
    );
  }
}

class OrderTypeTiles extends StatelessWidget {
  const OrderTypeTiles({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final OrderType value;

  /// Null while the order can't change.
  final ValueChanged<OrderType>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final onChanged = this.onChanged;
    return Semantics(
      label: l10n.cartType,
      container: true,
      explicitChildNodes: true,
      child: Row(
        children: [
          for (final (i, type) in OrderType.values.indexed) ...[
            if (i > 0) const SizedBox(width: MakiSpacing.sm),
            Expanded(
              child: SelectTile(
                label: orderTypeLabel(l10n, type),
                selected: value == type,
                enabled: onChanged != null,
                onTap: onChanged == null ? null : () => onChanged(type),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A tile of a group of which one is chosen: `primary-container` with a
/// `primary` border when it is.
class SelectTile extends StatelessWidget {
  const SelectTile({
    required this.label,
    required this.selected,
    super.key,
    this.enabled = true,
    this.onTap,
    this.icon,
    this.note,
  });

  final String label;
  final bool selected;

  /// Whether it can be chosen at all; one that can't is greyed.
  final bool enabled;
  final VoidCallback? onTap;
  final IconData? icon;

  /// Under the label, such as Coming soon.
  final String? note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tokens = context.tokens;
    final ink = selected
        ? theme.colorScheme.primary
        : enabled
        ? theme.colorScheme.onSurface
        : theme.colorScheme.onSurfaceVariant;
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      enabled: enabled,
      child: Material(
        color: selected
            ? theme.colorScheme.primaryContainer
            : enabled
            ? theme.colorScheme.surface
            : tokens.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MakiRadii.tile),
          side: BorderSide(
            color: selected ? tokens.brand : theme.colorScheme.outline,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 48),
            child: Padding(
              padding: const EdgeInsets.all(MakiSpacing.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon case final icon?) ...[
                    Icon(icon, size: 20, color: ink),
                    const SizedBox(height: MakiSpacing.xs),
                  ],
                  Text(
                    label,
                    style: theme.textTheme.titleSmall?.copyWith(color: ink),
                    textAlign: TextAlign.center,
                  ),
                  if (note case final note?)
                    Text(
                      note,
                      style: theme.textTheme.labelSmall?.copyWith(color: ink),
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

/// A line of the order: its menu, category, qty × price, the stepper (an
/// outlined minus, a filled plus, each a 48dp target however small it
/// looks), the note and the button that takes it out. The plus stops at
/// the stock.
class CartLineTile extends StatefulWidget {
  const CartLineTile({
    required this.line,
    required this.menu,
    required this.category,
    required this.locked,
    super.key,
  });

  final CartLine line;
  final CatalogMenu menu;
  final CatalogCategory? category;
  final bool locked;

  @override
  State<CartLineTile> createState() => _CartLineTileState();
}

class _CartLineTileState extends State<CartLineTile> {
  late final _note = TextEditingController(text: widget.line.note);
  late bool _noting = widget.line.note.isNotEmpty;

  @override
  void didUpdateWidget(CartLineTile old) {
    super.didUpdateWidget(old);
    if (widget.line.note != _note.text) _note.text = widget.line.note;
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<SaleCubit>();
    final CartLineTile(:line, :menu, :locked) = widget;
    final most = mostOf(menu);
    final muted = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MakiSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox.square(
                dimension: 48,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(MakiRadii.card),
                  ),
                  child: Center(child: CategoryEmoji(widget.category?.icon)),
                ),
              ),
              const SizedBox(width: MakiSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(menu.name, style: theme.textTheme.titleSmall),
                    if (widget.category case final category?)
                      Text(category.name, style: muted),
                  ],
                ),
              ),
              const SizedBox(width: MakiSpacing.sm),
              Text(
                l10n.cartLine(
                  line.qty,
                  formatRupiah(menu.price, l10n.localeName),
                ),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _StepButton(
                icon: Icons.remove,
                tooltip: l10n.cartLess(menu.name),
                onPressed: locked
                    ? null
                    : () => cubit.setQty(menu, line.qty - 1),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 32),
                child: Text(
                  formatCount(line.qty, l10n.localeName),
                  style: theme.textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              _StepButton(
                icon: Icons.add,
                filled: true,
                tooltip: l10n.cartMore(menu.name),
                onPressed: locked || line.qty >= most
                    ? null
                    : () => cubit.setQty(menu, line.qty + 1),
              ),
              const Spacer(),
              Semantics(
                expanded: _noting,
                child: TextButton(
                  onPressed: locked
                      ? null
                      : () => setState(() => _noting = !_noting),
                  child: Text(l10n.cartNote),
                ),
              ),
              IconButton(
                tooltip: l10n.cartRemove(menu.name),
                icon: const Icon(Icons.delete_outline),
                color: context.tokens.iconMuted,
                onPressed: locked ? null : () => cubit.remove(menu.menuId),
              ),
            ],
          ),
          if (menu.trackStock && line.qty >= most)
            Text(l10n.cartStockLeft(most), style: muted),
          if (_noting) ...[
            const SizedBox(height: MakiSpacing.sm),
            TextField(
              controller: _note,
              enabled: !locked,
              decoration: InputDecoration(
                labelText: l10n.cartNoteFor(menu.name),
                hintText: l10n.cartNoteHint,
              ),
              inputFormatters: const [CodePointLimit(maxNote)],
              onChanged: (note) => cubit.setNote(menu.menuId, note),
            ),
          ],
        ],
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.filled = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final brand = context.tokens.brand;
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      padding: EdgeInsets.zero,
      icon: Opacity(
        opacity: onPressed == null ? 0.4 : 1,
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: filled ? brand : theme.colorScheme.surface,
            border: filled
                ? null
                : Border.all(color: theme.colorScheme.outline),
            borderRadius: BorderRadius.circular(MakiRadii.control),
          ),
          child: Icon(
            icon,
            size: 16,
            color: filled ? theme.colorScheme.onPrimary : brand,
          ),
        ),
      ),
    );
  }
}

/// The figures: items, subtotal, the outlet's charges, a dashed rule, and
/// the total.
class OrderSummary extends StatelessWidget {
  const OrderSummary({
    required this.count,
    required this.totals,
    required this.outlet,
    super.key,
    this.voucherCode,
  });

  final int count;
  final Totals totals;
  final CatalogOutlet outlet;

  /// The voucher the discount is from, named beside it.
  final String? voucherCode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = l10n.localeName;
    String money(int amount) => formatRupiah(amount, locale);
    Widget row(String label, String value, {TextStyle? style}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: MakiSpacing.xs),
      child: LabelValue(
        label,
        value,
        style: style ?? theme.textTheme.bodyMedium,
        labelStyle:
            style ??
            theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row(l10n.summaryItems, formatCount(count, locale)),
        row(l10n.summarySubtotal, money(totals.subtotal)),
        if (totals.discount > 0)
          row(switch (voucherCode) {
            final code? => l10n.summaryVoucher(code),
            null => l10n.summaryDiscount,
          }, '-${money(totals.discount)}'),
        if (outlet.serviceBps > 0)
          row(
            l10n.summaryService(formatRate(outlet.serviceBps, locale)),
            money(totals.service),
          ),
        if (outlet.taxBps > 0)
          row(
            l10n.summaryTax(formatRate(outlet.taxBps, locale)),
            money(totals.tax),
          ),
        const SizedBox(height: MakiSpacing.sm),
        const DashedDivider(),
        const SizedBox(height: MakiSpacing.sm),
        row(
          l10n.summaryTotal,
          money(totals.total),
          style: theme.textTheme.titleMedium,
        ),
      ],
    );
  }
}

/// DESIGN.md's payment tiles. Cash is the one this cashier takes; QRIS and
/// debit arrive with their own milestone, and say so.
class PaymentTiles extends StatelessWidget {
  const PaymentTiles({required this.available, super.key});

  final List<PaymentMethod> available;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: l10n.cartMethod,
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExcludeSemantics(
            child: Text(
              l10n.cartMethod,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: MakiSpacing.sm),
          Row(
            children: [
              for (final (i, method) in PaymentMethod.values.indexed) ...[
                if (i > 0) const SizedBox(width: MakiSpacing.sm),
                Expanded(
                  child: SelectTile(
                    icon: switch (method) {
                      PaymentMethod.cash => Icons.payments_outlined,
                      PaymentMethod.qris => Icons.qr_code_2,
                      PaymentMethod.debit => Icons.credit_card,
                    },
                    label: methodLabel(l10n, method),
                    note: method == PaymentMethod.cash ? null : l10n.cartSoon,
                    selected:
                        method == PaymentMethod.cash &&
                        available.contains(method),
                    // Nothing to choose yet: cash is the only one taken.
                    enabled:
                        method == PaymentMethod.cash &&
                        available.contains(method),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
