// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleCWProxy {
  Role roleId(String roleId);

  Role name(String name);

  Role description(String? description);

  Role permissions(List<String> permissions);

  Role userCount(int userCount);

  Role createdAt(DateTime createdAt);

  Role updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Role(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Role(...).copyWith(id: 12, name: "My name")
  /// ````
  Role call({
    String roleId,
    String name,
    String? description,
    List<String> permissions,
    int userCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRole.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRole.copyWith.fieldName(...)`
class _$RoleCWProxyImpl implements _$RoleCWProxy {
  const _$RoleCWProxyImpl(this._value);

  final Role _value;

  @override
  Role roleId(String roleId) => this(roleId: roleId);

  @override
  Role name(String name) => this(name: name);

  @override
  Role description(String? description) => this(description: description);

  @override
  Role permissions(List<String> permissions) => this(permissions: permissions);

  @override
  Role userCount(int userCount) => this(userCount: userCount);

  @override
  Role createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Role updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Role(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Role(...).copyWith(id: 12, name: "My name")
  /// ````
  Role call({
    Object? roleId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
    Object? userCount = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Role(
      roleId: roleId == const $CopyWithPlaceholder()
          ? _value.roleId
          // ignore: cast_nullable_to_non_nullable
          : roleId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as List<String>,
      userCount: userCount == const $CopyWithPlaceholder()
          ? _value.userCount
          // ignore: cast_nullable_to_non_nullable
          : userCount as int,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $RoleCopyWith on Role {
  /// Returns a callable class that can be used as follows: `instanceOfRole.copyWith(...)` or like so:`instanceOfRole.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleCWProxy get copyWith => _$RoleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Role',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'role_id',
        'name',
        'description',
        'permissions',
        'user_count',
        'created_at',
        'updated_at',
      ],
    );
    final val = Role(
      roleId: $checkedConvert('role_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      permissions: $checkedConvert(
        'permissions',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      userCount: $checkedConvert('user_count', (v) => (v as num).toInt()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'roleId': 'role_id',
    'userCount': 'user_count',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'role_id': instance.roleId,
  'name': instance.name,
  'description': instance.description,
  'permissions': instance.permissions,
  'user_count': instance.userCount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
