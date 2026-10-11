// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_menu.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosMenuCWProxy {
  PosMenu menuId(String menuId);

  PosMenu categoryId(String categoryId);

  PosMenu name(String name);

  PosMenu description(String? description);

  PosMenu sku(String? sku);

  PosMenu price(int price);

  PosMenu imageUrl(String? imageUrl);

  PosMenu trackStock(bool trackStock);

  PosMenu stockQty(int? stockQty);

  PosMenu stockAlert(int? stockAlert);

  PosMenu stockStatus(StockStatus stockStatus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosMenu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosMenu(...).copyWith(id: 12, name: "My name")
  /// ````
  PosMenu call({
    String menuId,
    String categoryId,
    String name,
    String? description,
    String? sku,
    int price,
    String? imageUrl,
    bool trackStock,
    int? stockQty,
    int? stockAlert,
    StockStatus stockStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosMenu.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosMenu.copyWith.fieldName(...)`
class _$PosMenuCWProxyImpl implements _$PosMenuCWProxy {
  const _$PosMenuCWProxyImpl(this._value);

  final PosMenu _value;

  @override
  PosMenu menuId(String menuId) => this(menuId: menuId);

  @override
  PosMenu categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  PosMenu name(String name) => this(name: name);

  @override
  PosMenu description(String? description) => this(description: description);

  @override
  PosMenu sku(String? sku) => this(sku: sku);

  @override
  PosMenu price(int price) => this(price: price);

  @override
  PosMenu imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  PosMenu trackStock(bool trackStock) => this(trackStock: trackStock);

  @override
  PosMenu stockQty(int? stockQty) => this(stockQty: stockQty);

  @override
  PosMenu stockAlert(int? stockAlert) => this(stockAlert: stockAlert);

  @override
  PosMenu stockStatus(StockStatus stockStatus) =>
      this(stockStatus: stockStatus);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosMenu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosMenu(...).copyWith(id: 12, name: "My name")
  /// ````
  PosMenu call({
    Object? menuId = const $CopyWithPlaceholder(),
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? trackStock = const $CopyWithPlaceholder(),
    Object? stockQty = const $CopyWithPlaceholder(),
    Object? stockAlert = const $CopyWithPlaceholder(),
    Object? stockStatus = const $CopyWithPlaceholder(),
  }) {
    return PosMenu(
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as int,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      trackStock: trackStock == const $CopyWithPlaceholder()
          ? _value.trackStock
          // ignore: cast_nullable_to_non_nullable
          : trackStock as bool,
      stockQty: stockQty == const $CopyWithPlaceholder()
          ? _value.stockQty
          // ignore: cast_nullable_to_non_nullable
          : stockQty as int?,
      stockAlert: stockAlert == const $CopyWithPlaceholder()
          ? _value.stockAlert
          // ignore: cast_nullable_to_non_nullable
          : stockAlert as int?,
      stockStatus: stockStatus == const $CopyWithPlaceholder()
          ? _value.stockStatus
          // ignore: cast_nullable_to_non_nullable
          : stockStatus as StockStatus,
    );
  }
}

extension $PosMenuCopyWith on PosMenu {
  /// Returns a callable class that can be used as follows: `instanceOfPosMenu.copyWith(...)` or like so:`instanceOfPosMenu.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosMenuCWProxy get copyWith => _$PosMenuCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosMenu _$PosMenuFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PosMenu',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'menu_id',
        'category_id',
        'name',
        'description',
        'sku',
        'price',
        'image_url',
        'track_stock',
        'stock_qty',
        'stock_alert',
        'stock_status',
      ],
    );
    final val = PosMenu(
      menuId: $checkedConvert('menu_id', (v) => v as String),
      categoryId: $checkedConvert('category_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      sku: $checkedConvert('sku', (v) => v as String?),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      imageUrl: $checkedConvert('image_url', (v) => v as String?),
      trackStock: $checkedConvert('track_stock', (v) => v as bool),
      stockQty: $checkedConvert('stock_qty', (v) => (v as num?)?.toInt()),
      stockAlert: $checkedConvert('stock_alert', (v) => (v as num?)?.toInt()),
      stockStatus: $checkedConvert(
        'stock_status',
        (v) => $enumDecode(_$StockStatusEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'menuId': 'menu_id',
    'categoryId': 'category_id',
    'imageUrl': 'image_url',
    'trackStock': 'track_stock',
    'stockQty': 'stock_qty',
    'stockAlert': 'stock_alert',
    'stockStatus': 'stock_status',
  },
);

Map<String, dynamic> _$PosMenuToJson(PosMenu instance) => <String, dynamic>{
  'menu_id': instance.menuId,
  'category_id': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'sku': instance.sku,
  'price': instance.price,
  'image_url': instance.imageUrl,
  'track_stock': instance.trackStock,
  'stock_qty': instance.stockQty,
  'stock_alert': instance.stockAlert,
  'stock_status': _$StockStatusEnumMap[instance.stockStatus]!,
};

const _$StockStatusEnumMap = {
  StockStatus.untracked: 'untracked',
  StockStatus.ok: 'ok',
  StockStatus.low: 'low',
  StockStatus.out_: 'out',
};
