//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/order_status.dart';
import 'package:maki_api_client/src/model/order_person.dart';
import 'package:maki_api_client/src/model/payment_method.dart';
import 'package:maki_api_client/src/model/order_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderSummary {
  /// Returns a new [OrderSummary] instance.
  OrderSummary({

    required  this.orderId,

    required  this.orderNo,

    required  this.deviceId,

    required  this.type,

    required  this.tableName,

    required  this.standNumber,

    required  this.status,

    required  this.total,

    required  this.itemCount,

    required  this.paymentMethod,

    required  this.cashier,

    required  this.clientCreatedAt,

    required  this.createdAt,
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



      /// The table's name as it was at the sale; null for none.
  @JsonKey(
    
    name: r'table_name',
    required: true,
    includeIfNull: true,
  )


  final String? tableName;



      /// The number on the customer's stand; null for none.
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
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;



      /// Every line's qty, together.
  @JsonKey(
    
    name: r'item_count',
    required: true,
    includeIfNull: false,
  )


  final int itemCount;



  @JsonKey(
    
    name: r'payment_method',
    required: true,
    includeIfNull: false,
  )


  final PaymentMethod paymentMethod;



  @JsonKey(
    
    name: r'cashier',
    required: true,
    includeIfNull: false,
  )


  final OrderPerson cashier;



  @JsonKey(
    
    name: r'client_created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime clientCreatedAt;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrderSummary &&
      other.orderId == orderId &&
      other.orderNo == orderNo &&
      other.deviceId == deviceId &&
      other.type == type &&
      other.tableName == tableName &&
      other.standNumber == standNumber &&
      other.status == status &&
      other.total == total &&
      other.itemCount == itemCount &&
      other.paymentMethod == paymentMethod &&
      other.cashier == cashier &&
      other.clientCreatedAt == clientCreatedAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        orderId.hashCode +
        orderNo.hashCode +
        deviceId.hashCode +
        type.hashCode +
        (tableName == null ? 0 : tableName.hashCode) +
        (standNumber == null ? 0 : standNumber.hashCode) +
        status.hashCode +
        total.hashCode +
        itemCount.hashCode +
        paymentMethod.hashCode +
        cashier.hashCode +
        clientCreatedAt.hashCode +
        createdAt.hashCode;

  factory OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

