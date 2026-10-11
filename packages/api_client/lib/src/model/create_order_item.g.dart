// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateOrderItemCWProxy {
  CreateOrderItem menuId(String menuId);

  CreateOrderItem qty(int qty);

  CreateOrderItem price(int price);

  CreateOrderItem note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderItem call({String menuId, int qty, int price, String? note});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateOrderItem.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateOrderItem.copyWith.fieldName(...)`
class _$CreateOrderItemCWProxyImpl implements _$CreateOrderItemCWProxy {
  const _$CreateOrderItemCWProxyImpl(this._value);

  final CreateOrderItem _value;

  @override
  CreateOrderItem menuId(String menuId) => this(menuId: menuId);

  @override
  CreateOrderItem qty(int qty) => this(qty: qty);

  @override
  CreateOrderItem price(int price) => this(price: price);

  @override
  CreateOrderItem note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderItem(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderItem(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderItem call({
    Object? menuId = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return CreateOrderItem(
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $CreateOrderItemCopyWith on CreateOrderItem {
  /// Returns a callable class that can be used as follows: `instanceOfCreateOrderItem.copyWith(...)` or like so:`instanceOfCreateOrderItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateOrderItemCWProxy get copyWith => _$CreateOrderItemCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderItem _$CreateOrderItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateOrderItem', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['menu_id', 'qty', 'price']);
      final val = CreateOrderItem(
        menuId: $checkedConvert('menu_id', (v) => v as String),
        qty: $checkedConvert('qty', (v) => (v as num).toInt()),
        price: $checkedConvert('price', (v) => (v as num).toInt()),
        note: $checkedConvert('note', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'menuId': 'menu_id'});

Map<String, dynamic> _$CreateOrderItemToJson(CreateOrderItem instance) =>
    <String, dynamic>{
      'menu_id': instance.menuId,
      'qty': instance.qty,
      'price': instance.price,
      'note': ?instance.note,
    };
