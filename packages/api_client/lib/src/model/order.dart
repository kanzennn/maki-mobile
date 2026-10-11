//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/order_payment.dart';
import 'package:maki_api_client/src/model/order_status.dart';
import 'package:maki_api_client/src/model/order_person.dart';
import 'package:maki_api_client/src/model/order_type.dart';
import 'package:maki_api_client/src/model/order_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Order {
  /// Returns a new [Order] instance.
  Order({

    required  this.orderId,

    required  this.orderNo,

    required  this.deviceId,

    required  this.type,

    required  this.tableId,

    required  this.tableName,

    required  this.standNumber,

    required  this.status,

    required  this.cashier,

    required  this.items,

    required  this.subtotal,

    required  this.voucherCode,

    required  this.voucherDiscount,

    required  this.serviceBps,

    required  this.service,

    required  this.taxBps,

    required  this.tax,

    required  this.total,

    required  this.payment,

    required  this.clientCreatedAt,

    required  this.createdAt,

    required  this.voidedAt,

    required  this.voidedBy,

    required  this.voidReason,
  });

  @JsonKey(
    
    name: r'order_id',
    required: true,
    includeIfNull: false,
  )


  final String orderId;



  @JsonKey(
    
    name: r'order_no',
    required: true,
    includeIfNull: false,
  )


  final String orderNo;



  @JsonKey(
    
    name: r'device_id',
    required: true,
    includeIfNull: false,
  )


  final String deviceId;



  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final OrderType type;



      /// The table a dine-in sale seated its customers at; null for none.
  @JsonKey(
    
    name: r'table_id',
    required: true,
    includeIfNull: true,
  )


  final String? tableId;



      /// The table's name as it was then, for the receipt; null for none.
  @JsonKey(
    
    name: r'table_name',
    required: true,
    includeIfNull: true,
  )


  final String? tableName;



      /// The number on the stand a dine-in customer took, where a waiter brings the order; null for none.
  @JsonKey(
    
    name: r'stand_number',
    required: true,
    includeIfNull: true,
  )


  final String? standNumber;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final OrderStatus status;



  @JsonKey(
    
    name: r'cashier',
    required: true,
    includeIfNull: false,
  )


  final OrderPerson cashier;



  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<OrderItem> items;



  @JsonKey(
    
    name: r'subtotal',
    required: true,
    includeIfNull: false,
  )


  final int subtotal;



      /// The code of the voucher the sale used, as it was then, for the receipt; null for none.
  @JsonKey(
    
    name: r'voucher_code',
    required: true,
    includeIfNull: true,
  )


  final String? voucherCode;



  @JsonKey(
    
    name: r'voucher_discount',
    required: true,
    includeIfNull: false,
  )


  final int voucherDiscount;



      /// The rate the order was charged at.
  @JsonKey(
    
    name: r'service_bps',
    required: true,
    includeIfNull: false,
  )


  final int serviceBps;



  @JsonKey(
    
    name: r'service',
    required: true,
    includeIfNull: false,
  )


  final int service;



  @JsonKey(
    
    name: r'tax_bps',
    required: true,
    includeIfNull: false,
  )


  final int taxBps;



  @JsonKey(
    
    name: r'tax',
    required: true,
    includeIfNull: false,
  )


  final int tax;



  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;



  @JsonKey(
    
    name: r'payment',
    required: true,
    includeIfNull: false,
  )


  final OrderPayment payment;



      /// When the device made it.
  @JsonKey(
    
    name: r'client_created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime clientCreatedAt;



      /// When the server took it.
  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'voided_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? voidedAt;



  @JsonKey(
    
    name: r'voided_by',
    required: true,
    includeIfNull: true,
  )


  final OrderPerson? voidedBy;



  @JsonKey(
    
    name: r'void_reason',
    required: true,
    includeIfNull: true,
  )


  final String? voidReason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Order &&
      other.orderId == orderId &&
      other.orderNo == orderNo &&
      other.deviceId == deviceId &&
      other.type == type &&
      other.tableId == tableId &&
      other.tableName == tableName &&
      other.standNumber == standNumber &&
      other.status == status &&
      other.cashier == cashier &&
      other.items == items &&
      other.subtotal == subtotal &&
      other.voucherCode == voucherCode &&
      other.voucherDiscount == voucherDiscount &&
      other.serviceBps == serviceBps &&
      other.service == service &&
      other.taxBps == taxBps &&
      other.tax == tax &&
      other.total == total &&
      other.payment == payment &&
      other.clientCreatedAt == clientCreatedAt &&
      other.createdAt == createdAt &&
      other.voidedAt == voidedAt &&
      other.voidedBy == voidedBy &&
      other.voidReason == voidReason;

    @override
    int get hashCode =>
        orderId.hashCode +
        orderNo.hashCode +
        deviceId.hashCode +
        type.hashCode +
        (tableId == null ? 0 : tableId.hashCode) +
        (tableName == null ? 0 : tableName.hashCode) +
        (standNumber == null ? 0 : standNumber.hashCode) +
        status.hashCode +
        cashier.hashCode +
        items.hashCode +
        subtotal.hashCode +
        (voucherCode == null ? 0 : voucherCode.hashCode) +
        voucherDiscount.hashCode +
        serviceBps.hashCode +
        service.hashCode +
        taxBps.hashCode +
        tax.hashCode +
        total.hashCode +
        payment.hashCode +
        clientCreatedAt.hashCode +
        createdAt.hashCode +
        (voidedAt == null ? 0 : voidedAt.hashCode) +
        (voidedBy == null ? 0 : voidedBy.hashCode) +
        (voidReason == null ? 0 : voidReason.hashCode);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

