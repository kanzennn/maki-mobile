//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_voucher_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ValidateVoucherRequest {
  /// Returns a new [ValidateVoucherRequest] instance.
  ValidateVoucherRequest({

    required  this.code,

    required  this.subtotal,
  });

      /// As the customer gave it, in any case.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



      /// The cart's lines together, before any discount.
  @JsonKey(
    
    name: r'subtotal',
    required: true,
    includeIfNull: false,
  )


  final int subtotal;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ValidateVoucherRequest &&
      other.code == code &&
      other.subtotal == subtotal;

    @override
    int get hashCode =>
        code.hashCode +
        subtotal.hashCode;

  factory ValidateVoucherRequest.fromJson(Map<String, dynamic> json) => _$ValidateVoucherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateVoucherRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

