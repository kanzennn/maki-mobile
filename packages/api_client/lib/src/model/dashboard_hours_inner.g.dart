// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_hours_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardHoursInnerCWProxy {
  DashboardHoursInner hour(int hour);

  DashboardHoursInner sales(int sales);

  DashboardHoursInner transactions(int transactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardHoursInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardHoursInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardHoursInner call({int hour, int sales, int transactions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardHoursInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardHoursInner.copyWith.fieldName(...)`
class _$DashboardHoursInnerCWProxyImpl implements _$DashboardHoursInnerCWProxy {
  const _$DashboardHoursInnerCWProxyImpl(this._value);

  final DashboardHoursInner _value;

  @override
  DashboardHoursInner hour(int hour) => this(hour: hour);

  @override
  DashboardHoursInner sales(int sales) => this(sales: sales);

  @override
  DashboardHoursInner transactions(int transactions) =>
      this(transactions: transactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardHoursInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardHoursInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardHoursInner call({
    Object? hour = const $CopyWithPlaceholder(),
    Object? sales = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardHoursInner(
      hour: hour == const $CopyWithPlaceholder()
          ? _value.hour
          // ignore: cast_nullable_to_non_nullable
          : hour as int,
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

extension $DashboardHoursInnerCopyWith on DashboardHoursInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardHoursInner.copyWith(...)` or like so:`instanceOfDashboardHoursInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardHoursInnerCWProxy get copyWith =>
      _$DashboardHoursInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardHoursInner _$DashboardHoursInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DashboardHoursInner', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['hour', 'sales', 'transactions']);
      final val = DashboardHoursInner(
        hour: $checkedConvert('hour', (v) => (v as num).toInt()),
        sales: $checkedConvert('sales', (v) => (v as num).toInt()),
        transactions: $checkedConvert(
          'transactions',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DashboardHoursInnerToJson(
  DashboardHoursInner instance,
) => <String, dynamic>{
  'hour': instance.hour,
  'sales': instance.sales,
  'transactions': instance.transactions,
};
