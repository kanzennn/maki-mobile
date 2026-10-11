//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/staff_role.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Staff {
  /// Returns a new [Staff] instance.
  Staff({

    required  this.userId,

    required  this.name,

    required  this.username,

    required  this.email,

    required  this.phone,

    required  this.isManager,

    required  this.role,

    required  this.status,

    required  this.mustChangePassword,

    required  this.lastLoginAt,

    required  this.createdAt,

    required  this.updatedAt,
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



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: true,
  )


  final String? phone;



  @JsonKey(
    
    name: r'is_manager',
    required: true,
    includeIfNull: false,
  )


  final bool isManager;



      /// A staff member's role; `null` for a Manager.
  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: true,
  )


  final StaffRole? role;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final StaffStatusEnum status;



      /// The user hasn't replaced the password someone else gave them yet.
  @JsonKey(
    
    name: r'must_change_password',
    required: true,
    includeIfNull: false,
  )


  final bool mustChangePassword;



  @JsonKey(
    
    name: r'last_login_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastLoginAt;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is Staff &&
      other.userId == userId &&
      other.name == name &&
      other.username == username &&
      other.email == email &&
      other.phone == phone &&
      other.isManager == isManager &&
      other.role == role &&
      other.status == status &&
      other.mustChangePassword == mustChangePassword &&
      other.lastLoginAt == lastLoginAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode +
        username.hashCode +
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        isManager.hashCode +
        (role == null ? 0 : role.hashCode) +
        status.hashCode +
        mustChangePassword.hashCode +
        (lastLoginAt == null ? 0 : lastLoginAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum StaffStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'inactive')
inactive(r'inactive');

const StaffStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


