// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherCWProxy {
  Voucher voucherId(String voucherId);

  Voucher code(String code);

  Voucher name(String? name);

  Voucher type(VoucherType type);

  Voucher value(int value);

  Voucher maxDiscount(int? maxDiscount);

  Voucher minSpend(int? minSpend);

  Voucher quota(int quota);

  Voucher usedCount(int usedCount);

  Voucher startAt(DateTime? startAt);

  Voucher expiredAt(DateTime expiredAt);

  Voucher allOutlets(bool allOutlets);

  Voucher outlets(List<VoucherOutlet> outlets);

  Voucher isActive(bool isActive);

  Voucher status(VoucherStatus status);

  Voucher firstUsedAt(DateTime? firstUsedAt);

  Voucher createdAt(DateTime createdAt);

  Voucher updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Voucher(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Voucher(...).copyWith(id: 12, name: "My name")
  /// ````
  Voucher call({
    String voucherId,
    String code,
    String? name,
    VoucherType type,
    int value,
    int? maxDiscount,
    int? minSpend,
    int quota,
    int usedCount,
    DateTime? startAt,
    DateTime expiredAt,
    bool allOutlets,
    List<VoucherOutlet> outlets,
    bool isActive,
    VoucherStatus status,
    DateTime? firstUsedAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucher.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucher.copyWith.fieldName(...)`
class _$VoucherCWProxyImpl implements _$VoucherCWProxy {
  const _$VoucherCWProxyImpl(this._value);

  final Voucher _value;

  @override
  Voucher voucherId(String voucherId) => this(voucherId: voucherId);

  @override
  Voucher code(String code) => this(code: code);

  @override
  Voucher name(String? name) => this(name: name);

  @override
  Voucher type(VoucherType type) => this(type: type);

  @override
  Voucher value(int value) => this(value: value);

  @override
  Voucher maxDiscount(int? maxDiscount) => this(maxDiscount: maxDiscount);

  @override
  Voucher minSpend(int? minSpend) => this(minSpend: minSpend);

  @override
  Voucher quota(int quota) => this(quota: quota);

  @override
  Voucher usedCount(int usedCount) => this(usedCount: usedCount);

  @override
  Voucher startAt(DateTime? startAt) => this(startAt: startAt);

  @override
  Voucher expiredAt(DateTime expiredAt) => this(expiredAt: expiredAt);

  @override
  Voucher allOutlets(bool allOutlets) => this(allOutlets: allOutlets);

  @override
  Voucher outlets(List<VoucherOutlet> outlets) => this(outlets: outlets);

  @override
  Voucher isActive(bool isActive) => this(isActive: isActive);

  @override
  Voucher status(VoucherStatus status) => this(status: status);

  @override
  Voucher firstUsedAt(DateTime? firstUsedAt) => this(firstUsedAt: firstUsedAt);

  @override
  Voucher createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Voucher updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Voucher(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Voucher(...).copyWith(id: 12, name: "My name")
  /// ````
  Voucher call({
    Object? voucherId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? maxDiscount = const $CopyWithPlaceholder(),
    Object? minSpend = const $CopyWithPlaceholder(),
    Object? quota = const $CopyWithPlaceholder(),
    Object? usedCount = const $CopyWithPlaceholder(),
    Object? startAt = const $CopyWithPlaceholder(),
    Object? expiredAt = const $CopyWithPlaceholder(),
    Object? allOutlets = const $CopyWithPlaceholder(),
    Object? outlets = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? firstUsedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Voucher(
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
      quota: quota == const $CopyWithPlaceholder()
          ? _value.quota
          // ignore: cast_nullable_to_non_nullable
          : quota as int,
      usedCount: usedCount == const $CopyWithPlaceholder()
          ? _value.usedCount
          // ignore: cast_nullable_to_non_nullable
          : usedCount as int,
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
      outlets: outlets == const $CopyWithPlaceholder()
          ? _value.outlets
          // ignore: cast_nullable_to_non_nullable
          : outlets as List<VoucherOutlet>,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as VoucherStatus,
      firstUsedAt: firstUsedAt == const $CopyWithPlaceholder()
          ? _value.firstUsedAt
          // ignore: cast_nullable_to_non_nullable
          : firstUsedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $VoucherCopyWith on Voucher {
  /// Returns a callable class that can be used as follows: `instanceOfVoucher.copyWith(...)` or like so:`instanceOfVoucher.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherCWProxy get copyWith => _$VoucherCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher _$VoucherFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Voucher',
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
        'quota',
        'used_count',
        'start_at',
        'expired_at',
        'all_outlets',
        'outlets',
        'is_active',
        'status',
        'first_used_at',
        'created_at',
        'updated_at',
      ],
    );
    final val = Voucher(
      voucherId: $checkedConvert('voucher_id', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String?),
      type: $checkedConvert(
        'type',
        (v) => $enumDecode(_$VoucherTypeEnumMap, v),
      ),
      value: $checkedConvert('value', (v) => (v as num).toInt()),
      maxDiscount: $checkedConvert('max_discount', (v) => (v as num?)?.toInt()),
      minSpend: $checkedConvert('min_spend', (v) => (v as num?)?.toInt()),
      quota: $checkedConvert('quota', (v) => (v as num).toInt()),
      usedCount: $checkedConvert('used_count', (v) => (v as num).toInt()),
      startAt: $checkedConvert(
        'start_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      expiredAt: $checkedConvert(
        'expired_at',
        (v) => DateTime.parse(v as String),
      ),
      allOutlets: $checkedConvert('all_outlets', (v) => v as bool),
      outlets: $checkedConvert(
        'outlets',
        (v) => (v as List<dynamic>)
            .map((e) => VoucherOutlet.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$VoucherStatusEnumMap, v),
      ),
      firstUsedAt: $checkedConvert(
        'first_used_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'voucherId': 'voucher_id',
    'maxDiscount': 'max_discount',
    'minSpend': 'min_spend',
    'usedCount': 'used_count',
    'startAt': 'start_at',
    'expiredAt': 'expired_at',
    'allOutlets': 'all_outlets',
    'isActive': 'is_active',
    'firstUsedAt': 'first_used_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$VoucherToJson(Voucher instance) => <String, dynamic>{
  'voucher_id': instance.voucherId,
  'code': instance.code,
  'name': instance.name,
  'type': _$VoucherTypeEnumMap[instance.type]!,
  'value': instance.value,
  'max_discount': instance.maxDiscount,
  'min_spend': instance.minSpend,
  'quota': instance.quota,
  'used_count': instance.usedCount,
  'start_at': instance.startAt?.toIso8601String(),
  'expired_at': instance.expiredAt.toIso8601String(),
  'all_outlets': instance.allOutlets,
  'outlets': instance.outlets.map((e) => e.toJson()).toList(),
  'is_active': instance.isActive,
  'status': _$VoucherStatusEnumMap[instance.status]!,
  'first_used_at': instance.firstUsedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$VoucherTypeEnumMap = {
  VoucherType.percent: 'percent',
  VoucherType.amount: 'amount',
};

const _$VoucherStatusEnumMap = {
  VoucherStatus.active: 'active',
  VoucherStatus.scheduled: 'scheduled',
  VoucherStatus.usedUp: 'used_up',
  VoucherStatus.expired: 'expired',
  VoucherStatus.inactive: 'inactive',
};
