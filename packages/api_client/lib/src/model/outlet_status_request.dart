//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_status_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OutletStatusRequest {
  /// Returns a new [OutletStatusRequest] instance.
  OutletStatusRequest({

    required  this.status,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final OutletStatusRequestStatusEnum status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OutletStatusRequest &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory OutletStatusRequest.fromJson(Map<String, dynamic> json) => _$OutletStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OutletStatusRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum OutletStatusRequestStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'inactive')
inactive(r'inactive');

const OutletStatusRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


