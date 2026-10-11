// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activated_device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivatedDeviceCWProxy {
  ActivatedDevice device(Device device);

  ActivatedDevice token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivatedDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivatedDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivatedDevice call({Device device, String? token});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActivatedDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActivatedDevice.copyWith.fieldName(...)`
class _$ActivatedDeviceCWProxyImpl implements _$ActivatedDeviceCWProxy {
  const _$ActivatedDeviceCWProxyImpl(this._value);

  final ActivatedDevice _value;

  @override
  ActivatedDevice device(Device device) => this(device: device);

  @override
  ActivatedDevice token(String? token) => this(token: token);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivatedDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivatedDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivatedDevice call({
    Object? device = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return ActivatedDevice(
      device: device == const $CopyWithPlaceholder()
          ? _value.device
          // ignore: cast_nullable_to_non_nullable
          : device as Device,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
    );
  }
}

extension $ActivatedDeviceCopyWith on ActivatedDevice {
  /// Returns a callable class that can be used as follows: `instanceOfActivatedDevice.copyWith(...)` or like so:`instanceOfActivatedDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivatedDeviceCWProxy get copyWith => _$ActivatedDeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivatedDevice _$ActivatedDeviceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActivatedDevice', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['device', 'token']);
      final val = ActivatedDevice(
        device: $checkedConvert(
          'device',
          (v) => Device.fromJson(v as Map<String, dynamic>),
        ),
        token: $checkedConvert('token', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ActivatedDeviceToJson(ActivatedDevice instance) =>
    <String, dynamic>{
      'device': instance.device.toJson(),
      'token': instance.token,
    };
