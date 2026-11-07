//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/set_payment_methods_request_methods_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_payment_methods_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetPaymentMethodsRequest {
  /// Returns a new [SetPaymentMethodsRequest] instance.
  SetPaymentMethodsRequest({

    required  this.methods,
  });

  @JsonKey(
    
    name: r'methods',
    required: true,
    includeIfNull: false,
  )


  final List<SetPaymentMethodsRequestMethodsInner> methods;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetPaymentMethodsRequest &&
      other.methods == methods;

    @override
    int get hashCode =>
        methods.hashCode;

  factory SetPaymentMethodsRequest.fromJson(Map<String, dynamic> json) => _$SetPaymentMethodsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetPaymentMethodsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

