//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_payment_methods_request_methods_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetPaymentMethodsRequestMethodsInner {
  /// Returns a new [SetPaymentMethodsRequestMethodsInner] instance.
  SetPaymentMethodsRequestMethodsInner({

    required  this.method,

    required  this.isEnabled,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



  @JsonKey(
    
    name: r'is_enabled',
    required: true,
    includeIfNull: false,
  )


  final bool isEnabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetPaymentMethodsRequestMethodsInner &&
      other.method == method &&
      other.isEnabled == isEnabled;

    @override
    int get hashCode =>
        method.hashCode +
        isEnabled.hashCode;

  factory SetPaymentMethodsRequestMethodsInner.fromJson(Map<String, dynamic> json) => _$SetPaymentMethodsRequestMethodsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SetPaymentMethodsRequestMethodsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

