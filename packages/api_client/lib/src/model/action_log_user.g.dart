// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionLogUserCWProxy {
  ActionLogUser userId(String userId);

  ActionLogUser name(String name);

  ActionLogUser isOwner(bool isOwner);

  ActionLogUser isManager(bool isManager);

  ActionLogUser roleName(String? roleName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogUser call({
    String userId,
    String name,
    bool isOwner,
    bool isManager,
    String? roleName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionLogUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionLogUser.copyWith.fieldName(...)`
class _$ActionLogUserCWProxyImpl implements _$ActionLogUserCWProxy {
  const _$ActionLogUserCWProxyImpl(this._value);

  final ActionLogUser _value;

  @override
  ActionLogUser userId(String userId) => this(userId: userId);

  @override
  ActionLogUser name(String name) => this(name: name);

  @override
  ActionLogUser isOwner(bool isOwner) => this(isOwner: isOwner);

  @override
  ActionLogUser isManager(bool isManager) => this(isManager: isManager);

  @override
  ActionLogUser roleName(String? roleName) => this(roleName: roleName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogUser call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? isOwner = const $CopyWithPlaceholder(),
    Object? isManager = const $CopyWithPlaceholder(),
    Object? roleName = const $CopyWithPlaceholder(),
  }) {
    return ActionLogUser(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      isOwner: isOwner == const $CopyWithPlaceholder()
          ? _value.isOwner
          // ignore: cast_nullable_to_non_nullable
          : isOwner as bool,
      isManager: isManager == const $CopyWithPlaceholder()
          ? _value.isManager
          // ignore: cast_nullable_to_non_nullable
          : isManager as bool,
      roleName: roleName == const $CopyWithPlaceholder()
          ? _value.roleName
          // ignore: cast_nullable_to_non_nullable
          : roleName as String?,
    );
  }
}

extension $ActionLogUserCopyWith on ActionLogUser {
  /// Returns a callable class that can be used as follows: `instanceOfActionLogUser.copyWith(...)` or like so:`instanceOfActionLogUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionLogUserCWProxy get copyWith => _$ActionLogUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLogUser _$ActionLogUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ActionLogUser',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'user_id',
            'name',
            'is_owner',
            'is_manager',
            'role_name',
          ],
        );
        final val = ActionLogUser(
          userId: $checkedConvert('user_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          isOwner: $checkedConvert('is_owner', (v) => v as bool),
          isManager: $checkedConvert('is_manager', (v) => v as bool),
          roleName: $checkedConvert('role_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'isOwner': 'is_owner',
        'isManager': 'is_manager',
        'roleName': 'role_name',
      },
    );

Map<String, dynamic> _$ActionLogUserToJson(ActionLogUser instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'is_owner': instance.isOwner,
      'is_manager': instance.isManager,
      'role_name': instance.roleName,
    };
