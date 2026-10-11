// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OutletListCWProxy {
  OutletList data(List<Outlet> data);

  OutletList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletList(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletList call({List<Outlet> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOutletList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOutletList.copyWith.fieldName(...)`
class _$OutletListCWProxyImpl implements _$OutletListCWProxy {
  const _$OutletListCWProxyImpl(this._value);

  final OutletList _value;

  @override
  OutletList data(List<Outlet> data) => this(data: data);

  @override
  OutletList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletList(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return OutletList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Outlet>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $OutletListCopyWith on OutletList {
  /// Returns a callable class that can be used as follows: `instanceOfOutletList.copyWith(...)` or like so:`instanceOfOutletList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OutletListCWProxy get copyWith => _$OutletListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletList _$OutletListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OutletList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = OutletList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Outlet.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OutletListToJson(OutletList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
