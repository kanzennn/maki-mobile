import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:maki_mobile/core/printing/esc_pos.dart';
import 'package:maki_mobile/core/utils/money.dart';
import 'package:maki_mobile/core/utils/number.dart';
import 'package:maki_mobile/core/utils/time.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/presentation/pos_text.dart';
import 'package:maki_mobile/l10n/app_localizations.dart';

/// [order]'s receipt for the printer: what the receipt on screen shows, in the
/// same order and the outlet's language, on [paper].
Uint8List receiptTicket({
  required Order order,
  required CatalogOutlet outlet,
  required PaperWidth paper,
}) {
  final t = lookupAppLocalizations(Locale(outlet.locale));
  String money(int amount) => formatRupiah(amount, outlet.locale);
  String rate(int bps) => formatRate(bps, outlet.locale);
  final ticket = EscPosTicket(paper)
    ..text(outlet.name, align: TicketAlign.center, bold: true);
  if (outlet.address case final address?) {
    ticket.text(address, align: TicketAlign.center);
  }
  if (outlet.phone case final phone?) {
    ticket.text(phone, align: TicketAlign.center);
  }
  if (order.status == OrderStatus.voided) {
    ticket
      ..rule()
      ..text(t.receiptVoid, align: TicketAlign.center, big: true);
    if (order.voidReason case final reason?) {
      ticket.text(t.receiptVoidReason(reason), align: TicketAlign.center);
    }
    ticket.rule();
  }
  if (order.standNumber case final stand?) {
    ticket
      ..gap()
      ..text(t.receiptStand, align: TicketAlign.center)
      ..text(stand, align: TicketAlign.center, big: true);
  }
  ticket
    ..gap()
    ..text(t.receiptNumber)
    ..text(order.orderNo, bold: true)
    ..row(
      t.receiptDate,
      formatDateTime(order.clientCreatedAt, outlet.locale, outlet.timeZone),
    )
    ..row(t.receiptCashier, order.cashierName)
    ..row(t.receiptType, orderTypeLabel(t, order.type));
  if (order.tableName case final table?) {
    ticket.row(t.receiptTable, table, bold: true);
  }
  ticket.rule();
  for (final line in order.lines) {
    ticket
      ..text(line.name, bold: true)
      ..row(t.cartLine(line.qty, money(line.price)), money(line.lineTotal));
    if (line.note case final note?) ticket.text(note);
  }
  ticket
    ..rule()
    ..row(t.summarySubtotal, money(order.subtotal));
  if (order.discount > 0) {
    ticket.row(switch (order.voucherCode) {
      final code? => t.summaryVoucher(code),
      null => t.summaryDiscount,
    }, '-${money(order.discount)}');
  }
  if (order.serviceBps > 0) {
    ticket.row(t.receiptService(rate(order.serviceBps)), money(order.service));
  }
  if (order.taxBps > 0) {
    ticket.row(t.receiptTax(rate(order.taxBps)), money(order.tax));
  }
  ticket
    ..rule()
    ..row(t.summaryTotal, money(order.total), bold: true)
    ..row(
      methodLabel(t, order.payment.method),
      money(order.payment.received ?? order.payment.amount),
    );
  if (order.payment.change case final change?) {
    ticket.row(t.receiptChange, money(change));
  }
  return (ticket
        ..gap()
        ..text(t.receiptThanks, align: TicketAlign.center))
      .finish();
}

/// A short ticket that says the printer works and how wide it was told it is.
Uint8List printerTestTicket(AppLocalizations l10n, PaperWidth paper) {
  final ticket = EscPosTicket(paper)
    ..text(l10n.printerTestTicket, align: TicketAlign.center, bold: true)
    ..rule()
    ..row(l10n.printerPaper, switch (paper) {
      PaperWidth.mm58 => '58 mm',
      PaperWidth.mm80 => '80 mm',
    })
    ..rule();
  return ticket.finish();
}
