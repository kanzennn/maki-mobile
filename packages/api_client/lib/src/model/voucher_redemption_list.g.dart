// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_redemption_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherRedemptionListCWProxy {
  VoucherRedemptionList data(List<VoucherRedemption> data);

  VoucherRedemptionList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherRedemptionList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherRedemptionList(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherRedemptionList call({List<VoucherRedemption> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherRedemptionList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherRedemptionList.copyWith.fieldName(...)`
class _$VoucherRedemptionListCWProxyImpl
    implements _$VoucherRedemptionListCWProxy {
  const _$VoucherRedemptionListCWProxyImpl(this._value);

  final VoucherRedemptionList _value;

  @override
  VoucherRedemptionList data(List<VoucherRedemption> data) => this(data: data);

  @override
  VoucherRedemptionList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherRedemptionList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherRedemptionList(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherRedemptionList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return VoucherRedemptionList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<VoucherRedemption>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $VoucherRedemptionListCopyWith on VoucherRedemptionList {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherRedemptionList.copyWith(...)` or like so:`instanceOfVoucherRedemptionList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherRedemptionListCWProxy get copyWith =>
      _$VoucherRedemptionListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherRedemptionList _$VoucherRedemptionListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VoucherRedemptionList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data', 'meta']);
  final val = VoucherRedemptionList(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => VoucherRedemption.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    meta: $checkedConvert(
      'meta',
      (v) => ListMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$VoucherRedemptionListToJson(
  VoucherRedemptionList instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
