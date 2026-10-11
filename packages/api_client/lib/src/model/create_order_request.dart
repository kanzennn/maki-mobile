//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/create_order_item.dart';
import 'package:maki_api_client/src/model/order_type.dart';
import 'package:maki_api_client/src/model/create_order_payment.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateOrderRequest {
  /// Returns a new [CreateOrderRequest] instance.
  CreateOrderRequest({

    required  this.orderId,

    required  this.orderNo,

    required  this.type,

     this.tableId,

     this.standNumber,

    required  this.clientCreatedAt,

    required  this.items,

     this.voucherCode,

    required  this.total,

    required  this.payment,
  });

      /// Made by the device, a CUID2; the order's idempotency key.
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
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final OrderType type;



      /// The table a dine-in order seats its customers at; null or blank for none, as it may be.
  @JsonKey(
    
    name: r'table_id',
    required: false,
    includeIfNull: false,
  )


  final String? tableId;



      /// The number on the stand a dine-in customer took, where the outlet seats them by number stands: 1–10 letters, digits and hyphens, a hyphen only between them, kept in capitals. Null or blank for none. 
  @JsonKey(
    
    name: r'stand_number',
    required: false,
    includeIfNull: false,
  )


  final String? standNumber;



      /// When the device made the order.
  @JsonKey(
    
    name: r'client_created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime clientCreatedAt;



  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<CreateOrderItem> items;



      /// The voucher the customer gave, in any case; one per order. Null or blank for none.
  @JsonKey(
    
    name: r'voucher_code',
    required: false,
    includeIfNull: false,
  )


  final String? voucherCode;



      /// What the cashier charged, which must be the server's total.
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


  final CreateOrderPayment payment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateOrderRequest &&
      other.orderId == orderId &&
      other.orderNo == orderNo &&
      other.type == type &&
      other.tableId == tableId &&
      other.standNumber == standNumber &&
      other.clientCreatedAt == clientCreatedAt &&
      other.items == items &&
      other.voucherCode == voucherCode &&
      other.total == total &&
      other.payment == payment;

    @override
    int get hashCode =>
        orderId.hashCode +
        orderNo.hashCode +
        type.hashCode +
        (tableId == null ? 0 : tableId.hashCode) +
        (standNumber == null ? 0 : standNumber.hashCode) +
        clientCreatedAt.hashCode +
        items.hashCode +
        (voucherCode == null ? 0 : voucherCode.hashCode) +
        total.hashCode +
        payment.hashCode;

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

