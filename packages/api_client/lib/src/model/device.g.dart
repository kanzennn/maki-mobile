// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceCWProxy {
  Device deviceId(String deviceId);

  Device code(String code);

  Device name(String name);

  Device platform(DevicePlatformEnum platform);

  Device status(DeviceStatusEnum status);

  Device activatedBy(DevicePerson activatedBy);

  Device activatedAt(DateTime activatedAt);

  Device lastSeenAt(DateTime? lastSeenAt);

  Device revokedAt(DateTime? revokedAt);

  Device revokedBy(DevicePerson? revokedBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    String deviceId,
    String code,
    String name,
    DevicePlatformEnum platform,
    DeviceStatusEnum status,
    DevicePerson activatedBy,
    DateTime activatedAt,
    DateTime? lastSeenAt,
    DateTime? revokedAt,
    DevicePerson? revokedBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevice.copyWith.fieldName(...)`
class _$DeviceCWProxyImpl implements _$DeviceCWProxy {
  const _$DeviceCWProxyImpl(this._value);

  final Device _value;

  @override
  Device deviceId(String deviceId) => this(deviceId: deviceId);

  @override
  Device code(String code) => this(code: code);

  @override
  Device name(String name) => this(name: name);

  @override
  Device platform(DevicePlatformEnum platform) => this(platform: platform);

  @override
  Device status(DeviceStatusEnum status) => this(status: status);

  @override
  Device activatedBy(DevicePerson activatedBy) =>
      this(activatedBy: activatedBy);

  @override
  Device activatedAt(DateTime activatedAt) => this(activatedAt: activatedAt);

  @override
  Device lastSeenAt(DateTime? lastSeenAt) => this(lastSeenAt: lastSeenAt);

  @override
  Device revokedAt(DateTime? revokedAt) => this(revokedAt: revokedAt);

  @override
  Device revokedBy(DevicePerson? revokedBy) => this(revokedBy: revokedBy);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? activatedBy = const $CopyWithPlaceholder(),
    Object? activatedAt = const $CopyWithPlaceholder(),
    Object? lastSeenAt = const $CopyWithPlaceholder(),
    Object? revokedAt = const $CopyWithPlaceholder(),
    Object? revokedBy = const $CopyWithPlaceholder(),
  }) {
    return Device(
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
          : platform as DevicePlatformEnum,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as DeviceStatusEnum,
      activatedBy: activatedBy == const $CopyWithPlaceholder()
          ? _value.activatedBy
          // ignore: cast_nullable_to_non_nullable
          : activatedBy as DevicePerson,
      activatedAt: activatedAt == const $CopyWithPlaceholder()
          ? _value.activatedAt
          // ignore: cast_nullable_to_non_nullable
          : activatedAt as DateTime,
      lastSeenAt: lastSeenAt == const $CopyWithPlaceholder()
          ? _value.lastSeenAt
          // ignore: cast_nullable_to_non_nullable
          : lastSeenAt as DateTime?,
      revokedAt: revokedAt == const $CopyWithPlaceholder()
          ? _value.revokedAt
          // ignore: cast_nullable_to_non_nullable
          : revokedAt as DateTime?,
      revokedBy: revokedBy == const $CopyWithPlaceholder()
          ? _value.revokedBy
          // ignore: cast_nullable_to_non_nullable
          : revokedBy as DevicePerson?,
    );
  }
}

extension $DeviceCopyWith on Device {
  /// Returns a callable class that can be used as follows: `instanceOfDevice.copyWith(...)` or like so:`instanceOfDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceCWProxy get copyWith => _$DeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Device',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'device_id',
        'code',
        'name',
        'platform',
        'status',
        'activated_by',
        'activated_at',
        'last_seen_at',
        'revoked_at',
        'revoked_by',
      ],
    );
    final val = Device(
      deviceId: $checkedConvert('device_id', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      platform: $checkedConvert(
        'platform',
        (v) => $enumDecode(_$DevicePlatformEnumEnumMap, v),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$DeviceStatusEnumEnumMap, v),
      ),
      activatedBy: $checkedConvert(
        'activated_by',
        (v) => DevicePerson.fromJson(v as Map<String, dynamic>),
      ),
      activatedAt: $checkedConvert(
        'activated_at',
        (v) => DateTime.parse(v as String),
      ),
      lastSeenAt: $checkedConvert(
        'last_seen_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      revokedAt: $checkedConvert(
        'revoked_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      revokedBy: $checkedConvert(
        'revoked_by',
        (v) =>
            v == null ? null : DevicePerson.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'deviceId': 'device_id',
    'activatedBy': 'activated_by',
    'activatedAt': 'activated_at',
    'lastSeenAt': 'last_seen_at',
    'revokedAt': 'revoked_at',
    'revokedBy': 'revoked_by',
  },
);

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
  'device_id': instance.deviceId,
  'code': instance.code,
  'name': instance.name,
  'platform': _$DevicePlatformEnumEnumMap[instance.platform]!,
  'status': _$DeviceStatusEnumEnumMap[instance.status]!,
  'activated_by': instance.activatedBy.toJson(),
  'activated_at': instance.activatedAt.toIso8601String(),
  'last_seen_at': instance.lastSeenAt?.toIso8601String(),
  'revoked_at': instance.revokedAt?.toIso8601String(),
  'revoked_by': instance.revokedBy?.toJson(),
};

const _$DevicePlatformEnumEnumMap = {
  DevicePlatformEnum.web: 'web',
  DevicePlatformEnum.android: 'android',
};

const _$DeviceStatusEnumEnumMap = {
  DeviceStatusEnum.active: 'active',
  DeviceStatusEnum.revoked: 'revoked',
};
