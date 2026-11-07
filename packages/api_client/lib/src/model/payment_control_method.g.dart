// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_control_method.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentControlMethodCWProxy {
  PaymentControlMethod method(PaymentControlMethodMethodEnum method);

  PaymentControlMethod isEnabled(bool isEnabled);

  PaymentControlMethod available(bool available);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentControlMethod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentControlMethod(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentControlMethod call({
    PaymentControlMethodMethodEnum method,
    bool isEnabled,
    bool available,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentControlMethod.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentControlMethod.copyWith.fieldName(...)`
class _$PaymentControlMethodCWProxyImpl
    implements _$PaymentControlMethodCWProxy {
  const _$PaymentControlMethodCWProxyImpl(this._value);

  final PaymentControlMethod _value;

  @override
  PaymentControlMethod method(PaymentControlMethodMethodEnum method) =>
      this(method: method);

  @override
  PaymentControlMethod isEnabled(bool isEnabled) => this(isEnabled: isEnabled);

  @override
  PaymentControlMethod available(bool available) => this(available: available);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentControlMethod(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentControlMethod(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentControlMethod call({
    Object? method = const $CopyWithPlaceholder(),
    Object? isEnabled = const $CopyWithPlaceholder(),
    Object? available = const $CopyWithPlaceholder(),
  }) {
    return PaymentControlMethod(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as PaymentControlMethodMethodEnum,
      isEnabled: isEnabled == const $CopyWithPlaceholder()
          ? _value.isEnabled
          // ignore: cast_nullable_to_non_nullable
          : isEnabled as bool,
      available: available == const $CopyWithPlaceholder()
          ? _value.available
          // ignore: cast_nullable_to_non_nullable
          : available as bool,
    );
  }
}

extension $PaymentControlMethodCopyWith on PaymentControlMethod {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentControlMethod.copyWith(...)` or like so:`instanceOfPaymentControlMethod.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentControlMethodCWProxy get copyWith =>
      _$PaymentControlMethodCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentControlMethod _$PaymentControlMethodFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PaymentControlMethod', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['method', 'is_enabled', 'available']);
  final val = PaymentControlMethod(
    method: $checkedConvert(
      'method',
      (v) => $enumDecode(_$PaymentControlMethodMethodEnumEnumMap, v),
    ),
    isEnabled: $checkedConvert('is_enabled', (v) => v as bool),
    available: $checkedConvert('available', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'isEnabled': 'is_enabled'});

Map<String, dynamic> _$PaymentControlMethodToJson(
  PaymentControlMethod instance,
) => <String, dynamic>{
  'method': _$PaymentControlMethodMethodEnumEnumMap[instance.method]!,
  'is_enabled': instance.isEnabled,
  'available': instance.available,
};

const _$PaymentControlMethodMethodEnumEnumMap = {
  PaymentControlMethodMethodEnum.cash: 'cash',
  PaymentControlMethodMethodEnum.qris: 'qris',
  PaymentControlMethodMethodEnum.debit: 'debit',
};
