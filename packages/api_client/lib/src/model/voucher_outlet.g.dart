// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_outlet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherOutletCWProxy {
  VoucherOutlet outletId(String outletId);

  VoucherOutlet code(String code);

  VoucherOutlet name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherOutlet call({String outletId, String code, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherOutlet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherOutlet.copyWith.fieldName(...)`
class _$VoucherOutletCWProxyImpl implements _$VoucherOutletCWProxy {
  const _$VoucherOutletCWProxyImpl(this._value);

  final VoucherOutlet _value;

  @override
  VoucherOutlet outletId(String outletId) => this(outletId: outletId);

  @override
  VoucherOutlet code(String code) => this(code: code);

  @override
  VoucherOutlet name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherOutlet call({
    Object? outletId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return VoucherOutlet(
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $VoucherOutletCopyWith on VoucherOutlet {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherOutlet.copyWith(...)` or like so:`instanceOfVoucherOutlet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherOutletCWProxy get copyWith => _$VoucherOutletCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherOutlet _$VoucherOutletFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VoucherOutlet', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['outlet_id', 'code', 'name']);
      final val = VoucherOutlet(
        outletId: $checkedConvert('outlet_id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'outletId': 'outlet_id'});

Map<String, dynamic> _$VoucherOutletToJson(VoucherOutlet instance) =>
    <String, dynamic>{
      'outlet_id': instance.outletId,
      'code': instance.code,
      'name': instance.name,
    };
