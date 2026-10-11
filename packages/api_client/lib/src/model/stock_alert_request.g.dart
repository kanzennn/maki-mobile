// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_alert_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockAlertRequestCWProxy {
  StockAlertRequest stockAlert(int? stockAlert);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockAlertRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockAlertRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  StockAlertRequest call({int? stockAlert});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockAlertRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockAlertRequest.copyWith.fieldName(...)`
class _$StockAlertRequestCWProxyImpl implements _$StockAlertRequestCWProxy {
  const _$StockAlertRequestCWProxyImpl(this._value);

  final StockAlertRequest _value;

  @override
  StockAlertRequest stockAlert(int? stockAlert) => this(stockAlert: stockAlert);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockAlertRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockAlertRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  StockAlertRequest call({Object? stockAlert = const $CopyWithPlaceholder()}) {
    return StockAlertRequest(
      stockAlert: stockAlert == const $CopyWithPlaceholder()
          ? _value.stockAlert
          // ignore: cast_nullable_to_non_nullable
          : stockAlert as int?,
    );
  }
}

extension $StockAlertRequestCopyWith on StockAlertRequest {
  /// Returns a callable class that can be used as follows: `instanceOfStockAlertRequest.copyWith(...)` or like so:`instanceOfStockAlertRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockAlertRequestCWProxy get copyWith =>
      _$StockAlertRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockAlertRequest _$StockAlertRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StockAlertRequest', json, ($checkedConvert) {
      final val = StockAlertRequest(
        stockAlert: $checkedConvert('stock_alert', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'stockAlert': 'stock_alert'});

Map<String, dynamic> _$StockAlertRequestToJson(StockAlertRequest instance) =>
    <String, dynamic>{'stock_alert': ?instance.stockAlert};
