//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_outlet_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeleteOutletRequest {
  /// Returns a new [DeleteOutletRequest] instance.
  DeleteOutletRequest({

    required  this.confirmName,
  });

      /// The outlet's name, typed again.
  @JsonKey(
    
    name: r'confirm_name',
    required: true,
    includeIfNull: false,
  )


  final String confirmName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeleteOutletRequest &&
      other.confirmName == confirmName;

    @override
    int get hashCode =>
        confirmName.hashCode;

  factory DeleteOutletRequest.fromJson(Map<String, dynamic> json) => _$DeleteOutletRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteOutletRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

