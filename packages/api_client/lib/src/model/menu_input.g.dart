// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuInputCWProxy {
  MenuInput name(String name);

  MenuInput categoryId(String categoryId);

  MenuInput price(int price);

  MenuInput description(String? description);

  MenuInput sku(String? sku);

  MenuInput trackStock(bool? trackStock);

  MenuInput initialStock(int? initialStock);

  MenuInput stockAlert(int? stockAlert);

  MenuInput isActive(bool? isActive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuInput(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuInput call({
    String name,
    String categoryId,
    int price,
    String? description,
    String? sku,
    bool? trackStock,
    int? initialStock,
    int? stockAlert,
    bool? isActive,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuInput.copyWith.fieldName(...)`
class _$MenuInputCWProxyImpl implements _$MenuInputCWProxy {
  const _$MenuInputCWProxyImpl(this._value);

  final MenuInput _value;

  @override
  MenuInput name(String name) => this(name: name);

  @override
  MenuInput categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  MenuInput price(int price) => this(price: price);

  @override
  MenuInput description(String? description) => this(description: description);

  @override
  MenuInput sku(String? sku) => this(sku: sku);

  @override
  MenuInput trackStock(bool? trackStock) => this(trackStock: trackStock);

  @override
  MenuInput initialStock(int? initialStock) => this(initialStock: initialStock);

  @override
  MenuInput stockAlert(int? stockAlert) => this(stockAlert: stockAlert);

  @override
  MenuInput isActive(bool? isActive) => this(isActive: isActive);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuInput(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuInput call({
    Object? name = const $CopyWithPlaceholder(),
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? trackStock = const $CopyWithPlaceholder(),
    Object? initialStock = const $CopyWithPlaceholder(),
    Object? stockAlert = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
  }) {
    return MenuInput(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as String,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      trackStock: trackStock == const $CopyWithPlaceholder()
          ? _value.trackStock
          // ignore: cast_nullable_to_non_nullable
          : trackStock as bool?,
      initialStock: initialStock == const $CopyWithPlaceholder()
          ? _value.initialStock
          // ignore: cast_nullable_to_non_nullable
          : initialStock as int?,
      stockAlert: stockAlert == const $CopyWithPlaceholder()
          ? _value.stockAlert
          // ignore: cast_nullable_to_non_nullable
          : stockAlert as int?,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool?,
    );
  }
}

extension $MenuInputCopyWith on MenuInput {
  /// Returns a callable class that can be used as follows: `instanceOfMenuInput.copyWith(...)` or like so:`instanceOfMenuInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuInputCWProxy get copyWith => _$MenuInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuInput _$MenuInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  'MenuInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['name', 'category_id', 'price']);
    final val = MenuInput(
      name: $checkedConvert('name', (v) => v as String),
      categoryId: $checkedConvert('category_id', (v) => v as String),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      description: $checkedConvert('description', (v) => v as String?),
      sku: $checkedConvert('sku', (v) => v as String?),
      trackStock: $checkedConvert('track_stock', (v) => v as bool? ?? false),
      initialStock: $checkedConvert(
        'initial_stock',
        (v) => (v as num?)?.toInt(),
      ),
      stockAlert: $checkedConvert('stock_alert', (v) => (v as num?)?.toInt()),
      isActive: $checkedConvert('is_active', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryId': 'category_id',
    'trackStock': 'track_stock',
    'initialStock': 'initial_stock',
    'stockAlert': 'stock_alert',
    'isActive': 'is_active',
  },
);

Map<String, dynamic> _$MenuInputToJson(MenuInput instance) => <String, dynamic>{
  'name': instance.name,
  'category_id': instance.categoryId,
  'price': instance.price,
  'description': ?instance.description,
  'sku': ?instance.sku,
  'track_stock': ?instance.trackStock,
  'initial_stock': ?instance.initialStock,
  'stock_alert': ?instance.stockAlert,
  'is_active': ?instance.isActive,
};
