// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderItemCWProxy {
  OrderItem orderItemId(String orderItemId);

  OrderItem menuId(String menuId);

  OrderItem menuName(String menuName);

  OrderItem price(int price);

  OrderItem qty(int qty);

  OrderItem note(String? note);

  OrderItem lineTotal(int lineTotal);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItem(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItem call({
    String orderItemId,
    String menuId,
    String menuName,
    int price,
    int qty,
    String? note,
    int lineTotal,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderItem.copyWith.fieldName(...)`
class _$OrderItemCWProxyImpl implements _$OrderItemCWProxy {
  const _$OrderItemCWProxyImpl(this._value);

  final OrderItem _value;

  @override
  OrderItem orderItemId(String orderItemId) => this(orderItemId: orderItemId);

  @override
  OrderItem menuId(String menuId) => this(menuId: menuId);

  @override
  OrderItem menuName(String menuName) => this(menuName: menuName);

  @override
  OrderItem price(int price) => this(price: price);

  @override
  OrderItem qty(int qty) => this(qty: qty);

  @override
  OrderItem note(String? note) => this(note: note);

  @override
  OrderItem lineTotal(int lineTotal) => this(lineTotal: lineTotal);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderItem(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderItem call({
    Object? orderItemId = const $CopyWithPlaceholder(),
    Object? menuId = const $CopyWithPlaceholder(),
    Object? menuName = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? lineTotal = const $CopyWithPlaceholder(),
  }) {
    return OrderItem(
      orderItemId: orderItemId == const $CopyWithPlaceholder()
          ? _value.orderItemId
          // ignore: cast_nullable_to_non_nullable
          : orderItemId as String,
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
      menuName: menuName == const $CopyWithPlaceholder()
          ? _value.menuName
          // ignore: cast_nullable_to_non_nullable
          : menuName as String,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      lineTotal: lineTotal == const $CopyWithPlaceholder()
          ? _value.lineTotal
          // ignore: cast_nullable_to_non_nullable
          : lineTotal as int,
    );
  }
}

extension $OrderItemCopyWith on OrderItem {
  /// Returns a callable class that can be used as follows: `instanceOfOrderItem.copyWith(...)` or like so:`instanceOfOrderItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderItemCWProxy get copyWith => _$OrderItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'OrderItem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'order_item_id',
        'menu_id',
        'menu_name',
        'price',
        'qty',
        'note',
        'line_total',
      ],
    );
    final val = OrderItem(
      orderItemId: $checkedConvert('order_item_id', (v) => v as String),
      menuId: $checkedConvert('menu_id', (v) => v as String),
      menuName: $checkedConvert('menu_name', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      qty: $checkedConvert('qty', (v) => (v as num).toInt()),
      note: $checkedConvert('note', (v) => v as String?),
      lineTotal: $checkedConvert('line_total', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'orderItemId': 'order_item_id',
    'menuId': 'menu_id',
    'menuName': 'menu_name',
    'lineTotal': 'line_total',
  },
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'order_item_id': instance.orderItemId,
  'menu_id': instance.menuId,
  'menu_name': instance.menuName,
  'price': instance.price,
  'qty': instance.qty,
  'note': instance.note,
  'line_total': instance.lineTotal,
};
