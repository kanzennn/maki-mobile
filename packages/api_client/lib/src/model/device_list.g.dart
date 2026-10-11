// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceListCWProxy {
  DeviceList data(List<Device> data);

  DeviceList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceList(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceList call({List<Device> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceList.copyWith.fieldName(...)`
class _$DeviceListCWProxyImpl implements _$DeviceListCWProxy {
  const _$DeviceListCWProxyImpl(this._value);

  final DeviceList _value;

  @override
  DeviceList data(List<Device> data) => this(data: data);

  @override
  DeviceList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceList(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return DeviceList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Device>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $DeviceListCopyWith on DeviceList {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceList.copyWith(...)` or like so:`instanceOfDeviceList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceListCWProxy get copyWith => _$DeviceListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceList _$DeviceListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeviceList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = DeviceList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Device.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeviceListToJson(DeviceList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
