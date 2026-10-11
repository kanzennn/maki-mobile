// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaListCWProxy {
  AreaList data(List<Area> data);

  AreaList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaList(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaList call({List<Area> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAreaList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAreaList.copyWith.fieldName(...)`
class _$AreaListCWProxyImpl implements _$AreaListCWProxy {
  const _$AreaListCWProxyImpl(this._value);

  final AreaList _value;

  @override
  AreaList data(List<Area> data) => this(data: data);

  @override
  AreaList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaList(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return AreaList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Area>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $AreaListCopyWith on AreaList {
  /// Returns a callable class that can be used as follows: `instanceOfAreaList.copyWith(...)` or like so:`instanceOfAreaList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AreaListCWProxy get copyWith => _$AreaListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaList _$AreaListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = AreaList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Area.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AreaListToJson(AreaList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
