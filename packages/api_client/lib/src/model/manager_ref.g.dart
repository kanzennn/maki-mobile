// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_ref.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManagerRefCWProxy {
  ManagerRef userId(String userId);

  ManagerRef name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManagerRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManagerRef(...).copyWith(id: 12, name: "My name")
  /// ````
  ManagerRef call({String userId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManagerRef.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManagerRef.copyWith.fieldName(...)`
class _$ManagerRefCWProxyImpl implements _$ManagerRefCWProxy {
  const _$ManagerRefCWProxyImpl(this._value);

  final ManagerRef _value;

  @override
  ManagerRef userId(String userId) => this(userId: userId);

  @override
  ManagerRef name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManagerRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManagerRef(...).copyWith(id: 12, name: "My name")
  /// ````
  ManagerRef call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ManagerRef(
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

extension $ManagerRefCopyWith on ManagerRef {
  /// Returns a callable class that can be used as follows: `instanceOfManagerRef.copyWith(...)` or like so:`instanceOfManagerRef.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManagerRefCWProxy get copyWith => _$ManagerRefCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManagerRef _$ManagerRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ManagerRef', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name']);
      final val = ManagerRef(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$ManagerRefToJson(ManagerRef instance) =>
    <String, dynamic>{'user_id': instance.userId, 'name': instance.name};
