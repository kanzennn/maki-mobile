// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_outlet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosOutletCWProxy {
  PosOutlet outletId(String outletId);

  PosOutlet code(String code);

  PosOutlet name(String name);

  PosOutlet address(String? address);

  PosOutlet phone(String? phone);

  PosOutlet timezone(String timezone);

  PosOutlet locale(PosOutletLocaleEnum locale);

  PosOutlet taxBps(int taxBps);

  PosOutlet serviceBps(int serviceBps);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  PosOutlet call({
    String outletId,
    String code,
    String name,
    String? address,
    String? phone,
    String timezone,
    PosOutletLocaleEnum locale,
    int taxBps,
    int serviceBps,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosOutlet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosOutlet.copyWith.fieldName(...)`
class _$PosOutletCWProxyImpl implements _$PosOutletCWProxy {
  const _$PosOutletCWProxyImpl(this._value);

  final PosOutlet _value;

  @override
  PosOutlet outletId(String outletId) => this(outletId: outletId);

  @override
  PosOutlet code(String code) => this(code: code);

  @override
  PosOutlet name(String name) => this(name: name);

  @override
  PosOutlet address(String? address) => this(address: address);

  @override
  PosOutlet phone(String? phone) => this(phone: phone);

  @override
  PosOutlet timezone(String timezone) => this(timezone: timezone);

  @override
  PosOutlet locale(PosOutletLocaleEnum locale) => this(locale: locale);

  @override
  PosOutlet taxBps(int taxBps) => this(taxBps: taxBps);

  @override
  PosOutlet serviceBps(int serviceBps) => this(serviceBps: serviceBps);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  PosOutlet call({
    Object? outletId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? timezone = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? taxBps = const $CopyWithPlaceholder(),
    Object? serviceBps = const $CopyWithPlaceholder(),
  }) {
    return PosOutlet(
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
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      timezone: timezone == const $CopyWithPlaceholder()
          ? _value.timezone
          // ignore: cast_nullable_to_non_nullable
          : timezone as String,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as PosOutletLocaleEnum,
      taxBps: taxBps == const $CopyWithPlaceholder()
          ? _value.taxBps
          // ignore: cast_nullable_to_non_nullable
          : taxBps as int,
      serviceBps: serviceBps == const $CopyWithPlaceholder()
          ? _value.serviceBps
          // ignore: cast_nullable_to_non_nullable
          : serviceBps as int,
    );
  }
}

extension $PosOutletCopyWith on PosOutlet {
  /// Returns a callable class that can be used as follows: `instanceOfPosOutlet.copyWith(...)` or like so:`instanceOfPosOutlet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosOutletCWProxy get copyWith => _$PosOutletCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosOutlet _$PosOutletFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PosOutlet',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'outlet_id',
        'code',
        'name',
        'address',
        'phone',
        'timezone',
        'locale',
        'tax_bps',
        'service_bps',
      ],
    );
    final val = PosOutlet(
      outletId: $checkedConvert('outlet_id', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      address: $checkedConvert('address', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      timezone: $checkedConvert('timezone', (v) => v as String),
      locale: $checkedConvert(
        'locale',
        (v) => $enumDecode(_$PosOutletLocaleEnumEnumMap, v),
      ),
      taxBps: $checkedConvert('tax_bps', (v) => (v as num).toInt()),
      serviceBps: $checkedConvert('service_bps', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {
    'outletId': 'outlet_id',
    'taxBps': 'tax_bps',
    'serviceBps': 'service_bps',
  },
);

Map<String, dynamic> _$PosOutletToJson(PosOutlet instance) => <String, dynamic>{
  'outlet_id': instance.outletId,
  'code': instance.code,
  'name': instance.name,
  'address': instance.address,
  'phone': instance.phone,
  'timezone': instance.timezone,
  'locale': _$PosOutletLocaleEnumEnumMap[instance.locale]!,
  'tax_bps': instance.taxBps,
  'service_bps': instance.serviceBps,
};

const _$PosOutletLocaleEnumEnumMap = {
  PosOutletLocaleEnum.id: 'id',
  PosOutletLocaleEnum.en: 'en',
};
