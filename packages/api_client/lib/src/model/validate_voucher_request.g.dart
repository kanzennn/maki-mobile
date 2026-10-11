// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_voucher_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidateVoucherRequestCWProxy {
  ValidateVoucherRequest code(String code);

  ValidateVoucherRequest subtotal(int subtotal);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateVoucherRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateVoucherRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateVoucherRequest call({String code, int subtotal});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValidateVoucherRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValidateVoucherRequest.copyWith.fieldName(...)`
class _$ValidateVoucherRequestCWProxyImpl
    implements _$ValidateVoucherRequestCWProxy {
  const _$ValidateVoucherRequestCWProxyImpl(this._value);

  final ValidateVoucherRequest _value;

  @override
  ValidateVoucherRequest code(String code) => this(code: code);

  @override
  ValidateVoucherRequest subtotal(int subtotal) => this(subtotal: subtotal);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateVoucherRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateVoucherRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateVoucherRequest call({
    Object? code = const $CopyWithPlaceholder(),
    Object? subtotal = const $CopyWithPlaceholder(),
  }) {
    return ValidateVoucherRequest(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      subtotal: subtotal == const $CopyWithPlaceholder()
          ? _value.subtotal
          // ignore: cast_nullable_to_non_nullable
          : subtotal as int,
    );
  }
}

extension $ValidateVoucherRequestCopyWith on ValidateVoucherRequest {
  /// Returns a callable class that can be used as follows: `instanceOfValidateVoucherRequest.copyWith(...)` or like so:`instanceOfValidateVoucherRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidateVoucherRequestCWProxy get copyWith =>
      _$ValidateVoucherRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateVoucherRequest _$ValidateVoucherRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ValidateVoucherRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['code', 'subtotal']);
  final val = ValidateVoucherRequest(
    code: $checkedConvert('code', (v) => v as String),
    subtotal: $checkedConvert('subtotal', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$ValidateVoucherRequestToJson(
  ValidateVoucherRequest instance,
) => <String, dynamic>{'code': instance.code, 'subtotal': instance.subtotal};
