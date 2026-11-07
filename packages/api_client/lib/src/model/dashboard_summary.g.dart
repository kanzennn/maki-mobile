// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardSummaryCWProxy {
  DashboardSummary sales(int sales);

  DashboardSummary transactions(int transactions);

  DashboardSummary averageTransaction(int averageTransaction);

  DashboardSummary itemsSold(int itemsSold);

  DashboardSummary voidCount(int voidCount);

  DashboardSummary voidTotal(int voidTotal);

  DashboardSummary previousSales(int previousSales);

  DashboardSummary previousTransactions(int previousTransactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardSummary call({
    int sales,
    int transactions,
    int averageTransaction,
    int itemsSold,
    int voidCount,
    int voidTotal,
    int previousSales,
    int previousTransactions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardSummary.copyWith.fieldName(...)`
class _$DashboardSummaryCWProxyImpl implements _$DashboardSummaryCWProxy {
  const _$DashboardSummaryCWProxyImpl(this._value);

  final DashboardSummary _value;

  @override
  DashboardSummary sales(int sales) => this(sales: sales);

  @override
  DashboardSummary transactions(int transactions) =>
      this(transactions: transactions);

  @override
  DashboardSummary averageTransaction(int averageTransaction) =>
      this(averageTransaction: averageTransaction);

  @override
  DashboardSummary itemsSold(int itemsSold) => this(itemsSold: itemsSold);

  @override
  DashboardSummary voidCount(int voidCount) => this(voidCount: voidCount);

  @override
  DashboardSummary voidTotal(int voidTotal) => this(voidTotal: voidTotal);

  @override
  DashboardSummary previousSales(int previousSales) =>
      this(previousSales: previousSales);

  @override
  DashboardSummary previousTransactions(int previousTransactions) =>
      this(previousTransactions: previousTransactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardSummary call({
    Object? sales = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
    Object? averageTransaction = const $CopyWithPlaceholder(),
    Object? itemsSold = const $CopyWithPlaceholder(),
    Object? voidCount = const $CopyWithPlaceholder(),
    Object? voidTotal = const $CopyWithPlaceholder(),
    Object? previousSales = const $CopyWithPlaceholder(),
    Object? previousTransactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardSummary(
      sales: sales == const $CopyWithPlaceholder()
          ? _value.sales
          // ignore: cast_nullable_to_non_nullable
          : sales as int,
      transactions: transactions == const $CopyWithPlaceholder()
          ? _value.transactions
          // ignore: cast_nullable_to_non_nullable
          : transactions as int,
      averageTransaction: averageTransaction == const $CopyWithPlaceholder()
          ? _value.averageTransaction
          // ignore: cast_nullable_to_non_nullable
          : averageTransaction as int,
      itemsSold: itemsSold == const $CopyWithPlaceholder()
          ? _value.itemsSold
          // ignore: cast_nullable_to_non_nullable
          : itemsSold as int,
      voidCount: voidCount == const $CopyWithPlaceholder()
          ? _value.voidCount
          // ignore: cast_nullable_to_non_nullable
          : voidCount as int,
      voidTotal: voidTotal == const $CopyWithPlaceholder()
          ? _value.voidTotal
          // ignore: cast_nullable_to_non_nullable
          : voidTotal as int,
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

extension $DashboardSummaryCopyWith on DashboardSummary {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardSummary.copyWith(...)` or like so:`instanceOfDashboardSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardSummaryCWProxy get copyWith => _$DashboardSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DashboardSummary',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'sales',
            'transactions',
            'average_transaction',
            'items_sold',
            'void_count',
            'void_total',
            'previous_sales',
            'previous_transactions',
          ],
        );
        final val = DashboardSummary(
          sales: $checkedConvert('sales', (v) => (v as num).toInt()),
          transactions: $checkedConvert(
            'transactions',
            (v) => (v as num).toInt(),
          ),
          averageTransaction: $checkedConvert(
            'average_transaction',
            (v) => (v as num).toInt(),
          ),
          itemsSold: $checkedConvert('items_sold', (v) => (v as num).toInt()),
          voidCount: $checkedConvert('void_count', (v) => (v as num).toInt()),
          voidTotal: $checkedConvert('void_total', (v) => (v as num).toInt()),
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
        'averageTransaction': 'average_transaction',
        'itemsSold': 'items_sold',
        'voidCount': 'void_count',
        'voidTotal': 'void_total',
        'previousSales': 'previous_sales',
        'previousTransactions': 'previous_transactions',
      },
    );

Map<String, dynamic> _$DashboardSummaryToJson(DashboardSummary instance) =>
    <String, dynamic>{
      'sales': instance.sales,
      'transactions': instance.transactions,
      'average_transaction': instance.averageTransaction,
      'items_sold': instance.itemsSold,
      'void_count': instance.voidCount,
      'void_total': instance.voidTotal,
      'previous_sales': instance.previousSales,
      'previous_transactions': instance.previousTransactions,
    };
