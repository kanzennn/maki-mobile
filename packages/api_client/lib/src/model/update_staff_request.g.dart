// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_staff_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateStaffRequestCWProxy {
  UpdateStaffRequest name(String name);

  UpdateStaffRequest email(String? email);

  UpdateStaffRequest phone(String? phone);

  UpdateStaffRequest roleId(String? roleId);

  UpdateStaffRequest isManager(bool? isManager);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateStaffRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateStaffRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateStaffRequest call({
    String name,
    String? email,
    String? phone,
    String? roleId,
    bool? isManager,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateStaffRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateStaffRequest.copyWith.fieldName(...)`
class _$UpdateStaffRequestCWProxyImpl implements _$UpdateStaffRequestCWProxy {
  const _$UpdateStaffRequestCWProxyImpl(this._value);

  final UpdateStaffRequest _value;

  @override
  UpdateStaffRequest name(String name) => this(name: name);

  @override
  UpdateStaffRequest email(String? email) => this(email: email);

  @override
  UpdateStaffRequest phone(String? phone) => this(phone: phone);

  @override
  UpdateStaffRequest roleId(String? roleId) => this(roleId: roleId);

  @override
  UpdateStaffRequest isManager(bool? isManager) => this(isManager: isManager);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateStaffRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateStaffRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateStaffRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? roleId = const $CopyWithPlaceholder(),
    Object? isManager = const $CopyWithPlaceholder(),
  }) {
    return UpdateStaffRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
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

extension $UpdateStaffRequestCopyWith on UpdateStaffRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateStaffRequest.copyWith(...)` or like so:`instanceOfUpdateStaffRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateStaffRequestCWProxy get copyWith =>
      _$UpdateStaffRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStaffRequest _$UpdateStaffRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateStaffRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['name']);
        final val = UpdateStaffRequest(
          name: $checkedConvert('name', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          roleId: $checkedConvert('role_id', (v) => v as String?),
          isManager: $checkedConvert('is_manager', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {'roleId': 'role_id', 'isManager': 'is_manager'},
    );

Map<String, dynamic> _$UpdateStaffRequestToJson(UpdateStaffRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'role_id': ?instance.roleId,
      'is_manager': ?instance.isManager,
    };
