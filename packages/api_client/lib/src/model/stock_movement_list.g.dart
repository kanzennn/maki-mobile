// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockMovementListCWProxy {
  StockMovementList data(List<StockMovement> data);

  StockMovementList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovementList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovementList(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovementList call({List<StockMovement> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockMovementList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockMovementList.copyWith.fieldName(...)`
class _$StockMovementListCWProxyImpl implements _$StockMovementListCWProxy {
  const _$StockMovementListCWProxyImpl(this._value);

  final StockMovementList _value;

  @override
  StockMovementList data(List<StockMovement> data) => this(data: data);

  @override
  StockMovementList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovementList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovementList(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovementList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return StockMovementList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<StockMovement>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $StockMovementListCopyWith on StockMovementList {
  /// Returns a callable class that can be used as follows: `instanceOfStockMovementList.copyWith(...)` or like so:`instanceOfStockMovementList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockMovementListCWProxy get copyWith =>
      _$StockMovementListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockMovementList _$StockMovementListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StockMovementList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = StockMovementList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => StockMovement.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StockMovementListToJson(StockMovementList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
