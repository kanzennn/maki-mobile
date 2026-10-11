// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherInputCWProxy {
  VoucherInput code(String code);

  VoucherInput name(String? name);

  VoucherInput type(VoucherType type);

  VoucherInput value(int value);

  VoucherInput maxDiscount(int? maxDiscount);

  VoucherInput minSpend(int? minSpend);

  VoucherInput quota(int quota);

  VoucherInput startAt(DateTime? startAt);

  VoucherInput expiredAt(DateTime expiredAt);

  VoucherInput allOutlets(bool allOutlets);

  VoucherInput outletIds(List<String>? outletIds);

  VoucherInput isActive(bool? isActive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherInput(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherInput call({
    String code,
    String? name,
    VoucherType type,
    int value,
    int? maxDiscount,
    int? minSpend,
    int quota,
    DateTime? startAt,
    DateTime expiredAt,
    bool allOutlets,
    List<String>? outletIds,
    bool? isActive,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherInput.copyWith.fieldName(...)`
class _$VoucherInputCWProxyImpl implements _$VoucherInputCWProxy {
  const _$VoucherInputCWProxyImpl(this._value);

  final VoucherInput _value;

  @override
  VoucherInput code(String code) => this(code: code);

  @override
  VoucherInput name(String? name) => this(name: name);

  @override
  VoucherInput type(VoucherType type) => this(type: type);

  @override
  VoucherInput value(int value) => this(value: value);

  @override
  VoucherInput maxDiscount(int? maxDiscount) => this(maxDiscount: maxDiscount);

  @override
  VoucherInput minSpend(int? minSpend) => this(minSpend: minSpend);

  @override
  VoucherInput quota(int quota) => this(quota: quota);

  @override
  VoucherInput startAt(DateTime? startAt) => this(startAt: startAt);

  @override
  VoucherInput expiredAt(DateTime expiredAt) => this(expiredAt: expiredAt);

  @override
  VoucherInput allOutlets(bool allOutlets) => this(allOutlets: allOutlets);

  @override
  VoucherInput outletIds(List<String>? outletIds) => this(outletIds: outletIds);

  @override
  VoucherInput isActive(bool? isActive) => this(isActive: isActive);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherInput(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherInput call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? maxDiscount = const $CopyWithPlaceholder(),
    Object? minSpend = const $CopyWithPlaceholder(),
    Object? quota = const $CopyWithPlaceholder(),
    Object? startAt = const $CopyWithPlaceholder(),
    Object? expiredAt = const $CopyWithPlaceholder(),
    Object? allOutlets = const $CopyWithPlaceholder(),
    Object? outletIds = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
  }) {
    return VoucherInput(
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
      quota: quota == const $CopyWithPlaceholder()
          ? _value.quota
          // ignore: cast_nullable_to_non_nullable
          : quota as int,
      startAt: startAt == const $CopyWithPlaceholder()
          ? _value.startAt
          // ignore: cast_nullable_to_non_nullable
          : startAt as DateTime?,
      expiredAt: expiredAt == const $CopyWithPlaceholder()
          ? _value.expiredAt
          // ignore: cast_nullable_to_non_nullable
          : expiredAt as DateTime,
      allOutlets: allOutlets == const $CopyWithPlaceholder()
          ? _value.allOutlets
          // ignore: cast_nullable_to_non_nullable
          : allOutlets as bool,
      outletIds: outletIds == const $CopyWithPlaceholder()
          ? _value.outletIds
          // ignore: cast_nullable_to_non_nullable
          : outletIds as List<String>?,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool?,
    );
  }
}

extension $VoucherInputCopyWith on VoucherInput {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherInput.copyWith(...)` or like so:`instanceOfVoucherInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherInputCWProxy get copyWith => _$VoucherInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherInput _$VoucherInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VoucherInput',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'code',
            'type',
            'value',
            'quota',
            'expired_at',
            'all_outlets',
          ],
        );
        final val = VoucherInput(
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
          quota: $checkedConvert('quota', (v) => (v as num).toInt()),
          startAt: $checkedConvert(
            'start_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          expiredAt: $checkedConvert(
            'expired_at',
            (v) => DateTime.parse(v as String),
          ),
          allOutlets: $checkedConvert('all_outlets', (v) => v as bool),
          outletIds: $checkedConvert(
            'outlet_ids',
            (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
          ),
          isActive: $checkedConvert('is_active', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxDiscount': 'max_discount',
        'minSpend': 'min_spend',
        'startAt': 'start_at',
        'expiredAt': 'expired_at',
        'allOutlets': 'all_outlets',
        'outletIds': 'outlet_ids',
        'isActive': 'is_active',
      },
    );

Map<String, dynamic> _$VoucherInputToJson(VoucherInput instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': ?instance.name,
      'type': _$VoucherTypeEnumMap[instance.type]!,
      'value': instance.value,
      'max_discount': ?instance.maxDiscount,
      'min_spend': ?instance.minSpend,
      'quota': instance.quota,
      'start_at': ?instance.startAt?.toIso8601String(),
      'expired_at': instance.expiredAt.toIso8601String(),
      'all_outlets': instance.allOutlets,
      'outlet_ids': ?instance.outletIds,
      'is_active': ?instance.isActive,
    };

const _$VoucherTypeEnumMap = {
  VoucherType.percent: 'percent',
  VoucherType.amount: 'amount',
};
