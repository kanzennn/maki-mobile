// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_staff_password_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResetStaffPasswordRequestCWProxy {
  ResetStaffPasswordRequest password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResetStaffPasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResetStaffPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ResetStaffPasswordRequest call({String password});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfResetStaffPasswordRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfResetStaffPasswordRequest.copyWith.fieldName(...)`
class _$ResetStaffPasswordRequestCWProxyImpl
    implements _$ResetStaffPasswordRequestCWProxy {
  const _$ResetStaffPasswordRequestCWProxyImpl(this._value);

  final ResetStaffPasswordRequest _value;

  @override
  ResetStaffPasswordRequest password(String password) =>
      this(password: password);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResetStaffPasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResetStaffPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ResetStaffPasswordRequest call({
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return ResetStaffPasswordRequest(
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $ResetStaffPasswordRequestCopyWith on ResetStaffPasswordRequest {
  /// Returns a callable class that can be used as follows: `instanceOfResetStaffPasswordRequest.copyWith(...)` or like so:`instanceOfResetStaffPasswordRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResetStaffPasswordRequestCWProxy get copyWith =>
      _$ResetStaffPasswordRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetStaffPasswordRequest _$ResetStaffPasswordRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResetStaffPasswordRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['password']);
  final val = ResetStaffPasswordRequest(
    password: $checkedConvert('password', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ResetStaffPasswordRequestToJson(
  ResetStaffPasswordRequest instance,
) => <String, dynamic>{'password': instance.password};
