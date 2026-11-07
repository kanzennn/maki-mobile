// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_payment_methods_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardPaymentMethodsInnerCWProxy {
  DashboardPaymentMethodsInner method(String method);

  DashboardPaymentMethodsInner amount(int amount);

  DashboardPaymentMethodsInner transactions(int transactions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardPaymentMethodsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardPaymentMethodsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardPaymentMethodsInner call({
    String method,
    int amount,
    int transactions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardPaymentMethodsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardPaymentMethodsInner.copyWith.fieldName(...)`
class _$DashboardPaymentMethodsInnerCWProxyImpl
    implements _$DashboardPaymentMethodsInnerCWProxy {
  const _$DashboardPaymentMethodsInnerCWProxyImpl(this._value);

  final DashboardPaymentMethodsInner _value;

  @override
  DashboardPaymentMethodsInner method(String method) => this(method: method);

  @override
  DashboardPaymentMethodsInner amount(int amount) => this(amount: amount);

  @override
  DashboardPaymentMethodsInner transactions(int transactions) =>
      this(transactions: transactions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardPaymentMethodsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardPaymentMethodsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardPaymentMethodsInner call({
    Object? method = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? transactions = const $CopyWithPlaceholder(),
  }) {
    return DashboardPaymentMethodsInner(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as int,
      transactions: transactions == const $CopyWithPlaceholder()
          ? _value.transactions
          // ignore: cast_nullable_to_non_nullable
          : transactions as int,
    );
  }
}

extension $DashboardPaymentMethodsInnerCopyWith
    on DashboardPaymentMethodsInner {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardPaymentMethodsInner.copyWith(...)` or like so:`instanceOfDashboardPaymentMethodsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardPaymentMethodsInnerCWProxy get copyWith =>
      _$DashboardPaymentMethodsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardPaymentMethodsInner _$DashboardPaymentMethodsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DashboardPaymentMethodsInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['method', 'amount', 'transactions']);
  final val = DashboardPaymentMethodsInner(
    method: $checkedConvert('method', (v) => v as String),
    amount: $checkedConvert('amount', (v) => (v as num).toInt()),
    transactions: $checkedConvert('transactions', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$DashboardPaymentMethodsInnerToJson(
  DashboardPaymentMethodsInner instance,
) => <String, dynamic>{
  'method': instance.method,
  'amount': instance.amount,
  'transactions': instance.transactions,
};
