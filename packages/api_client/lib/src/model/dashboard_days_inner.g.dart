// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_days_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardDaysInnerCWProxy {
  DashboardDaysInner date(DateTime date);

  DashboardDaysInner sales(int sales);

  DashboardDaysInner transactions(int transactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardDaysInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardDaysInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardDaysInner call({DateTime date, int sales, int transactions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardDaysInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardDaysInner.copyWith.fieldName(...)`
class _$DashboardDaysInnerCWProxyImpl implements _$DashboardDaysInnerCWProxy {
  const _$DashboardDaysInnerCWProxyImpl(this._value);

  final DashboardDaysInner _value;

  @override
  DashboardDaysInner date(DateTime date) => this(date: date);

  @override
  DashboardDaysInner sales(int sales) => this(sales: sales);

  @override
  DashboardDaysInner transactions(int transactions) =>
      this(transactions: transactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardDaysInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardDaysInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardDaysInner call({
    Object? date = const $CopyWithPlaceholder(),
    Object? sales = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardDaysInner(
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
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

extension $DashboardDaysInnerCopyWith on DashboardDaysInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardDaysInner.copyWith(...)` or like so:`instanceOfDashboardDaysInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardDaysInnerCWProxy get copyWith =>
      _$DashboardDaysInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDaysInner _$DashboardDaysInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DashboardDaysInner', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['date', 'sales', 'transactions']);
      final val = DashboardDaysInner(
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        sales: $checkedConvert('sales', (v) => (v as num).toInt()),
        transactions: $checkedConvert(
          'transactions',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DashboardDaysInnerToJson(DashboardDaysInner instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'sales': instance.sales,
      'transactions': instance.transactions,
    };
