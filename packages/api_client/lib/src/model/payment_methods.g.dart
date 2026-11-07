// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaymentMethodsCWProxy {
  PaymentMethods methods(List<PaymentControlMethod> methods);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentMethods(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentMethods(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentMethods call({List<PaymentControlMethod> methods});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaymentMethods.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaymentMethods.copyWith.fieldName(...)`
class _$PaymentMethodsCWProxyImpl implements _$PaymentMethodsCWProxy {
  const _$PaymentMethodsCWProxyImpl(this._value);

  final PaymentMethods _value;

  @override
  PaymentMethods methods(List<PaymentControlMethod> methods) =>
      this(methods: methods);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaymentMethods(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaymentMethods(...).copyWith(id: 12, name: "My name")
  /// ````
  PaymentMethods call({Object? methods = const $CopyWithPlaceholder()}) {
    return PaymentMethods(
      methods: methods == const $CopyWithPlaceholder()
          ? _value.methods
          // ignore: cast_nullable_to_non_nullable
          : methods as List<PaymentControlMethod>,
    );
  }
}

extension $PaymentMethodsCopyWith on PaymentMethods {
  /// Returns a callable class that can be used as follows: `instanceOfPaymentMethods.copyWith(...)` or like so:`instanceOfPaymentMethods.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaymentMethodsCWProxy get copyWith => _$PaymentMethodsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethods _$PaymentMethodsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaymentMethods', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['methods']);
      final val = PaymentMethods(
        methods: $checkedConvert(
          'methods',
          (v) => (v as List<dynamic>)
              .map(
                (e) => PaymentControlMethod.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PaymentMethodsToJson(PaymentMethods instance) =>
    <String, dynamic>{
      'methods': instance.methods.map((e) => e.toJson()).toList(),
    };
