//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActiveRequest {
  /// Returns a new [ActiveRequest] instance.
  ActiveRequest({

    required  this.isActive,
  });

  @JsonKey(
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActiveRequest &&
      other.isActive == isActive;

    @override
    int get hashCode =>
        isActive.hashCode;

  factory ActiveRequest.fromJson(Map<String, dynamic> json) => _$ActiveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

