//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/payment_control_method.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_methods.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentMethods {
  /// Returns a new [PaymentMethods] instance.
  PaymentMethods({

    required  this.methods,
  });

  @JsonKey(
    
    name: r'methods',
    required: true,
    includeIfNull: false,
  )


  final List<PaymentControlMethod> methods;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentMethods &&
      other.methods == methods;

    @override
    int get hashCode =>
        methods.hashCode;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => _$PaymentMethodsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

