// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderPaymentCWProxy {
  OrderPayment method(PaymentMethod method);

  OrderPayment amount(int amount);

  OrderPayment received(int? received);

  OrderPayment change(int? change);

  OrderPayment status(OrderStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderPayment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderPayment(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderPayment call({
    PaymentMethod method,
    int amount,
    int? received,
    int? change,
    OrderStatus status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderPayment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderPayment.copyWith.fieldName(...)`
class _$OrderPaymentCWProxyImpl implements _$OrderPaymentCWProxy {
  const _$OrderPaymentCWProxyImpl(this._value);

  final OrderPayment _value;

  @override
  OrderPayment method(PaymentMethod method) => this(method: method);

  @override
  OrderPayment amount(int amount) => this(amount: amount);

  @override
  OrderPayment received(int? received) => this(received: received);

  @override
  OrderPayment change(int? change) => this(change: change);

  @override
  OrderPayment status(OrderStatus status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderPayment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderPayment(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderPayment call({
    Object? method = const $CopyWithPlaceholder(),
    Object? amount = const $CopyWithPlaceholder(),
    Object? received = const $CopyWithPlaceholder(),
    Object? change = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return OrderPayment(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as PaymentMethod,
      amount: amount == const $CopyWithPlaceholder()
          ? _value.amount
          // ignore: cast_nullable_to_non_nullable
          : amount as int,
      received: received == const $CopyWithPlaceholder()
          ? _value.received
          // ignore: cast_nullable_to_non_nullable
          : received as int?,
      change: change == const $CopyWithPlaceholder()
          ? _value.change
          // ignore: cast_nullable_to_non_nullable
          : change as int?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OrderStatus,
    );
  }
}

extension $OrderPaymentCopyWith on OrderPayment {
  /// Returns a callable class that can be used as follows: `instanceOfOrderPayment.copyWith(...)` or like so:`instanceOfOrderPayment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderPaymentCWProxy get copyWith => _$OrderPaymentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderPayment', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'method',
          'amount',
          'received',
          'change',
          'status',
        ],
      );
      final val = OrderPayment(
        method: $checkedConvert(
          'method',
          (v) => $enumDecode(_$PaymentMethodEnumMap, v),
        ),
        amount: $checkedConvert('amount', (v) => (v as num).toInt()),
        received: $checkedConvert('received', (v) => (v as num?)?.toInt()),
        change: $checkedConvert('change', (v) => (v as num?)?.toInt()),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$OrderStatusEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrderPaymentToJson(OrderPayment instance) =>
    <String, dynamic>{
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'amount': instance.amount,
      'received': instance.received,
      'change': instance.change,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qris: 'qris',
  PaymentMethod.debit: 'debit',
};

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.void_: 'void',
};
