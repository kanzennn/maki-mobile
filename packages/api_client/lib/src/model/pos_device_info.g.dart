// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_device_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosDeviceInfoCWProxy {
  PosDeviceInfo deviceId(String deviceId);

  PosDeviceInfo code(String code);

  PosDeviceInfo name(String name);

  PosDeviceInfo platform(PosDeviceInfoPlatformEnum platform);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosDeviceInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosDeviceInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PosDeviceInfo call({
    String deviceId,
    String code,
    String name,
    PosDeviceInfoPlatformEnum platform,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosDeviceInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosDeviceInfo.copyWith.fieldName(...)`
class _$PosDeviceInfoCWProxyImpl implements _$PosDeviceInfoCWProxy {
  const _$PosDeviceInfoCWProxyImpl(this._value);

  final PosDeviceInfo _value;

  @override
  PosDeviceInfo deviceId(String deviceId) => this(deviceId: deviceId);

  @override
  PosDeviceInfo code(String code) => this(code: code);

  @override
  PosDeviceInfo name(String name) => this(name: name);

  @override
  PosDeviceInfo platform(PosDeviceInfoPlatformEnum platform) =>
      this(platform: platform);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosDeviceInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosDeviceInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PosDeviceInfo call({
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return PosDeviceInfo(
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
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as PosDeviceInfoPlatformEnum,
    );
  }
}

extension $PosDeviceInfoCopyWith on PosDeviceInfo {
  /// Returns a callable class that can be used as follows: `instanceOfPosDeviceInfo.copyWith(...)` or like so:`instanceOfPosDeviceInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosDeviceInfoCWProxy get copyWith => _$PosDeviceInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosDeviceInfo _$PosDeviceInfoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PosDeviceInfo', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['device_id', 'code', 'name', 'platform'],
      );
      final val = PosDeviceInfo(
        deviceId: $checkedConvert('device_id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        platform: $checkedConvert(
          'platform',
          (v) => $enumDecode(_$PosDeviceInfoPlatformEnumEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'deviceId': 'device_id'});

Map<String, dynamic> _$PosDeviceInfoToJson(PosDeviceInfo instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'code': instance.code,
      'name': instance.name,
      'platform': _$PosDeviceInfoPlatformEnumEnumMap[instance.platform]!,
    };

const _$PosDeviceInfoPlatformEnumEnumMap = {
  PosDeviceInfoPlatformEnum.web: 'web',
  PosDeviceInfoPlatformEnum.android: 'android',
};
