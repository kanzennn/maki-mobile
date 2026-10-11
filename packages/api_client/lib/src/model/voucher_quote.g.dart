// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_quote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherQuoteCWProxy {
  VoucherQuote voucher(VoucherTerms voucher);

  VoucherQuote discount(int discount);

  VoucherQuote applies(bool applies);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherQuote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherQuote(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherQuote call({VoucherTerms voucher, int discount, bool applies});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherQuote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherQuote.copyWith.fieldName(...)`
class _$VoucherQuoteCWProxyImpl implements _$VoucherQuoteCWProxy {
  const _$VoucherQuoteCWProxyImpl(this._value);

  final VoucherQuote _value;

  @override
  VoucherQuote voucher(VoucherTerms voucher) => this(voucher: voucher);

  @override
  VoucherQuote discount(int discount) => this(discount: discount);

  @override
  VoucherQuote applies(bool applies) => this(applies: applies);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherQuote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherQuote(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherQuote call({
    Object? voucher = const $CopyWithPlaceholder(),
    Object? discount = const $CopyWithPlaceholder(),
    Object? applies = const $CopyWithPlaceholder(),
  }) {
    return VoucherQuote(
      voucher: voucher == const $CopyWithPlaceholder()
          ? _value.voucher
          // ignore: cast_nullable_to_non_nullable
          : voucher as VoucherTerms,
      discount: discount == const $CopyWithPlaceholder()
          ? _value.discount
          // ignore: cast_nullable_to_non_nullable
          : discount as int,
      applies: applies == const $CopyWithPlaceholder()
          ? _value.applies
          // ignore: cast_nullable_to_non_nullable
          : applies as bool,
    );
  }
}

extension $VoucherQuoteCopyWith on VoucherQuote {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherQuote.copyWith(...)` or like so:`instanceOfVoucherQuote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherQuoteCWProxy get copyWith => _$VoucherQuoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherQuote _$VoucherQuoteFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VoucherQuote', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['voucher', 'discount', 'applies']);
      final val = VoucherQuote(
        voucher: $checkedConvert(
          'voucher',
          (v) => VoucherTerms.fromJson(v as Map<String, dynamic>),
        ),
        discount: $checkedConvert('discount', (v) => (v as num).toInt()),
        applies: $checkedConvert('applies', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$VoucherQuoteToJson(VoucherQuote instance) =>
    <String, dynamic>{
      'voucher': instance.voucher.toJson(),
      'discount': instance.discount,
      'applies': instance.applies,
    };
