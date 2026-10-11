// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ref.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserRefCWProxy {
  UserRef userId(String userId);

  UserRef name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRef(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRef call({String userId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserRef.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserRef.copyWith.fieldName(...)`
class _$UserRefCWProxyImpl implements _$UserRefCWProxy {
  const _$UserRefCWProxyImpl(this._value);

  final UserRef _value;

  @override
  UserRef userId(String userId) => this(userId: userId);

  @override
  UserRef name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRef(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRef call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return UserRef(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $UserRefCopyWith on UserRef {
  /// Returns a callable class that can be used as follows: `instanceOfUserRef.copyWith(...)` or like so:`instanceOfUserRef.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserRefCWProxy get copyWith => _$UserRefCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRef _$UserRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserRef', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name']);
      final val = UserRef(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$UserRefToJson(UserRef instance) => <String, dynamic>{
  'user_id': instance.userId,
  'name': instance.name,
};
