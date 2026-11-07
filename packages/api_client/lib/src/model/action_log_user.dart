//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_log_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionLogUser {
  /// Returns a new [ActionLogUser] instance.
  ActionLogUser({

    required  this.userId,

    required  this.name,

    required  this.isOwner,

    required  this.isManager,

    required  this.roleName,
  });

  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'is_owner',
    required: true,
    includeIfNull: false,
  )


  final bool isOwner;



  @JsonKey(
    
    name: r'is_manager',
    required: true,
    includeIfNull: false,
  )


  final bool isManager;



  @JsonKey(
    
    name: r'role_name',
    required: true,
    includeIfNull: true,
  )


  final String? roleName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionLogUser &&
      other.userId == userId &&
      other.name == name &&
      other.isOwner == isOwner &&
      other.isManager == isManager &&
      other.roleName == roleName;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode +
        isOwner.hashCode +
        isManager.hashCode +
        (roleName == null ? 0 : roleName.hashCode);

  factory ActionLogUser.fromJson(Map<String, dynamic> json) => _$ActionLogUserFromJson(json);

  Map<String, dynamic> toJson() => _$ActionLogUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

