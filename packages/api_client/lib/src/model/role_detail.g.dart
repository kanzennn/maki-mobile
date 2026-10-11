// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_detail.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleDetailCWProxy {
  RoleDetail roleId(String roleId);

  RoleDetail name(String name);

  RoleDetail description(String? description);

  RoleDetail permissions(List<String> permissions);

  RoleDetail userCount(int userCount);

  RoleDetail createdAt(DateTime createdAt);

  RoleDetail updatedAt(DateTime updatedAt);

  RoleDetail users(List<RoleUser> users);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleDetail call({
    String roleId,
    String name,
    String? description,
    List<String> permissions,
    int userCount,
    DateTime createdAt,
    DateTime updatedAt,
    List<RoleUser> users,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoleDetail.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoleDetail.copyWith.fieldName(...)`
class _$RoleDetailCWProxyImpl implements _$RoleDetailCWProxy {
  const _$RoleDetailCWProxyImpl(this._value);

  final RoleDetail _value;

  @override
  RoleDetail roleId(String roleId) => this(roleId: roleId);

  @override
  RoleDetail name(String name) => this(name: name);

  @override
  RoleDetail description(String? description) => this(description: description);

  @override
  RoleDetail permissions(List<String> permissions) =>
      this(permissions: permissions);

  @override
  RoleDetail userCount(int userCount) => this(userCount: userCount);

  @override
  RoleDetail createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  RoleDetail updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  RoleDetail users(List<RoleUser> users) => this(users: users);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleDetail call({
    Object? roleId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
    Object? userCount = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
  }) {
    return RoleDetail(
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
      users: users == const $CopyWithPlaceholder()
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<RoleUser>,
    );
  }
}

extension $RoleDetailCopyWith on RoleDetail {
  /// Returns a callable class that can be used as follows: `instanceOfRoleDetail.copyWith(...)` or like so:`instanceOfRoleDetail.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleDetailCWProxy get copyWith => _$RoleDetailCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleDetail _$RoleDetailFromJson(Map<String, dynamic> json) => $checkedCreate(
  'RoleDetail',
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
        'users',
      ],
    );
    final val = RoleDetail(
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
      users: $checkedConvert(
        'users',
        (v) => (v as List<dynamic>)
            .map((e) => RoleUser.fromJson(e as Map<String, dynamic>))
            .toList(),
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

Map<String, dynamic> _$RoleDetailToJson(RoleDetail instance) =>
    <String, dynamic>{
      'role_id': instance.roleId,
      'name': instance.name,
      'description': instance.description,
      'permissions': instance.permissions,
      'user_count': instance.userCount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'users': instance.users.map((e) => e.toJson()).toList(),
    };
