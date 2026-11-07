// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_tables_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardTablesInnerCWProxy {
  DashboardTablesInner tableId(String tableId);

  DashboardTablesInner name(String name);

  DashboardTablesInner areaName(String areaName);

  DashboardTablesInner orders(int orders);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardTablesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardTablesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardTablesInner call({
    String tableId,
    String name,
    String areaName,
    int orders,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardTablesInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardTablesInner.copyWith.fieldName(...)`
class _$DashboardTablesInnerCWProxyImpl
    implements _$DashboardTablesInnerCWProxy {
  const _$DashboardTablesInnerCWProxyImpl(this._value);

  final DashboardTablesInner _value;

  @override
  DashboardTablesInner tableId(String tableId) => this(tableId: tableId);

  @override
  DashboardTablesInner name(String name) => this(name: name);

  @override
  DashboardTablesInner areaName(String areaName) => this(areaName: areaName);

  @override
  DashboardTablesInner orders(int orders) => this(orders: orders);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardTablesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardTablesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardTablesInner call({
    Object? tableId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? areaName = const $CopyWithPlaceholder(),
    Object? orders = const $CopyWithPlaceholder(),
  }) {
    return DashboardTablesInner(
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      areaName: areaName == const $CopyWithPlaceholder()
          ? _value.areaName
          // ignore: cast_nullable_to_non_nullable
          : areaName as String,
      orders: orders == const $CopyWithPlaceholder()
          ? _value.orders
          // ignore: cast_nullable_to_non_nullable
          : orders as int,
    );
  }
}

extension $DashboardTablesInnerCopyWith on DashboardTablesInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardTablesInner.copyWith(...)` or like so:`instanceOfDashboardTablesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardTablesInnerCWProxy get copyWith =>
      _$DashboardTablesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardTablesInner _$DashboardTablesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DashboardTablesInner',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['table_id', 'name', 'area_name', 'orders'],
    );
    final val = DashboardTablesInner(
      tableId: $checkedConvert('table_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      areaName: $checkedConvert('area_name', (v) => v as String),
      orders: $checkedConvert('orders', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'tableId': 'table_id', 'areaName': 'area_name'},
);

Map<String, dynamic> _$DashboardTablesInnerToJson(
  DashboardTablesInner instance,
) => <String, dynamic>{
  'table_id': instance.tableId,
  'name': instance.name,
  'area_name': instance.areaName,
  'orders': instance.orders,
};
