//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_email_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChangeEmailRequest {
  /// Returns a new [ChangeEmailRequest] instance.
  ChangeEmailRequest({

    required  this.email,

    required  this.currentPassword,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'current_password',
    required: true,
    includeIfNull: false,
  )


  final String currentPassword;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ChangeEmailRequest &&
      other.email == email &&
      other.currentPassword == currentPassword;

    @override
    int get hashCode =>
        email.hashCode +
        currentPassword.hashCode;

  factory ChangeEmailRequest.fromJson(Map<String, dynamic> json) => _$ChangeEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeEmailRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

