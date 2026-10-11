//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginRequest {
  /// Returns a new [LoginRequest] instance.
  LoginRequest({

    required  this.username,

    required  this.password,

    required  this.client,
  });

      /// Compared without regard to case.
  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



      /// Where the refresh token goes — a cookie for `web`, the body for `mobile`.
  @JsonKey(
    
    name: r'client',
    required: true,
    includeIfNull: false,
  )


  final LoginRequestClientEnum client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LoginRequest &&
      other.username == username &&
      other.password == password &&
      other.client == client;

    @override
    int get hashCode =>
        username.hashCode +
        password.hashCode +
        client.hashCode;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Where the refresh token goes — a cookie for `web`, the body for `mobile`.
enum LoginRequestClientEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'mobile')
mobile(r'mobile');

const LoginRequestClientEnum(this.value);

final String value;

@override
String toString() => value;
}


