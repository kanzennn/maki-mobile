// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_staff_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateStaffRequestCWProxy {
  CreateStaffRequest name(String name);

  CreateStaffRequest username(String username);

  CreateStaffRequest email(String? email);

  CreateStaffRequest phone(String? phone);

  CreateStaffRequest password(String password);

  CreateStaffRequest roleId(String? roleId);

  CreateStaffRequest isManager(bool? isManager);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateStaffRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateStaffRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateStaffRequest call({
    String name,
    String username,
    String? email,
    String? phone,
    String password,
    String? roleId,
    bool? isManager,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateStaffRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateStaffRequest.copyWith.fieldName(...)`
class _$CreateStaffRequestCWProxyImpl implements _$CreateStaffRequestCWProxy {
  const _$CreateStaffRequestCWProxyImpl(this._value);

  final CreateStaffRequest _value;

  @override
  CreateStaffRequest name(String name) => this(name: name);

  @override
  CreateStaffRequest username(String username) => this(username: username);

  @override
  CreateStaffRequest email(String? email) => this(email: email);

  @override
  CreateStaffRequest phone(String? phone) => this(phone: phone);

  @override
  CreateStaffRequest password(String password) => this(password: password);

  @override
  CreateStaffRequest roleId(String? roleId) => this(roleId: roleId);

  @override
  CreateStaffRequest isManager(bool? isManager) => this(isManager: isManager);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateStaffRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateStaffRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateStaffRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? roleId = const $CopyWithPlaceholder(),
    Object? isManager = const $CopyWithPlaceholder(),
  }) {
    return CreateStaffRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      roleId: roleId == const $CopyWithPlaceholder()
          ? _value.roleId
          // ignore: cast_nullable_to_non_nullable
          : roleId as String?,
      isManager: isManager == const $CopyWithPlaceholder()
          ? _value.isManager
          // ignore: cast_nullable_to_non_nullable
          : isManager as bool?,
    );
  }
}

extension $CreateStaffRequestCopyWith on CreateStaffRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreateStaffRequest.copyWith(...)` or like so:`instanceOfCreateStaffRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateStaffRequestCWProxy get copyWith =>
      _$CreateStaffRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStaffRequest _$CreateStaffRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateStaffRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['name', 'username', 'password']);
        final val = CreateStaffRequest(
          name: $checkedConvert('name', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String),
          roleId: $checkedConvert('role_id', (v) => v as String?),
          isManager: $checkedConvert('is_manager', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {'roleId': 'role_id', 'isManager': 'is_manager'},
    );

Map<String, dynamic> _$CreateStaffRequestToJson(CreateStaffRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'password': instance.password,
      'role_id': ?instance.roleId,
      'is_manager': ?instance.isManager,
    };
