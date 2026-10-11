//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_status_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StaffStatusRequest {
  /// Returns a new [StaffStatusRequest] instance.
  StaffStatusRequest({

    required  this.status,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final StaffStatusRequestStatusEnum status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StaffStatusRequest &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory StaffStatusRequest.fromJson(Map<String, dynamic> json) => _$StaffStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StaffStatusRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum StaffStatusRequestStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'inactive')
inactive(r'inactive');

const StaffStatusRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


