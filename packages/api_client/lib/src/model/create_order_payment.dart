//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/payment_method.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_payment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateOrderPayment {
  /// Returns a new [CreateOrderPayment] instance.
  CreateOrderPayment({

    required  this.method,

     this.received,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final PaymentMethod method;



      /// Cash, what the customer handed over, at least the total; the other methods have none.
  @JsonKey(
    
    name: r'received',
    required: false,
    includeIfNull: false,
  )


  final int? received;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateOrderPayment &&
      other.method == method &&
      other.received == received;

    @override
    int get hashCode =>
        method.hashCode +
        (received == null ? 0 : received.hashCode);

  factory CreateOrderPayment.fromJson(Map<String, dynamic> json) => _$CreateOrderPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderPaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

