//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/order_status.dart';
import 'package:maki_api_client/src/model/payment_method.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_payment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderPayment {
  /// Returns a new [OrderPayment] instance.
  OrderPayment({

    required  this.method,

    required  this.amount,

    required  this.received,

    required  this.change,

    required  this.status,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final PaymentMethod method;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final int amount;



  @JsonKey(
    
    name: r'received',
    required: true,
    includeIfNull: true,
  )


  final int? received;



  @JsonKey(
    
    name: r'change',
    required: true,
    includeIfNull: true,
  )


  final int? change;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final OrderStatus status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrderPayment &&
      other.method == method &&
      other.amount == amount &&
      other.received == received &&
      other.change == change &&
      other.status == status;

    @override
    int get hashCode =>
        method.hashCode +
        amount.hashCode +
        (received == null ? 0 : received.hashCode) +
        (change == null ? 0 : change.hashCode) +
        status.hashCode;

  factory OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

