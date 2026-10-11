// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderListCWProxy {
  OrderList data(List<OrderSummary> data);

  OrderList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderList(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderList call({List<OrderSummary> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderList.copyWith.fieldName(...)`
class _$OrderListCWProxyImpl implements _$OrderListCWProxy {
  const _$OrderListCWProxyImpl(this._value);

  final OrderList _value;

  @override
  OrderList data(List<OrderSummary> data) => this(data: data);

  @override
  OrderList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderList(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return OrderList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<OrderSummary>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $OrderListCopyWith on OrderList {
  /// Returns a callable class that can be used as follows: `instanceOfOrderList.copyWith(...)` or like so:`instanceOfOrderList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderListCWProxy get copyWith => _$OrderListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = OrderList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => OrderSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
