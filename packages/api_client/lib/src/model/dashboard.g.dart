// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardCWProxy {
  Dashboard from(DateTime from);

  Dashboard to(DateTime to);

  Dashboard previousFrom(DateTime previousFrom);

  Dashboard previousTo(DateTime previousTo);

  Dashboard summary(DashboardSummary summary);

  Dashboard days(List<DashboardDaysInner> days);

  Dashboard hours(List<DashboardHoursInner> hours);

  Dashboard outlets(List<DashboardOutletsInner> outlets);

  Dashboard paymentMethods(List<DashboardPaymentMethodsInner> paymentMethods);

  Dashboard topMenus(List<DashboardTopMenusInner> topMenus);

  Dashboard lowStock(List<DashboardLowStockInner> lowStock);

  Dashboard cashiers(List<DashboardCashiersInner> cashiers);

  Dashboard tables(List<DashboardTablesInner> tables);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Dashboard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Dashboard(...).copyWith(id: 12, name: "My name")
  /// ````
  Dashboard call({
    DateTime from,
    DateTime to,
    DateTime previousFrom,
    DateTime previousTo,
    DashboardSummary summary,
    List<DashboardDaysInner> days,
    List<DashboardHoursInner> hours,
    List<DashboardOutletsInner> outlets,
    List<DashboardPaymentMethodsInner> paymentMethods,
    List<DashboardTopMenusInner> topMenus,
    List<DashboardLowStockInner> lowStock,
    List<DashboardCashiersInner> cashiers,
    List<DashboardTablesInner> tables,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboard.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboard.copyWith.fieldName(...)`
class _$DashboardCWProxyImpl implements _$DashboardCWProxy {
  const _$DashboardCWProxyImpl(this._value);

  final Dashboard _value;

  @override
  Dashboard from(DateTime from) => this(from: from);

  @override
  Dashboard to(DateTime to) => this(to: to);

  @override
  Dashboard previousFrom(DateTime previousFrom) =>
      this(previousFrom: previousFrom);

  @override
  Dashboard previousTo(DateTime previousTo) => this(previousTo: previousTo);

  @override
  Dashboard summary(DashboardSummary summary) => this(summary: summary);

  @override
  Dashboard days(List<DashboardDaysInner> days) => this(days: days);

  @override
  Dashboard hours(List<DashboardHoursInner> hours) => this(hours: hours);

  @override
  Dashboard outlets(List<DashboardOutletsInner> outlets) =>
      this(outlets: outlets);

  @override
  Dashboard paymentMethods(List<DashboardPaymentMethodsInner> paymentMethods) =>
      this(paymentMethods: paymentMethods);

  @override
  Dashboard topMenus(List<DashboardTopMenusInner> topMenus) =>
      this(topMenus: topMenus);

  @override
  Dashboard lowStock(List<DashboardLowStockInner> lowStock) =>
      this(lowStock: lowStock);

  @override
  Dashboard cashiers(List<DashboardCashiersInner> cashiers) =>
      this(cashiers: cashiers);

  @override
  Dashboard tables(List<DashboardTablesInner> tables) => this(tables: tables);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Dashboard(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Dashboard(...).copyWith(id: 12, name: "My name")
  /// ````
  Dashboard call({
    Object? from = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
    Object? previousFrom = const $CopyWithPlaceholder(),
    Object? previousTo = const $CopyWithPlaceholder(),
    Object? summary = const $CopyWithPlaceholder(),
    Object? days = const $CopyWithPlaceholder(),
    Object? hours = const $CopyWithPlaceholder(),
    Object? outlets = const $CopyWithPlaceholder(),
    Object? paymentMethods = const $CopyWithPlaceholder(),
    Object? topMenus = const $CopyWithPlaceholder(),
    Object? lowStock = const $CopyWithPlaceholder(),
    Object? cashiers = const $CopyWithPlaceholder(),
    Object? tables = const $CopyWithPlaceholder(),
  }) {
    return Dashboard(
      from: from == const $CopyWithPlaceholder()
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as DateTime,
      to: to == const $CopyWithPlaceholder()
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as DateTime,
      previousFrom: previousFrom == const $CopyWithPlaceholder()
          ? _value.previousFrom
          // ignore: cast_nullable_to_non_nullable
          : previousFrom as DateTime,
      previousTo: previousTo == const $CopyWithPlaceholder()
          ? _value.previousTo
          // ignore: cast_nullable_to_non_nullable
          : previousTo as DateTime,
      summary: summary == const $CopyWithPlaceholder()
          ? _value.summary
          // ignore: cast_nullable_to_non_nullable
          : summary as DashboardSummary,
      days: days == const $CopyWithPlaceholder()
          ? _value.days
          // ignore: cast_nullable_to_non_nullable
          : days as List<DashboardDaysInner>,
      hours: hours == const $CopyWithPlaceholder()
          ? _value.hours
          // ignore: cast_nullable_to_non_nullable
          : hours as List<DashboardHoursInner>,
      outlets: outlets == const $CopyWithPlaceholder()
          ? _value.outlets
          // ignore: cast_nullable_to_non_nullable
          : outlets as List<DashboardOutletsInner>,
      paymentMethods: paymentMethods == const $CopyWithPlaceholder()
          ? _value.paymentMethods
          // ignore: cast_nullable_to_non_nullable
          : paymentMethods as List<DashboardPaymentMethodsInner>,
      topMenus: topMenus == const $CopyWithPlaceholder()
          ? _value.topMenus
          // ignore: cast_nullable_to_non_nullable
          : topMenus as List<DashboardTopMenusInner>,
      lowStock: lowStock == const $CopyWithPlaceholder()
          ? _value.lowStock
          // ignore: cast_nullable_to_non_nullable
          : lowStock as List<DashboardLowStockInner>,
      cashiers: cashiers == const $CopyWithPlaceholder()
          ? _value.cashiers
          // ignore: cast_nullable_to_non_nullable
          : cashiers as List<DashboardCashiersInner>,
      tables: tables == const $CopyWithPlaceholder()
          ? _value.tables
          // ignore: cast_nullable_to_non_nullable
          : tables as List<DashboardTablesInner>,
    );
  }
}

extension $DashboardCopyWith on Dashboard {
  /// Returns a callable class that can be used as follows: `instanceOfDashboard.copyWith(...)` or like so:`instanceOfDashboard.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardCWProxy get copyWith => _$DashboardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Dashboard',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'from',
        'to',
        'previous_from',
        'previous_to',
        'summary',
        'days',
        'hours',
        'outlets',
        'payment_methods',
        'top_menus',
        'low_stock',
        'cashiers',
        'tables',
      ],
    );
    final val = Dashboard(
      from: $checkedConvert('from', (v) => DateTime.parse(v as String)),
      to: $checkedConvert('to', (v) => DateTime.parse(v as String)),
      previousFrom: $checkedConvert(
        'previous_from',
        (v) => DateTime.parse(v as String),
      ),
      previousTo: $checkedConvert(
        'previous_to',
        (v) => DateTime.parse(v as String),
      ),
      summary: $checkedConvert(
        'summary',
        (v) => DashboardSummary.fromJson(v as Map<String, dynamic>),
      ),
      days: $checkedConvert(
        'days',
        (v) => (v as List<dynamic>)
            .map((e) => DashboardDaysInner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      hours: $checkedConvert(
        'hours',
        (v) => (v as List<dynamic>)
            .map((e) => DashboardHoursInner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      outlets: $checkedConvert(
        'outlets',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardOutletsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      paymentMethods: $checkedConvert(
        'payment_methods',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardPaymentMethodsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      topMenus: $checkedConvert(
        'top_menus',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardTopMenusInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      lowStock: $checkedConvert(
        'low_stock',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardLowStockInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      cashiers: $checkedConvert(
        'cashiers',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardCashiersInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      tables: $checkedConvert(
        'tables',
        (v) => (v as List<dynamic>)
            .map(
              (e) => DashboardTablesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'previousFrom': 'previous_from',
    'previousTo': 'previous_to',
    'paymentMethods': 'payment_methods',
    'topMenus': 'top_menus',
    'lowStock': 'low_stock',
  },
);

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
  'from': instance.from.toIso8601String(),
  'to': instance.to.toIso8601String(),
  'previous_from': instance.previousFrom.toIso8601String(),
  'previous_to': instance.previousTo.toIso8601String(),
  'summary': instance.summary.toJson(),
  'days': instance.days.map((e) => e.toJson()).toList(),
  'hours': instance.hours.map((e) => e.toJson()).toList(),
  'outlets': instance.outlets.map((e) => e.toJson()).toList(),
  'payment_methods': instance.paymentMethods.map((e) => e.toJson()).toList(),
  'top_menus': instance.topMenus.map((e) => e.toJson()).toList(),
  'low_stock': instance.lowStock.map((e) => e.toJson()).toList(),
  'cashiers': instance.cashiers.map((e) => e.toJson()).toList(),
  'tables': instance.tables.map((e) => e.toJson()).toList(),
};
