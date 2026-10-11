// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_terms.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherTermsCWProxy {
  VoucherTerms voucherId(String voucherId);

  VoucherTerms code(String code);

  VoucherTerms name(String? name);

  VoucherTerms type(VoucherType type);

  VoucherTerms value(int value);

  VoucherTerms maxDiscount(int? maxDiscount);

  VoucherTerms minSpend(int? minSpend);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherTerms(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherTerms(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherTerms call({
    String voucherId,
    String code,
    String? name,
    VoucherType type,
    int value,
    int? maxDiscount,
    int? minSpend,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherTerms.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherTerms.copyWith.fieldName(...)`
class _$VoucherTermsCWProxyImpl implements _$VoucherTermsCWProxy {
  const _$VoucherTermsCWProxyImpl(this._value);

  final VoucherTerms _value;

  @override
  VoucherTerms voucherId(String voucherId) => this(voucherId: voucherId);

  @override
  VoucherTerms code(String code) => this(code: code);

  @override
  VoucherTerms name(String? name) => this(name: name);

  @override
  VoucherTerms type(VoucherType type) => this(type: type);

  @override
  VoucherTerms value(int value) => this(value: value);

  @override
  VoucherTerms maxDiscount(int? maxDiscount) => this(maxDiscount: maxDiscount);

  @override
  VoucherTerms minSpend(int? minSpend) => this(minSpend: minSpend);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherTerms(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherTerms(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherTerms call({
    Object? voucherId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? maxDiscount = const $CopyWithPlaceholder(),
    Object? minSpend = const $CopyWithPlaceholder(),
  }) {
    return VoucherTerms(
      voucherId: voucherId == const $CopyWithPlaceholder()
          ? _value.voucherId
          // ignore: cast_nullable_to_non_nullable
          : voucherId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as VoucherType,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int,
      maxDiscount: maxDiscount == const $CopyWithPlaceholder()
          ? _value.maxDiscount
          // ignore: cast_nullable_to_non_nullable
          : maxDiscount as int?,
      minSpend: minSpend == const $CopyWithPlaceholder()
          ? _value.minSpend
          // ignore: cast_nullable_to_non_nullable
          : minSpend as int?,
    );
  }
}

extension $VoucherTermsCopyWith on VoucherTerms {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherTerms.copyWith(...)` or like so:`instanceOfVoucherTerms.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherTermsCWProxy get copyWith => _$VoucherTermsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherTerms _$VoucherTermsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VoucherTerms',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'voucher_id',
            'code',
            'name',
            'type',
            'value',
            'max_discount',
            'min_spend',
          ],
        );
        final val = VoucherTerms(
          voucherId: $checkedConvert('voucher_id', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String?),
          type: $checkedConvert(
            'type',
            (v) => $enumDecode(_$VoucherTypeEnumMap, v),
          ),
          value: $checkedConvert('value', (v) => (v as num).toInt()),
          maxDiscount: $checkedConvert(
            'max_discount',
            (v) => (v as num?)?.toInt(),
          ),
          minSpend: $checkedConvert('min_spend', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'voucherId': 'voucher_id',
        'maxDiscount': 'max_discount',
        'minSpend': 'min_spend',
      },
    );

Map<String, dynamic> _$VoucherTermsToJson(VoucherTerms instance) =>
    <String, dynamic>{
      'voucher_id': instance.voucherId,
      'code': instance.code,
      'name': instance.name,
      'type': _$VoucherTypeEnumMap[instance.type]!,
      'value': instance.value,
      'max_discount': instance.maxDiscount,
      'min_spend': instance.minSpend,
    };

const _$VoucherTypeEnumMap = {
  VoucherType.percent: 'percent',
  VoucherType.amount: 'amount',
};
