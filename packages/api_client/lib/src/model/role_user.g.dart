// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleUserCWProxy {
  RoleUser userId(String userId);

  RoleUser name(String name);

  RoleUser username(String username);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleUser(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleUser call({String userId, String name, String username});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoleUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoleUser.copyWith.fieldName(...)`
class _$RoleUserCWProxyImpl implements _$RoleUserCWProxy {
  const _$RoleUserCWProxyImpl(this._value);

  final RoleUser _value;

  @override
  RoleUser userId(String userId) => this(userId: userId);

  @override
  RoleUser name(String name) => this(name: name);

  @override
  RoleUser username(String username) => this(username: username);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleUser(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleUser call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
  }) {
    return RoleUser(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
    );
  }
}

extension $RoleUserCopyWith on RoleUser {
  /// Returns a callable class that can be used as follows: `instanceOfRoleUser.copyWith(...)` or like so:`instanceOfRoleUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleUserCWProxy get copyWith => _$RoleUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleUser _$RoleUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoleUser', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name', 'username']);
      final val = RoleUser(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        username: $checkedConvert('username', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$RoleUserToJson(RoleUser instance) => <String, dynamic>{
  'user_id': instance.userId,
  'name': instance.name,
  'username': instance.username,
};
