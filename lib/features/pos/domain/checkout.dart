import 'package:maki_mobile/features/pos/domain/cart.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';
import 'package:maki_mobile/features/pos/domain/order.dart';
import 'package:maki_mobile/features/pos/domain/order_id.dart';
import 'package:maki_mobile/features/pos/domain/receipt_number.dart';
import 'package:maki_mobile/features/pos/domain/till_device.dart';
import 'package:maki_mobile/features/pos/domain/totals.dart';
import 'package:maki_mobile/features/pos/domain/voucher.dart';

/// The cart at the catalog's prices: the lines to send, their totals at the
/// outlet's rates with the [voucher]'s discount off, how many items they
/// hold, and whether the voucher applies: short of its minimum spend it
/// doesn't, and the sale can't take it yet. A line whose menu has left the
/// catalog is skipped; following the catalog takes it out anyway.
({List<NewOrderLine> lines, Totals totals, int count, bool voucherApplies})
priced(List<CartLine> cart, Catalog catalog, {Voucher? voucher}) {
  final menus = catalog.menusById;
  final lines = <NewOrderLine>[];
  for (final line in cart) {
    final menu = menus[line.menuId];
    if (menu == null) continue;
    final note = line.note.trim();
    lines.add(
      NewOrderLine(
        menuId: line.menuId,
        qty: line.qty,
        price: menu.price,
        note: note.isEmpty ? null : note,
      ),
    );
  }
  final rows = [for (final line in lines) (price: line.price, qty: line.qty)];
  final subtotal = rows.fold(0, (sum, row) => sum + row.price * row.qty);
  final offer = voucher == null
      ? (discount: 0, applies: true)
      : voucherDiscount(voucher, subtotal);
  return (
    lines: lines,
    totals: computeTotals(
      rows,
      serviceBps: catalog.outlet.serviceBps,
      taxBps: catalog.outlet.taxBps,
      discount: offer.discount,
    ),
    count: lines.fold(0, (sum, line) => sum + line.qty),
    voucherApplies: offer.applies,
  );
}

/// The order for the cart, charged in cash at [at]: a new ID, and the
/// device's next receipt number of the outlet's day then. A dine-in order
/// may be for a table, or carry its stand's number.
NewOrder makeOrder({
  required OrderType type,
  required List<NewOrderLine> lines,
  required int total,
  required int received,
  required TillDevice device,
  required DateTime at,
  required String timeZone,
  String? voucherCode,
  String? tableId,
  String? standNumber,
  String Function() newId = newOrderId,
}) {
  final order = NewOrder(
    orderId: newId(),
    orderNo: '',
    type: type,
    // Milliseconds, as a browser's clock gives them: the server keeps
    // microseconds, so a resend compares equal either way.
    clientCreatedAt: DateTime.fromMillisecondsSinceEpoch(
      at.millisecondsSinceEpoch,
      isUtc: true,
    ),
    lines: lines,
    total: total,
    method: PaymentMethod.cash,
    received: received,
    voucherCode: voucherCode,
    tableId: tableId,
    standNumber: standNumber,
  );
  return renumber(order, device, timeZone);
}

/// The order with the device's next receipt number of the order's own day:
/// the server checks the number's day against when the order was made.
NewOrder renumber(NewOrder order, TillDevice device, String timeZone) {
  final day = outletDay(order.clientCreatedAt, timeZone);
  final count = countFor(day: device.day, next: device.nextNumber, today: day);
  return order.copyWith(
    orderNo: receiptNumber(device.orderNoPrefix, day, count),
  );
}

/// After a sale: the count the device's next receipt number takes, from the
/// number just used, while `GET /pos/device` is asked again.
TillDevice afterSale(TillDevice device, String orderNo) {
  final parts = orderNo.split('-');
  if (parts.length < 2) return device;
  final day = parts[parts.length - 2];
  final count = int.tryParse(parts.last);
  if (count == null || day.length != 8) return device;
  final iso =
      '${day.substring(0, 4)}-${day.substring(4, 6)}-'
      '${day.substring(6)}';
  if (iso != device.day || count < device.nextNumber) return device;
  return device.copyWith(nextNumber: count + 1);
}
