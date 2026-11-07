// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_top_menus_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardTopMenusInnerCWProxy {
  DashboardTopMenusInner menuId(String menuId);

  DashboardTopMenusInner outletId(String outletId);

  DashboardTopMenusInner name(String name);

  DashboardTopMenusInner qty(int qty);

  DashboardTopMenusInner sales(int sales);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardTopMenusInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardTopMenusInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardTopMenusInner call({
    String menuId,
    String outletId,
    String name,
    int qty,
    int sales,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardTopMenusInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardTopMenusInner.copyWith.fieldName(...)`
class _$DashboardTopMenusInnerCWProxyImpl
    implements _$DashboardTopMenusInnerCWProxy {
  const _$DashboardTopMenusInnerCWProxyImpl(this._value);

  final DashboardTopMenusInner _value;

  @override
  DashboardTopMenusInner menuId(String menuId) => this(menuId: menuId);

  @override
  DashboardTopMenusInner outletId(String outletId) => this(outletId: outletId);

  @override
  DashboardTopMenusInner name(String name) => this(name: name);

  @override
  DashboardTopMenusInner qty(int qty) => this(qty: qty);

  @override
  DashboardTopMenusInner sales(int sales) => this(sales: sales);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardTopMenusInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardTopMenusInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardTopMenusInner call({
    Object? menuId = const $CopyWithPlaceholder(),
    Object? outletId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? sales = const $CopyWithPlaceholder(),
  }) {
    return DashboardTopMenusInner(
      menuId: menuId == const $CopyWithPlaceholder()
          ? _value.menuId
          // ignore: cast_nullable_to_non_nullable
          : menuId as String,
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
      sales: sales == const $CopyWithPlaceholder()
          ? _value.sales
          // ignore: cast_nullable_to_non_nullable
          : sales as int,
    );
  }
}

extension $DashboardTopMenusInnerCopyWith on DashboardTopMenusInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardTopMenusInner.copyWith(...)` or like so:`instanceOfDashboardTopMenusInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardTopMenusInnerCWProxy get copyWith =>
      _$DashboardTopMenusInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardTopMenusInner _$DashboardTopMenusInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DashboardTopMenusInner',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['menu_id', 'outlet_id', 'name', 'qty', 'sales'],
    );
    final val = DashboardTopMenusInner(
      menuId: $checkedConvert('menu_id', (v) => v as String),
      outletId: $checkedConvert('outlet_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      qty: $checkedConvert('qty', (v) => (v as num).toInt()),
      sales: $checkedConvert('sales', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'menuId': 'menu_id', 'outletId': 'outlet_id'},
);

Map<String, dynamic> _$DashboardTopMenusInnerToJson(
  DashboardTopMenusInner instance,
) => <String, dynamic>{
  'menu_id': instance.menuId,
  'outlet_id': instance.outletId,
  'name': instance.name,
  'qty': instance.qty,
  'sales': instance.sales,
};
