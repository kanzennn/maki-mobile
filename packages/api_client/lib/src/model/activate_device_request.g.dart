// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_device_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivateDeviceRequestCWProxy {
  ActivateDeviceRequest name(String name);

  ActivateDeviceRequest platform(ActivateDeviceRequestPlatformEnum platform);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivateDeviceRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivateDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivateDeviceRequest call({
    String name,
    ActivateDeviceRequestPlatformEnum platform,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActivateDeviceRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActivateDeviceRequest.copyWith.fieldName(...)`
class _$ActivateDeviceRequestCWProxyImpl
    implements _$ActivateDeviceRequestCWProxy {
  const _$ActivateDeviceRequestCWProxyImpl(this._value);

  final ActivateDeviceRequest _value;

  @override
  ActivateDeviceRequest name(String name) => this(name: name);

  @override
  ActivateDeviceRequest platform(ActivateDeviceRequestPlatformEnum platform) =>
      this(platform: platform);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivateDeviceRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivateDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivateDeviceRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return ActivateDeviceRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as ActivateDeviceRequestPlatformEnum,
    );
  }
}

extension $ActivateDeviceRequestCopyWith on ActivateDeviceRequest {
  /// Returns a callable class that can be used as follows: `instanceOfActivateDeviceRequest.copyWith(...)` or like so:`instanceOfActivateDeviceRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivateDeviceRequestCWProxy get copyWith =>
      _$ActivateDeviceRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivateDeviceRequest _$ActivateDeviceRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ActivateDeviceRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name', 'platform']);
  final val = ActivateDeviceRequest(
    name: $checkedConvert('name', (v) => v as String),
    platform: $checkedConvert(
      'platform',
      (v) => $enumDecode(_$ActivateDeviceRequestPlatformEnumEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$ActivateDeviceRequestToJson(
  ActivateDeviceRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'platform': _$ActivateDeviceRequestPlatformEnumEnumMap[instance.platform]!,
};

const _$ActivateDeviceRequestPlatformEnumEnumMap = {
  ActivateDeviceRequestPlatformEnum.web: 'web',
  ActivateDeviceRequestPlatformEnum.android: 'android',
};
