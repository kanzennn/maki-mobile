//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_staff_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateStaffRequest {
  /// Returns a new [CreateStaffRequest] instance.
  CreateStaffRequest({

    required  this.name,

    required  this.username,

     this.email,

     this.phone,

    required  this.password,

     this.roleId,

     this.isManager = false,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// 3 to 32 lowercase letters, digits, dots, dashes or underscores; stored in lower case.
  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



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



      /// Temporary, 8 to 128 characters.
  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



      /// A role of the outlet; required unless `is_manager`.
  @JsonKey(
    
    name: r'role_id',
    required: false,
    includeIfNull: false,
  )


  final String? roleId;



      /// A Manager account, which only the Owner creates.
  @JsonKey(
    defaultValue: false,
    name: r'is_manager',
    required: false,
    includeIfNull: false,
  )


  final bool? isManager;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateStaffRequest &&
      other.name == name &&
      other.username == username &&
      other.email == email &&
      other.phone == phone &&
      other.password == password &&
      other.roleId == roleId &&
      other.isManager == isManager;

    @override
    int get hashCode =>
        name.hashCode +
        username.hashCode +
        (email == null ? 0 : email.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        password.hashCode +
        (roleId == null ? 0 : roleId.hashCode) +
        isManager.hashCode;

  factory CreateStaffRequest.fromJson(Map<String, dynamic> json) => _$CreateStaffRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStaffRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

