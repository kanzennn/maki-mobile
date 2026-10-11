//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_staff_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateStaffRequest {
  /// Returns a new [UpdateStaffRequest] instance.
  UpdateStaffRequest({

    required  this.name,

     this.email,

     this.phone,

     this.roleId,

     this.isManager = false,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



      /// Required unless `is_manager`.
  @JsonKey(
    
    name: r'role_id',
    required: false,
    includeIfNull: false,
  )


  final String? roleId;



  @JsonKey(
    defaultValue: false,
    name: r'is_manager',
    required: false,
    includeIfNull: false,
  )


  final bool? isManager;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateStaffRequest &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.roleId == roleId &&
      other.isManager == isManager;

    @override
    int get hashCode =>
        name.hashCode +
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        (roleId == null ? 0 : roleId.hashCode) +
        isManager.hashCode;

  factory UpdateStaffRequest.fromJson(Map<String, dynamic> json) => _$UpdateStaffRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateStaffRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

