// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherListCWProxy {
  VoucherList data(List<Voucher> data);

  VoucherList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherList(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherList call({List<Voucher> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherList.copyWith.fieldName(...)`
class _$VoucherListCWProxyImpl implements _$VoucherListCWProxy {
  const _$VoucherListCWProxyImpl(this._value);

  final VoucherList _value;

  @override
  VoucherList data(List<Voucher> data) => this(data: data);

  @override
  VoucherList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherList(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return VoucherList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Voucher>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $VoucherListCopyWith on VoucherList {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherList.copyWith(...)` or like so:`instanceOfVoucherList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherListCWProxy get copyWith => _$VoucherListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherList _$VoucherListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VoucherList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = VoucherList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Voucher.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VoucherListToJson(VoucherList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
