// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TableListCWProxy {
  TableList data(List<Table> data);

  TableList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableList(...).copyWith(id: 12, name: "My name")
  /// ````
  TableList call({List<Table> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTableList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTableList.copyWith.fieldName(...)`
class _$TableListCWProxyImpl implements _$TableListCWProxy {
  const _$TableListCWProxyImpl(this._value);

  final TableList _value;

  @override
  TableList data(List<Table> data) => this(data: data);

  @override
  TableList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableList(...).copyWith(id: 12, name: "My name")
  /// ````
  TableList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return TableList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Table>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $TableListCopyWith on TableList {
  /// Returns a callable class that can be used as follows: `instanceOfTableList.copyWith(...)` or like so:`instanceOfTableList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TableListCWProxy get copyWith => _$TableListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableList _$TableListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TableList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = TableList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Table.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TableListToJson(TableList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
