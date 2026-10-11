import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/features/pos/domain/catalog.dart';

part 'order.freezed.dart';

enum OrderType { dineIn, takeaway }

enum OrderStatus { paid, voided }

/// An order as the server took it: its receipt, and its void.
@freezed
abstract class Order with _$Order {
  const factory Order({
    required String orderId,

    /// OUTLET-DEVICE-YYYYMMDD-0001.
    required String orderNo,
    required OrderType type,
    required OrderStatus status,
    required String cashierName,
    required List<OrderLine> lines,
    required int subtotal,
    required int discount,

    /// The rates it was charged at, in basis points.
    required int serviceBps,
    required int service,
    required int taxBps,
    required int tax,
    required int total,
    required OrderPayment payment,

    /// When the cashier charged it, by the device's clock (UTC).
    required DateTime clientCreatedAt,
    String? voidReason,

    /// The code of the voucher the sale used, as it was then: the receipt
    /// prints it beside the discount. Null for none.
    String? voucherCode,

    /// The table a dine-in sale was for, and its name as it was then, which
    /// the receipt prints. Null for none.
    String? tableId,
    String? tableName,

    /// The number on the stand a dine-in customer took, where the outlet
    /// seats its customers by number stands: the receipt prints it large,
    /// for the waiter who brings the order. Null for none.
    String? standNumber,
  }) = _Order;
}

@freezed
abstract class OrderLine with _$OrderLine {
  const factory OrderLine({
    required String orderLineId,
    required String menuId,

    /// The menu's name and price as they were at the sale.
    required String name,
    required int price,
    required int qty,
    required int lineTotal,
    String? note,
  }) = _OrderLine;
}

@freezed
abstract class OrderPayment with _$OrderPayment {
  const factory OrderPayment({
    required PaymentMethod method,

    /// What was charged: the order's total.
    required int amount,

    /// Cash: what the customer handed over, and what went back.
    int? received,
    int? change,
  }) = _OrderPayment;
}

/// An order in today's list.
@freezed
abstract class OrderSummary with _$OrderSummary {
  const factory OrderSummary({
    required String orderId,
    required String orderNo,
    required OrderType type,
    required OrderStatus status,
    required int total,
    required int itemCount,
    required PaymentMethod method,
    required String cashierName,
    required DateTime clientCreatedAt,

    /// The table's name as it was at the sale; null for none.
    String? tableName,

    /// The number on the customer's stand; null for none.
    String? standNumber,
  }) = _OrderSummary;
}

/// A page of today's orders, and how many there are in all.
typedef OrderPage = ({List<OrderSummary> orders, int total});

/// An order as the cashier charges it, made once on the device: its ID is
/// its idempotency key, so a resend is this very order again.
@freezed
abstract class NewOrder with _$NewOrder {
  const factory NewOrder({
    required String orderId,
    required String orderNo,
    required OrderType type,

    /// In UTC.
    required DateTime clientCreatedAt,
    required List<NewOrderLine> lines,

    /// The total the cashier showed: the server refuses it if its own
    /// differs.
    required int total,
    required PaymentMethod method,

    /// Cash handed over.
    int? received,

    /// The voucher the customer gave, one per order; null for none.
    String? voucherCode,

    /// The table of a dine-in order, if the cashier picked one; null for
    /// none.
    String? tableId,

    /// The number on the dine-in customer's stand, as the server keeps it,
    /// where the outlet seats its customers by number stands; null for none.
    String? standNumber,
  }) = _NewOrder;
}

@freezed
abstract class NewOrderLine with _$NewOrderLine {
  const factory NewOrderLine({
    required String menuId,
    required int qty,

    /// The price the cashier showed: the server refuses it if the menu's
    /// differs.
    required int price,
    String? note,
  }) = _NewOrderLine;
}
