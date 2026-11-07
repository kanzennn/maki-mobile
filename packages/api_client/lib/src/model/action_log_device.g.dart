// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log_device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionLogDeviceCWProxy {
  ActionLogDevice deviceId(String deviceId);

  ActionLogDevice code(String code);

  ActionLogDevice name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogDevice call({String deviceId, String code, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionLogDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionLogDevice.copyWith.fieldName(...)`
class _$ActionLogDeviceCWProxyImpl implements _$ActionLogDeviceCWProxy {
  const _$ActionLogDeviceCWProxyImpl(this._value);

  final ActionLogDevice _value;

  @override
  ActionLogDevice deviceId(String deviceId) => this(deviceId: deviceId);

  @override
  ActionLogDevice code(String code) => this(code: code);

  @override
  ActionLogDevice name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogDevice call({
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ActionLogDevice(
      deviceId: deviceId == const $CopyWithPlaceholder()
          ? _value.deviceId
          // ignore: cast_nullable_to_non_nullable
          : deviceId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $ActionLogDeviceCopyWith on ActionLogDevice {
  /// Returns a callable class that can be used as follows: `instanceOfActionLogDevice.copyWith(...)` or like so:`instanceOfActionLogDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionLogDeviceCWProxy get copyWith => _$ActionLogDeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLogDevice _$ActionLogDeviceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActionLogDevice', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['device_id', 'code', 'name']);
      final val = ActionLogDevice(
        deviceId: $checkedConvert('device_id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'deviceId': 'device_id'});

Map<String, dynamic> _$ActionLogDeviceToJson(ActionLogDevice instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'code': instance.code,
      'name': instance.name,
    };
