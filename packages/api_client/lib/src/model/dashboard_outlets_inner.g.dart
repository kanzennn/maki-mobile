// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_outlets_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardOutletsInnerCWProxy {
  DashboardOutletsInner outletId(String outletId);

  DashboardOutletsInner code(String code);

  DashboardOutletsInner name(String name);

  DashboardOutletsInner sales(int sales);

  DashboardOutletsInner transactions(int transactions);

  DashboardOutletsInner previousSales(int previousSales);

  DashboardOutletsInner previousTransactions(int previousTransactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardOutletsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardOutletsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardOutletsInner call({
    String outletId,
    String code,
    String name,
    int sales,
    int transactions,
    int previousSales,
    int previousTransactions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardOutletsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardOutletsInner.copyWith.fieldName(...)`
class _$DashboardOutletsInnerCWProxyImpl
    implements _$DashboardOutletsInnerCWProxy {
  const _$DashboardOutletsInnerCWProxyImpl(this._value);

  final DashboardOutletsInner _value;

  @override
  DashboardOutletsInner outletId(String outletId) => this(outletId: outletId);

  @override
  DashboardOutletsInner code(String code) => this(code: code);

  @override
  DashboardOutletsInner name(String name) => this(name: name);

  @override
  DashboardOutletsInner sales(int sales) => this(sales: sales);

  @override
  DashboardOutletsInner transactions(int transactions) =>
      this(transactions: transactions);

  @override
  DashboardOutletsInner previousSales(int previousSales) =>
      this(previousSales: previousSales);

  @override
  DashboardOutletsInner previousTransactions(int previousTransactions) =>
      this(previousTransactions: previousTransactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardOutletsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardOutletsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardOutletsInner call({
    Object? outletId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? sales = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
    Object? previousSales = const $CopyWithPlaceholder(),
    Object? previousTransactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardOutletsInner(
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
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
      previousSales: previousSales == const $CopyWithPlaceholder()
          ? _value.previousSales
          // ignore: cast_nullable_to_non_nullable
          : previousSales as int,
      previousTransactions: previousTransactions == const $CopyWithPlaceholder()
          ? _value.previousTransactions
          // ignore: cast_nullable_to_non_nullable
          : previousTransactions as int,
    );
  }
}

extension $DashboardOutletsInnerCopyWith on DashboardOutletsInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardOutletsInner.copyWith(...)` or like so:`instanceOfDashboardOutletsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardOutletsInnerCWProxy get copyWith =>
      _$DashboardOutletsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardOutletsInner _$DashboardOutletsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'DashboardOutletsInner',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'outlet_id',
        'code',
        'name',
        'sales',
        'transactions',
        'previous_sales',
        'previous_transactions',
      ],
    );
    final val = DashboardOutletsInner(
      outletId: $checkedConvert('outlet_id', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      sales: $checkedConvert('sales', (v) => (v as num).toInt()),
      transactions: $checkedConvert('transactions', (v) => (v as num).toInt()),
      previousSales: $checkedConvert(
        'previous_sales',
        (v) => (v as num).toInt(),
      ),
      previousTransactions: $checkedConvert(
        'previous_transactions',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'outletId': 'outlet_id',
    'previousSales': 'previous_sales',
    'previousTransactions': 'previous_transactions',
  },
);

Map<String, dynamic> _$DashboardOutletsInnerToJson(
  DashboardOutletsInner instance,
) => <String, dynamic>{
  'outlet_id': instance.outletId,
  'code': instance.code,
  'name': instance.name,
  'sales': instance.sales,
  'transactions': instance.transactions,
  'previous_sales': instance.previousSales,
  'previous_transactions': instance.previousTransactions,
};
