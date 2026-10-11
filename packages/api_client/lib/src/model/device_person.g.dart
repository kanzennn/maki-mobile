// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DevicePersonCWProxy {
  DevicePerson userId(String userId);

  DevicePerson name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicePerson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicePerson(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicePerson call({String userId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevicePerson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevicePerson.copyWith.fieldName(...)`
class _$DevicePersonCWProxyImpl implements _$DevicePersonCWProxy {
  const _$DevicePersonCWProxyImpl(this._value);

  final DevicePerson _value;

  @override
  DevicePerson userId(String userId) => this(userId: userId);

  @override
  DevicePerson name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DevicePerson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DevicePerson(...).copyWith(id: 12, name: "My name")
  /// ````
  DevicePerson call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return DevicePerson(
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

extension $DevicePersonCopyWith on DevicePerson {
  /// Returns a callable class that can be used as follows: `instanceOfDevicePerson.copyWith(...)` or like so:`instanceOfDevicePerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DevicePersonCWProxy get copyWith => _$DevicePersonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevicePerson _$DevicePersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DevicePerson', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name']);
      final val = DevicePerson(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$DevicePersonToJson(DevicePerson instance) =>
    <String, dynamic>{'user_id': instance.userId, 'name': instance.name};
