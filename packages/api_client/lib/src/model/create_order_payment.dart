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

     this.reference,
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



      /// Debit, and only debit: the retrieval reference or approval code on the EDC machine's slip, 4 to 32 letters, digits and hyphens, in any case. Never a card's number, which is refused (`payment.reference`: `card_number`). The field's other rules are `required`, `format` and, on another method, `not_allowed`. 
  @JsonKey(
    
    name: r'reference',
    required: false,
    includeIfNull: false,
  )


  final String? reference;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateOrderPayment &&
      other.method == method &&
      other.received == received &&
      other.reference == reference;

    @override
    int get hashCode =>
        method.hashCode +
        (received == null ? 0 : received.hashCode) +
        (reference == null ? 0 : reference.hashCode);

  factory CreateOrderPayment.fromJson(Map<String, dynamic> json) => _$CreateOrderPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderPaymentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

