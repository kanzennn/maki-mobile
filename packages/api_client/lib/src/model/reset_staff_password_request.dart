//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_staff_password_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResetStaffPasswordRequest {
  /// Returns a new [ResetStaffPasswordRequest] instance.
  ResetStaffPasswordRequest({

    required  this.password,
  });

      /// The temporary password, 8 to 128 characters.
  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResetStaffPasswordRequest &&
      other.password == password;

    @override
    int get hashCode =>
        password.hashCode;

  factory ResetStaffPasswordRequest.fromJson(Map<String, dynamic> json) => _$ResetStaffPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetStaffPasswordRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

