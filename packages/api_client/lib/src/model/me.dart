//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/outlet_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'me.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Me {
  /// Returns a new [Me] instance.
  Me({

    required  this.userId,

    required  this.username,

    required  this.name,

    required  this.email,

    required  this.emailVerified,

    required  this.pendingEmail,

    required  this.locale,

    required  this.language,

    required  this.isOwner,

    required  this.isManager,

    required  this.outletId,

    required  this.mustChangePassword,

    required  this.permissions,

    required  this.outlet,
  });

  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: true,
  )


  final String? email;



  @JsonKey(
    
    name: r'email_verified',
    required: true,
    includeIfNull: false,
  )


  final bool emailVerified;



      /// An address waiting to be confirmed, after `PUT /me/email`.
  @JsonKey(
    
    name: r'pending_email',
    required: true,
    includeIfNull: true,
  )


  final String? pendingEmail;



      /// The user's own language choice; `null` follows the outlet.
  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: true,
  )


  final String? locale;



      /// The language the user sees, after the fallbacks (own choice, outlet, `id`).
  @JsonKey(
    
    name: r'language',
    required: true,
    includeIfNull: false,
  )


  final String language;



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



      /// `null` for the Owner.
  @JsonKey(
    
    name: r'outlet_id',
    required: true,
    includeIfNull: true,
  )


  final String? outletId;



  @JsonKey(
    
    name: r'must_change_password',
    required: true,
    includeIfNull: false,
  )


  final bool mustChangePassword;



      /// What the user may do, sorted: in their outlet, or for the Owner in any outlet. Clients show what these allow; the server checks them on every request regardless.
  @JsonKey(
    
    name: r'permissions',
    required: true,
    includeIfNull: false,
  )


  final List<String> permissions;



      /// The user's outlet; `null` for the Owner.
  @JsonKey(
    
    name: r'outlet',
    required: true,
    includeIfNull: true,
  )


  final OutletSummary? outlet;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Me &&
      other.userId == userId &&
      other.username == username &&
      other.name == name &&
      other.email == email &&
      other.emailVerified == emailVerified &&
      other.pendingEmail == pendingEmail &&
      other.locale == locale &&
      other.language == language &&
      other.isOwner == isOwner &&
      other.isManager == isManager &&
      other.outletId == outletId &&
      other.mustChangePassword == mustChangePassword &&
      other.permissions == permissions &&
      other.outlet == outlet;

    @override
    int get hashCode =>
        userId.hashCode +
        username.hashCode +
        name.hashCode +
        (email == null ? 0 : email.hashCode) +
        emailVerified.hashCode +
        (pendingEmail == null ? 0 : pendingEmail.hashCode) +
        (locale == null ? 0 : locale.hashCode) +
        language.hashCode +
        isOwner.hashCode +
        isManager.hashCode +
        (outletId == null ? 0 : outletId.hashCode) +
        mustChangePassword.hashCode +
        permissions.hashCode +
        (outlet == null ? 0 : outlet.hashCode);

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  Map<String, dynamic> toJson() => _$MeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

