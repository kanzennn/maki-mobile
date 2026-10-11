//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area_order_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AreaOrderRequest {
  /// Returns a new [AreaOrderRequest] instance.
  AreaOrderRequest({

    required  this.areaIds,
  });

      /// Every area of the outlet, each once, in the new order.
  @JsonKey(
    
    name: r'area_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> areaIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AreaOrderRequest &&
      other.areaIds == areaIds;

    @override
    int get hashCode =>
        areaIds.hashCode;

  factory AreaOrderRequest.fromJson(Map<String, dynamic> json) => _$AreaOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AreaOrderRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

