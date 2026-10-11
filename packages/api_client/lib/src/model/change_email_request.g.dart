// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_email_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChangeEmailRequestCWProxy {
  ChangeEmailRequest email(String email);

  ChangeEmailRequest currentPassword(String currentPassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangeEmailRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangeEmailRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangeEmailRequest call({String email, String currentPassword});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChangeEmailRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChangeEmailRequest.copyWith.fieldName(...)`
class _$ChangeEmailRequestCWProxyImpl implements _$ChangeEmailRequestCWProxy {
  const _$ChangeEmailRequestCWProxyImpl(this._value);

  final ChangeEmailRequest _value;

  @override
  ChangeEmailRequest email(String email) => this(email: email);

  @override
  ChangeEmailRequest currentPassword(String currentPassword) =>
      this(currentPassword: currentPassword);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangeEmailRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangeEmailRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangeEmailRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? currentPassword = const $CopyWithPlaceholder(),
  }) {
    return ChangeEmailRequest(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      currentPassword: currentPassword == const $CopyWithPlaceholder()
          ? _value.currentPassword
          // ignore: cast_nullable_to_non_nullable
          : currentPassword as String,
    );
  }
}

extension $ChangeEmailRequestCopyWith on ChangeEmailRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChangeEmailRequest.copyWith(...)` or like so:`instanceOfChangeEmailRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangeEmailRequestCWProxy get copyWith =>
      _$ChangeEmailRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeEmailRequest _$ChangeEmailRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChangeEmailRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['email', 'current_password']);
        final val = ChangeEmailRequest(
          email: $checkedConvert('email', (v) => v as String),
          currentPassword: $checkedConvert(
            'current_password',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {'currentPassword': 'current_password'},
    );

Map<String, dynamic> _$ChangeEmailRequestToJson(ChangeEmailRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'current_password': instance.currentPassword,
    };
