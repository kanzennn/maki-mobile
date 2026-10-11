//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'void_order_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoidOrderRequest {
  /// Returns a new [VoidOrderRequest] instance.
  VoidOrderRequest({

    required  this.reason,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoidOrderRequest &&
      other.reason == reason;

    @override
    int get hashCode =>
        reason.hashCode;

  factory VoidOrderRequest.fromJson(Map<String, dynamic> json) => _$VoidOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VoidOrderRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

