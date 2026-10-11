// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_role.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffRoleCWProxy {
  StaffRole roleId(String roleId);

  StaffRole name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffRole(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffRole call({String roleId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaffRole.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaffRole.copyWith.fieldName(...)`
class _$StaffRoleCWProxyImpl implements _$StaffRoleCWProxy {
  const _$StaffRoleCWProxyImpl(this._value);

  final StaffRole _value;

  @override
  StaffRole roleId(String roleId) => this(roleId: roleId);

  @override
  StaffRole name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffRole(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffRole call({
    Object? roleId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return StaffRole(
      roleId: roleId == const $CopyWithPlaceholder()
          ? _value.roleId
          // ignore: cast_nullable_to_non_nullable
          : roleId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $StaffRoleCopyWith on StaffRole {
  /// Returns a callable class that can be used as follows: `instanceOfStaffRole.copyWith(...)` or like so:`instanceOfStaffRole.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffRoleCWProxy get copyWith => _$StaffRoleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffRole _$StaffRoleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StaffRole', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['role_id', 'name']);
      final val = StaffRole(
        roleId: $checkedConvert('role_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'roleId': 'role_id'});

Map<String, dynamic> _$StaffRoleToJson(StaffRole instance) => <String, dynamic>{
  'role_id': instance.roleId,
  'name': instance.name,
};
