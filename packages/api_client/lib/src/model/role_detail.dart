//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/role_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_detail.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoleDetail {
  /// Returns a new [RoleDetail] instance.
  RoleDetail({

    required  this.roleId,

    required  this.name,

    required  this.description,

    required  this.permissions,

    required  this.userCount,

    required  this.createdAt,

    required  this.updatedAt,

    required  this.users,
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



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



      /// Sorted.
  @JsonKey(
    
    name: r'permissions',
    required: true,
    includeIfNull: false,
  )


  final List<String> permissions;



      /// Users who hold the role.
  @JsonKey(
    
    name: r'user_count',
    required: true,
    includeIfNull: false,
  )


  final int userCount;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'users',
    required: true,
    includeIfNull: false,
  )


  final List<RoleUser> users;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RoleDetail &&
      other.roleId == roleId &&
      other.name == name &&
      other.description == description &&
      other.permissions == permissions &&
      other.userCount == userCount &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.users == users;

    @override
    int get hashCode =>
        roleId.hashCode +
        name.hashCode +
        (description == null ? 0 : description.hashCode) +
        permissions.hashCode +
        userCount.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode +
        users.hashCode;

  factory RoleDetail.fromJson(Map<String, dynamic> json) => _$RoleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RoleDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

