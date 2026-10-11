// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuCWProxy {
  Menu menuId(String menuId);

  Menu name(String name);

  Menu description(String? description);

  Menu sku(String? sku);

  Menu price(int price);

  Menu imageUrl(String? imageUrl);

  Menu trackStock(bool trackStock);

  Menu stockQty(int stockQty);

  Menu stockAlert(int? stockAlert);

  Menu stockStatus(StockStatus stockStatus);

  Menu isActive(bool isActive);

  Menu category(MenuCategory category);

  Menu createdAt(DateTime createdAt);

  Menu updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Menu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Menu(...).copyWith(id: 12, name: "My name")
  /// ````
  Menu call({
    String menuId,
    String name,
    String? description,
    String? sku,
    int price,
    String? imageUrl,
    bool trackStock,
    int stockQty,
    int? stockAlert,
    StockStatus stockStatus,
    bool isActive,
    MenuCategory category,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenu.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenu.copyWith.fieldName(...)`
class _$MenuCWProxyImpl implements _$MenuCWProxy {
  const _$MenuCWProxyImpl(this._value);

  final Menu _value;

  @override
  Menu menuId(String menuId) => this(menuId: menuId);

  @override
  Menu name(String name) => this(name: name);

  @override
  Menu description(String? description) => this(description: description);

  @override
  Menu sku(String? sku) => this(sku: sku);

  @override
  Menu price(int price) => this(price: price);

  @override
  Menu imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  Menu trackStock(bool trackStock) => this(trackStock: trackStock);

  @override
  Menu stockQty(int stockQty) => this(stockQty: stockQty);

  @override
  Menu stockAlert(int? stockAlert) => this(stockAlert: stockAlert);

  @override
  Menu stockStatus(StockStatus stockStatus) => this(stockStatus: stockStatus);

  @override
  Menu isActive(bool isActive) => this(isActive: isActive);

  @override
  Menu category(MenuCategory category) => this(category: category);

  @override
  Menu createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Menu updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Menu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Menu(...).copyWith(id: 12, name: "My name")
  /// ````
  Menu call({
    Object? menuId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? trackStock = const $CopyWithPlaceholder(),
    Object? stockQty = const $CopyWithPlaceholder(),
    Object? stockAlert = const $CopyWithPlaceholder(),
    Object? stockStatus = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Menu(
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
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
          : stockQty as int,
      stockAlert: stockAlert == const $CopyWithPlaceholder()
          ? _value.stockAlert
          // ignore: cast_nullable_to_non_nullable
          : stockAlert as int?,
      stockStatus: stockStatus == const $CopyWithPlaceholder()
          ? _value.stockStatus
          // ignore: cast_nullable_to_non_nullable
          : stockStatus as StockStatus,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as MenuCategory,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $MenuCopyWith on Menu {
  /// Returns a callable class that can be used as follows: `instanceOfMenu.copyWith(...)` or like so:`instanceOfMenu.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuCWProxy get copyWith => _$MenuCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Menu',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'menu_id',
        'name',
        'description',
        'sku',
        'price',
        'image_url',
        'track_stock',
        'stock_qty',
        'stock_alert',
        'stock_status',
        'is_active',
        'category',
        'created_at',
        'updated_at',
      ],
    );
    final val = Menu(
      menuId: $checkedConvert('menu_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String?),
      sku: $checkedConvert('sku', (v) => v as String?),
      price: $checkedConvert('price', (v) => (v as num).toInt()),
      imageUrl: $checkedConvert('image_url', (v) => v as String?),
      trackStock: $checkedConvert('track_stock', (v) => v as bool),
      stockQty: $checkedConvert('stock_qty', (v) => (v as num).toInt()),
      stockAlert: $checkedConvert('stock_alert', (v) => (v as num?)?.toInt()),
      stockStatus: $checkedConvert(
        'stock_status',
        (v) => $enumDecode(_$StockStatusEnumMap, v),
      ),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      category: $checkedConvert(
        'category',
        (v) => MenuCategory.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'menuId': 'menu_id',
    'imageUrl': 'image_url',
    'trackStock': 'track_stock',
    'stockQty': 'stock_qty',
    'stockAlert': 'stock_alert',
    'stockStatus': 'stock_status',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
  'menu_id': instance.menuId,
  'name': instance.name,
  'description': instance.description,
  'sku': instance.sku,
  'price': instance.price,
  'image_url': instance.imageUrl,
  'track_stock': instance.trackStock,
  'stock_qty': instance.stockQty,
  'stock_alert': instance.stockAlert,
  'stock_status': _$StockStatusEnumMap[instance.stockStatus]!,
  'is_active': instance.isActive,
  'category': instance.category.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$StockStatusEnumMap = {
  StockStatus.untracked: 'untracked',
  StockStatus.ok: 'ok',
  StockStatus.low: 'low',
  StockStatus.out_: 'out',
};
