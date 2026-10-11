import 'package:maki_mobile/core/api/api_error_message.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/floor.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/cubit/sale_cubit.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// The cashier's words for its models, in [AppLocalizations].

String orderTypeLabel(AppLocalizations l10n, OrderType type) => switch (type) {
  OrderType.dineIn => l10n.orderTypeDineIn,
  OrderType.takeaway => l10n.orderTypeTakeaway,
};

String methodLabel(AppLocalizations l10n, PaymentMethod method) =>
    switch (method) {
      PaymentMethod.cash => l10n.methodCash,
      PaymentMethod.qris => l10n.methodQris,
      PaymentMethod.debit => l10n.methodDebit,
    };

String tableStatusLabel(AppLocalizations l10n, TableStatus status) =>
    switch (status) {
      TableStatus.available => l10n.tableStatusAvailable,
      TableStatus.occupied => l10n.tableStatusOccupied,
      TableStatus.inactive => l10n.tableStatusInactive,
      TableStatus.scheduled => l10n.tableStatusScheduled,
    };

String decorationLabel(AppLocalizations l10n, DecorationKind kind) =>
    switch (kind) {
      DecorationKind.wall => l10n.decorationWall,
      DecorationKind.cashier => l10n.decorationCashier,
      DecorationKind.door => l10n.decorationDoor,
    };

/// A table in words, for whoever can't see the layout: "Meja A1, Terisi,
/// 4 kursi".
String tableLabel(AppLocalizations l10n, FloorTable table) {
  final status = tableStatusLabel(l10n, table.status);
  return switch (table.capacity) {
    final int seats => l10n.tableLabelSeats(
      table.name,
      status,
      l10n.tableSeats(seats),
    ),
    null => l10n.tableLabel(table.name, status),
  };
}

/// Names as the language lists them: "Kopi, Teh dan Roti".
String listNames(AppLocalizations l10n, List<String> names) {
  if (names.length < 2) return names.join();
  return l10n.listAnd(
    names.sublist(0, names.length - 1).join(', '),
    names.last,
  );
}

/// The sentence a notice says.
String noticeText(AppLocalizations l10n, SaleNotice notice) => switch (notice) {
  UnavailableNotice(:final names) => l10n.changedUnavailable(
    listNames(l10n, names),
  ),
  StockCutNotice(:final names) => l10n.changedStock(listNames(l10n, names)),
  PricesChangedNotice(:final names) => l10n.changedPrices(
    listNames(l10n, names),
  ),
  TotalChangedNotice() => l10n.changedTotal,
  MethodUnavailableNotice() => l10n.changedMethod,
  CheckNotice() => l10n.changedCheck,
  ClockNotice() => l10n.changedClock,
  AbandonedNotice() => l10n.payAbandonWarning,
  VoucherRemovedNotice(:final code, :final error) => l10n.voucherRemoved(
    code,
    apiErrorMessage(l10n, error),
  ),
  TableRemovedNotice(:final name, :final error) => l10n.tableRemoved(
    name,
    switch (error.details['status']) {
      'inactive' => l10n.tableUnavailableInactive,
      'scheduled' => l10n.tableUnavailableScheduled,
      'missing' => l10n.tableUnavailableMissing,
      _ => apiErrorMessage(l10n, error),
    },
  ),
  TableDroppedNotice(:final name) => l10n.standTableDropped(name),
  StandDroppedNotice(:final number) => l10n.standDropped(number),
  NowNumberNotice() => l10n.standNowNumber,
  ErrorNotice(:final error) => apiErrorMessage(l10n, error),
};
