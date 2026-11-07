// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_cashiers_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardCashiersInnerCWProxy {
  DashboardCashiersInner userId(String userId);

  DashboardCashiersInner name(String name);

  DashboardCashiersInner sales(int sales);

  DashboardCashiersInner transactions(int transactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardCashiersInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardCashiersInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardCashiersInner call({
    String userId,
    String name,
    int sales,
    int transactions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardCashiersInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardCashiersInner.copyWith.fieldName(...)`
class _$DashboardCashiersInnerCWProxyImpl
    implements _$DashboardCashiersInnerCWProxy {
  const _$DashboardCashiersInnerCWProxyImpl(this._value);

  final DashboardCashiersInner _value;

  @override
  DashboardCashiersInner userId(String userId) => this(userId: userId);

  @override
  DashboardCashiersInner name(String name) => this(name: name);

  @override
  DashboardCashiersInner sales(int sales) => this(sales: sales);

  @override
  DashboardCashiersInner transactions(int transactions) =>
      this(transactions: transactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardCashiersInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardCashiersInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardCashiersInner call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? sales = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardCashiersInner(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      sales: sales == const $CopyWithPlaceholder()
          ? _value.sales
          // ignore: cast_nullable_to_non_nullable
          : sales as int,
      transactions: transactions == const $CopyWithPlaceholder()
          ? _value.transactions
          // ignore: cast_nullable_to_non_nullable
          : transactions as int,
    );
  }
}

extension $DashboardCashiersInnerCopyWith on DashboardCashiersInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardCashiersInner.copyWith(...)` or like so:`instanceOfDashboardCashiersInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardCashiersInnerCWProxy get copyWith =>
      _$DashboardCashiersInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardCashiersInner _$DashboardCashiersInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DashboardCashiersInner', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['user_id', 'name', 'sales', 'transactions'],
  );
  final val = DashboardCashiersInner(
    userId: $checkedConvert('user_id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    sales: $checkedConvert('sales', (v) => (v as num).toInt()),
    transactions: $checkedConvert('transactions', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$DashboardCashiersInnerToJson(
  DashboardCashiersInner instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'name': instance.name,
  'sales': instance.sales,
  'transactions': instance.transactions,
};
