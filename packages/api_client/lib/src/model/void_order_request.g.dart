// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'void_order_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoidOrderRequestCWProxy {
  VoidOrderRequest reason(String reason);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoidOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoidOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  VoidOrderRequest call({String reason});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoidOrderRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoidOrderRequest.copyWith.fieldName(...)`
class _$VoidOrderRequestCWProxyImpl implements _$VoidOrderRequestCWProxy {
  const _$VoidOrderRequestCWProxyImpl(this._value);

  final VoidOrderRequest _value;

  @override
  VoidOrderRequest reason(String reason) => this(reason: reason);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoidOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoidOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  VoidOrderRequest call({Object? reason = const $CopyWithPlaceholder()}) {
    return VoidOrderRequest(
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
    );
  }
}

extension $VoidOrderRequestCopyWith on VoidOrderRequest {
  /// Returns a callable class that can be used as follows: `instanceOfVoidOrderRequest.copyWith(...)` or like so:`instanceOfVoidOrderRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoidOrderRequestCWProxy get copyWith => _$VoidOrderRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoidOrderRequest _$VoidOrderRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VoidOrderRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = VoidOrderRequest(
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$VoidOrderRequestToJson(VoidOrderRequest instance) =>
    <String, dynamic>{'reason': instance.reason};
