//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_role.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StaffRole {
  /// Returns a new [StaffRole] instance.
  StaffRole({

    required  this.roleId,

    required  this.name,
  });

  @JsonKey(
    
    name: r'role_id',
    required: true,
    includeIfNull: false,
  )


  final String roleId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StaffRole &&
      other.roleId == roleId &&
      other.name == name;

    @override
    int get hashCode =>
        roleId.hashCode +
        name.hashCode;

  factory StaffRole.fromJson(Map<String, dynamic> json) => _$StaffRoleFromJson(json);

  Map<String, dynamic> toJson() => _$StaffRoleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

