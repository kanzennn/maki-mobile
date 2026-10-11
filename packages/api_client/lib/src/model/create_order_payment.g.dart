// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_payment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateOrderPaymentCWProxy {
  CreateOrderPayment method(PaymentMethod method);

  CreateOrderPayment received(int? received);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderPayment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderPayment(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderPayment call({PaymentMethod method, int? received});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateOrderPayment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateOrderPayment.copyWith.fieldName(...)`
class _$CreateOrderPaymentCWProxyImpl implements _$CreateOrderPaymentCWProxy {
  const _$CreateOrderPaymentCWProxyImpl(this._value);

  final CreateOrderPayment _value;

  @override
  CreateOrderPayment method(PaymentMethod method) => this(method: method);

  @override
  CreateOrderPayment received(int? received) => this(received: received);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderPayment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderPayment(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderPayment call({
    Object? method = const $CopyWithPlaceholder(),
    Object? received = const $CopyWithPlaceholder(),
  }) {
    return CreateOrderPayment(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as PaymentMethod,
      received: received == const $CopyWithPlaceholder()
          ? _value.received
          // ignore: cast_nullable_to_non_nullable
          : received as int?,
    );
  }
}

extension $CreateOrderPaymentCopyWith on CreateOrderPayment {
  /// Returns a callable class that can be used as follows: `instanceOfCreateOrderPayment.copyWith(...)` or like so:`instanceOfCreateOrderPayment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateOrderPaymentCWProxy get copyWith =>
      _$CreateOrderPaymentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderPayment _$CreateOrderPaymentFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateOrderPayment', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['method']);
      final val = CreateOrderPayment(
        method: $checkedConvert(
          'method',
          (v) => $enumDecode(_$PaymentMethodEnumMap, v),
        ),
        received: $checkedConvert('received', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$CreateOrderPaymentToJson(CreateOrderPayment instance) =>
    <String, dynamic>{
      'method': _$PaymentMethodEnumMap[instance.method]!,
      'received': ?instance.received,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qris: 'qris',
  PaymentMethod.debit: 'debit',
};
