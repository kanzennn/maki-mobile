//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoleUser {
  /// Returns a new [RoleUser] instance.
  RoleUser({

    required  this.userId,

    required  this.name,

    required  this.username,
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
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RoleUser &&
      other.userId == userId &&
      other.name == name &&
      other.username == username;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode +
        username.hashCode;

  factory RoleUser.fromJson(Map<String, dynamic> json) => _$RoleUserFromJson(json);

  Map<String, dynamic> toJson() => _$RoleUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

