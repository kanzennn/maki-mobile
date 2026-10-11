//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ForgotPasswordRequest {
  /// Returns a new [ForgotPasswordRequest] instance.
  ForgotPasswordRequest({

    required  this.login,
  });

      /// Username or email address.
  @JsonKey(
    
    name: r'login',
    required: true,
    includeIfNull: false,
  )


  final String login;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ForgotPasswordRequest &&
      other.login == login;

    @override
    int get hashCode =>
        login.hashCode;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => _$ForgotPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

