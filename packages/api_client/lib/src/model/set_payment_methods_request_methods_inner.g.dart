// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_payment_methods_request_methods_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetPaymentMethodsRequestMethodsInnerCWProxy {
  SetPaymentMethodsRequestMethodsInner method(String method);

  SetPaymentMethodsRequestMethodsInner isEnabled(bool isEnabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPaymentMethodsRequestMethodsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPaymentMethodsRequestMethodsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPaymentMethodsRequestMethodsInner call({String method, bool isEnabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetPaymentMethodsRequestMethodsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetPaymentMethodsRequestMethodsInner.copyWith.fieldName(...)`
class _$SetPaymentMethodsRequestMethodsInnerCWProxyImpl
    implements _$SetPaymentMethodsRequestMethodsInnerCWProxy {
  const _$SetPaymentMethodsRequestMethodsInnerCWProxyImpl(this._value);

  final SetPaymentMethodsRequestMethodsInner _value;

  @override
  SetPaymentMethodsRequestMethodsInner method(String method) =>
      this(method: method);

  @override
  SetPaymentMethodsRequestMethodsInner isEnabled(bool isEnabled) =>
      this(isEnabled: isEnabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPaymentMethodsRequestMethodsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPaymentMethodsRequestMethodsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPaymentMethodsRequestMethodsInner call({
    Object? method = const $CopyWithPlaceholder(),
    Object? isEnabled = const $CopyWithPlaceholder(),
  }) {
    return SetPaymentMethodsRequestMethodsInner(
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as String,
      isEnabled: isEnabled == const $CopyWithPlaceholder()
          ? _value.isEnabled
          // ignore: cast_nullable_to_non_nullable
          : isEnabled as bool,
    );
  }
}

extension $SetPaymentMethodsRequestMethodsInnerCopyWith
    on SetPaymentMethodsRequestMethodsInner {
  /// Returns a callable class that can be used as follows: `instanceOfSetPaymentMethodsRequestMethodsInner.copyWith(...)` or like so:`instanceOfSetPaymentMethodsRequestMethodsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetPaymentMethodsRequestMethodsInnerCWProxy get copyWith =>
      _$SetPaymentMethodsRequestMethodsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPaymentMethodsRequestMethodsInner
_$SetPaymentMethodsRequestMethodsInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SetPaymentMethodsRequestMethodsInner',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['method', 'is_enabled']);
        final val = SetPaymentMethodsRequestMethodsInner(
          method: $checkedConvert('method', (v) => v as String),
          isEnabled: $checkedConvert('is_enabled', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'isEnabled': 'is_enabled'},
    );

Map<String, dynamic> _$SetPaymentMethodsRequestMethodsInnerToJson(
  SetPaymentMethodsRequestMethodsInner instance,
) => <String, dynamic>{
  'method': instance.method,
  'is_enabled': instance.isEnabled,
};
