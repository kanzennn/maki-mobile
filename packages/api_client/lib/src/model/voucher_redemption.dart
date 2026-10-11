//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/voucher_outlet.dart';
import 'package:maki_api_client/src/model/order_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_redemption.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoucherRedemption {
  /// Returns a new [VoucherRedemption] instance.
  VoucherRedemption({

    required  this.orderId,

    required  this.orderNo,

    required  this.outlet,

    required  this.clientCreatedAt,

    required  this.voucherDiscount,

    required  this.status,
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
    
    name: r'outlet',
    required: true,
    includeIfNull: false,
  )


  final VoucherOutlet outlet;



      /// When the cashier charged it.
  @JsonKey(
    
    name: r'client_created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime clientCreatedAt;



  @JsonKey(
    
    name: r'voucher_discount',
    required: true,
    includeIfNull: false,
  )


  final int voucherDiscount;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final OrderStatus status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoucherRedemption &&
      other.orderId == orderId &&
      other.orderNo == orderNo &&
      other.outlet == outlet &&
      other.clientCreatedAt == clientCreatedAt &&
      other.voucherDiscount == voucherDiscount &&
      other.status == status;

    @override
    int get hashCode =>
        orderId.hashCode +
        orderNo.hashCode +
        outlet.hashCode +
        clientCreatedAt.hashCode +
        voucherDiscount.hashCode +
        status.hashCode;

  factory VoucherRedemption.fromJson(Map<String, dynamic> json) => _$VoucherRedemptionFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherRedemptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

