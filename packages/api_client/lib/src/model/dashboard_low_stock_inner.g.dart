// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_low_stock_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardLowStockInnerCWProxy {
  DashboardLowStockInner menuId(String menuId);

  DashboardLowStockInner outletId(String outletId);

  DashboardLowStockInner outletName(String outletName);

  DashboardLowStockInner name(String name);

  DashboardLowStockInner stockQty(int stockQty);

  DashboardLowStockInner stockAlert(int? stockAlert);

  DashboardLowStockInner stockStatus(
    DashboardLowStockInnerStockStatusEnum stockStatus,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardLowStockInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardLowStockInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardLowStockInner call({
    String menuId,
    String outletId,
    String outletName,
    String name,
    int stockQty,
    int? stockAlert,
    DashboardLowStockInnerStockStatusEnum stockStatus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardLowStockInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardLowStockInner.copyWith.fieldName(...)`
class _$DashboardLowStockInnerCWProxyImpl
    implements _$DashboardLowStockInnerCWProxy {
  const _$DashboardLowStockInnerCWProxyImpl(this._value);

  final DashboardLowStockInner _value;

  @override
  DashboardLowStockInner menuId(String menuId) => this(menuId: menuId);

  @override
  DashboardLowStockInner outletId(String outletId) => this(outletId: outletId);

  @override
  DashboardLowStockInner outletName(String outletName) =>
      this(outletName: outletName);

  @override
  DashboardLowStockInner name(String name) => this(name: name);

  @override
  DashboardLowStockInner stockQty(int stockQty) => this(stockQty: stockQty);

  @override
  DashboardLowStockInner stockAlert(int? stockAlert) =>
      this(stockAlert: stockAlert);

  @override
  DashboardLowStockInner stockStatus(
    DashboardLowStockInnerStockStatusEnum stockStatus,
  ) => this(stockStatus: stockStatus);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardLowStockInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardLowStockInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardLowStockInner call({
    Object? menuId = const $CopyWithPlaceholder(),
    Object? outletId = const $CopyWithPlaceholder(),
    Object? outletName = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? stockQty = const $CopyWithPlaceholder(),
    Object? stockAlert = const $CopyWithPlaceholder(),
    Object? stockStatus = const $CopyWithPlaceholder(),
  }) {
    return DashboardLowStockInner(
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String,
      outletName: outletName == const $CopyWithPlaceholder()
          ? _value.outletName
          // ignore: cast_nullable_to_non_nullable
          : outletName as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
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
          : stockStatus as DashboardLowStockInnerStockStatusEnum,
    );
  }
}

extension $DashboardLowStockInnerCopyWith on DashboardLowStockInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardLowStockInner.copyWith(...)` or like so:`instanceOfDashboardLowStockInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardLowStockInnerCWProxy get copyWith =>
      _$DashboardLowStockInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardLowStockInner _$DashboardLowStockInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DashboardLowStockInner',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'menu_id',
        'outlet_id',
        'outlet_name',
        'name',
        'stock_qty',
        'stock_alert',
        'stock_status',
      ],
    );
    final val = DashboardLowStockInner(
      menuId: $checkedConvert('menu_id', (v) => v as String),
      outletId: $checkedConvert('outlet_id', (v) => v as String),
      outletName: $checkedConvert('outlet_name', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      stockQty: $checkedConvert('stock_qty', (v) => (v as num).toInt()),
      stockAlert: $checkedConvert('stock_alert', (v) => (v as num?)?.toInt()),
      stockStatus: $checkedConvert(
        'stock_status',
        (v) => $enumDecode(_$DashboardLowStockInnerStockStatusEnumEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'menuId': 'menu_id',
    'outletId': 'outlet_id',
    'outletName': 'outlet_name',
    'stockQty': 'stock_qty',
    'stockAlert': 'stock_alert',
    'stockStatus': 'stock_status',
  },
);

Map<String, dynamic> _$DashboardLowStockInnerToJson(
  DashboardLowStockInner instance,
) => <String, dynamic>{
  'menu_id': instance.menuId,
  'outlet_id': instance.outletId,
  'outlet_name': instance.outletName,
  'name': instance.name,
  'stock_qty': instance.stockQty,
  'stock_alert': instance.stockAlert,
  'stock_status':
      _$DashboardLowStockInnerStockStatusEnumEnumMap[instance.stockStatus]!,
};

const _$DashboardLowStockInnerStockStatusEnumEnumMap = {
  DashboardLowStockInnerStockStatusEnum.low: 'low',
  DashboardLowStockInnerStockStatusEnum.out_: 'out',
};
