// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ForgotPasswordRequestCWProxy {
  ForgotPasswordRequest login(String login);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPasswordRequest call({String login});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfForgotPasswordRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfForgotPasswordRequest.copyWith.fieldName(...)`
class _$ForgotPasswordRequestCWProxyImpl
    implements _$ForgotPasswordRequestCWProxy {
  const _$ForgotPasswordRequestCWProxyImpl(this._value);

  final ForgotPasswordRequest _value;

  @override
  ForgotPasswordRequest login(String login) => this(login: login);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ForgotPasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ForgotPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ForgotPasswordRequest call({Object? login = const $CopyWithPlaceholder()}) {
    return ForgotPasswordRequest(
      login: login == const $CopyWithPlaceholder()
          ? _value.login
          // ignore: cast_nullable_to_non_nullable
          : login as String,
    );
  }
}

extension $ForgotPasswordRequestCopyWith on ForgotPasswordRequest {
  /// Returns a callable class that can be used as follows: `instanceOfForgotPasswordRequest.copyWith(...)` or like so:`instanceOfForgotPasswordRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ForgotPasswordRequestCWProxy get copyWith =>
      _$ForgotPasswordRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ForgotPasswordRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['login']);
  final val = ForgotPasswordRequest(
    login: $checkedConvert('login', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ForgotPasswordRequestToJson(
  ForgotPasswordRequest instance,
) => <String, dynamic>{'login': instance.login};
