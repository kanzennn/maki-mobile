// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_payment_methods_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetPaymentMethodsRequestCWProxy {
  SetPaymentMethodsRequest methods(
    List<SetPaymentMethodsRequestMethodsInner> methods,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPaymentMethodsRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPaymentMethodsRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPaymentMethodsRequest call({
    List<SetPaymentMethodsRequestMethodsInner> methods,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetPaymentMethodsRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetPaymentMethodsRequest.copyWith.fieldName(...)`
class _$SetPaymentMethodsRequestCWProxyImpl
    implements _$SetPaymentMethodsRequestCWProxy {
  const _$SetPaymentMethodsRequestCWProxyImpl(this._value);

  final SetPaymentMethodsRequest _value;

  @override
  SetPaymentMethodsRequest methods(
    List<SetPaymentMethodsRequestMethodsInner> methods,
  ) => this(methods: methods);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPaymentMethodsRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPaymentMethodsRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPaymentMethodsRequest call({
    Object? methods = const $CopyWithPlaceholder(),
  }) {
    return SetPaymentMethodsRequest(
      methods: methods == const $CopyWithPlaceholder()
          ? _value.methods
          // ignore: cast_nullable_to_non_nullable
          : methods as List<SetPaymentMethodsRequestMethodsInner>,
    );
  }
}

extension $SetPaymentMethodsRequestCopyWith on SetPaymentMethodsRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSetPaymentMethodsRequest.copyWith(...)` or like so:`instanceOfSetPaymentMethodsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetPaymentMethodsRequestCWProxy get copyWith =>
      _$SetPaymentMethodsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPaymentMethodsRequest _$SetPaymentMethodsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SetPaymentMethodsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['methods']);
  final val = SetPaymentMethodsRequest(
    methods: $checkedConvert(
      'methods',
      (v) => (v as List<dynamic>)
          .map(
            (e) => SetPaymentMethodsRequestMethodsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SetPaymentMethodsRequestToJson(
  SetPaymentMethodsRequest instance,
) => <String, dynamic>{
  'methods': instance.methods.map((e) => e.toJson()).toList(),
};
