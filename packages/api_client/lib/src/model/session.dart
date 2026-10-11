//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/me.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Session {
  /// Returns a new [Session] instance.
  Session({

    required  this.accessToken,

    required  this.tokenType,

    required  this.expiresIn,

     this.refreshToken,

     this.refreshExpiresIn,

    required  this.user,
  });

  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false,
  )


  final String accessToken;



  @JsonKey(
    
    name: r'token_type',
    required: true,
    includeIfNull: false,
  )


  final SessionTokenTypeEnum tokenType;



      /// Seconds until the access token expires (900). Relative, so a wrong device clock doesn't matter.
  @JsonKey(
    
    name: r'expires_in',
    required: true,
    includeIfNull: false,
  )


  final int expiresIn;



      /// Only for `client: mobile`. Store it in secure storage; it replaces the previous one.
  @JsonKey(
    
    name: r'refresh_token',
    required: false,
    includeIfNull: false,
  )


  final String? refreshToken;



      /// Only with `refresh_token`. Seconds until it expires if unused.
  @JsonKey(
    
    name: r'refresh_expires_in',
    required: false,
    includeIfNull: false,
  )


  final int? refreshExpiresIn;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final Me user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Session &&
      other.accessToken == accessToken &&
      other.tokenType == tokenType &&
      other.expiresIn == expiresIn &&
      other.refreshToken == refreshToken &&
      other.refreshExpiresIn == refreshExpiresIn &&
      other.user == user;

    @override
    int get hashCode =>
        accessToken.hashCode +
        tokenType.hashCode +
        expiresIn.hashCode +
        refreshToken.hashCode +
        refreshExpiresIn.hashCode +
        user.hashCode;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum SessionTokenTypeEnum {
@JsonValue(r'Bearer')
bearer(r'Bearer');

const SessionTokenTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


