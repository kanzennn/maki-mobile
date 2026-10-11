// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosDeviceCWProxy {
  PosDevice device(PosDeviceInfo device);

  PosDevice orderNoPrefix(String orderNoPrefix);

  PosDevice day(DateTime day);

  PosDevice nextNumber(int nextNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  PosDevice call({
    PosDeviceInfo device,
    String orderNoPrefix,
    DateTime day,
    int nextNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosDevice.copyWith.fieldName(...)`
class _$PosDeviceCWProxyImpl implements _$PosDeviceCWProxy {
  const _$PosDeviceCWProxyImpl(this._value);

  final PosDevice _value;

  @override
  PosDevice device(PosDeviceInfo device) => this(device: device);

  @override
  PosDevice orderNoPrefix(String orderNoPrefix) =>
      this(orderNoPrefix: orderNoPrefix);

  @override
  PosDevice day(DateTime day) => this(day: day);

  @override
  PosDevice nextNumber(int nextNumber) => this(nextNumber: nextNumber);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  PosDevice call({
    Object? device = const $CopyWithPlaceholder(),
    Object? orderNoPrefix = const $CopyWithPlaceholder(),
    Object? day = const $CopyWithPlaceholder(),
    Object? nextNumber = const $CopyWithPlaceholder(),
  }) {
    return PosDevice(
      device: device == const $CopyWithPlaceholder()
          ? _value.device
          // ignore: cast_nullable_to_non_nullable
          : device as PosDeviceInfo,
      orderNoPrefix: orderNoPrefix == const $CopyWithPlaceholder()
          ? _value.orderNoPrefix
          // ignore: cast_nullable_to_non_nullable
          : orderNoPrefix as String,
      day: day == const $CopyWithPlaceholder()
          ? _value.day
          // ignore: cast_nullable_to_non_nullable
          : day as DateTime,
      nextNumber: nextNumber == const $CopyWithPlaceholder()
          ? _value.nextNumber
          // ignore: cast_nullable_to_non_nullable
          : nextNumber as int,
    );
  }
}

extension $PosDeviceCopyWith on PosDevice {
  /// Returns a callable class that can be used as follows: `instanceOfPosDevice.copyWith(...)` or like so:`instanceOfPosDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosDeviceCWProxy get copyWith => _$PosDeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosDevice _$PosDeviceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PosDevice',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['device', 'order_no_prefix', 'day', 'next_number'],
    );
    final val = PosDevice(
      device: $checkedConvert(
        'device',
        (v) => PosDeviceInfo.fromJson(v as Map<String, dynamic>),
      ),
      orderNoPrefix: $checkedConvert('order_no_prefix', (v) => v as String),
      day: $checkedConvert('day', (v) => DateTime.parse(v as String)),
      nextNumber: $checkedConvert('next_number', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orderNoPrefix': 'order_no_prefix',
    'nextNumber': 'next_number',
  },
);

Map<String, dynamic> _$PosDeviceToJson(PosDevice instance) => <String, dynamic>{
  'device': instance.device.toJson(),
  'order_no_prefix': instance.orderNoPrefix,
  'day': instance.day.toIso8601String(),
  'next_number': instance.nextNumber,
};
