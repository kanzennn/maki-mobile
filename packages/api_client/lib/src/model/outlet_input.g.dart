// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OutletInputCWProxy {
  OutletInput code(String code);

  OutletInput name(String name);

  OutletInput address(String? address);

  OutletInput phone(String? phone);

  OutletInput timezone(String? timezone);

  OutletInput locale(OutletInputLocaleEnum? locale);

  OutletInput openTime(String? openTime);

  OutletInput closeTime(String? closeTime);

  OutletInput taxPct(num? taxPct);

  OutletInput servicePct(num? servicePct);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletInput(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletInput call({
    String code,
    String name,
    String? address,
    String? phone,
    String? timezone,
    OutletInputLocaleEnum? locale,
    String? openTime,
    String? closeTime,
    num? taxPct,
    num? servicePct,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOutletInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOutletInput.copyWith.fieldName(...)`
class _$OutletInputCWProxyImpl implements _$OutletInputCWProxy {
  const _$OutletInputCWProxyImpl(this._value);

  final OutletInput _value;

  @override
  OutletInput code(String code) => this(code: code);

  @override
  OutletInput name(String name) => this(name: name);

  @override
  OutletInput address(String? address) => this(address: address);

  @override
  OutletInput phone(String? phone) => this(phone: phone);

  @override
  OutletInput timezone(String? timezone) => this(timezone: timezone);

  @override
  OutletInput locale(OutletInputLocaleEnum? locale) => this(locale: locale);

  @override
  OutletInput openTime(String? openTime) => this(openTime: openTime);

  @override
  OutletInput closeTime(String? closeTime) => this(closeTime: closeTime);

  @override
  OutletInput taxPct(num? taxPct) => this(taxPct: taxPct);

  @override
  OutletInput servicePct(num? servicePct) => this(servicePct: servicePct);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletInput(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletInput call({
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? timezone = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? openTime = const $CopyWithPlaceholder(),
    Object? closeTime = const $CopyWithPlaceholder(),
    Object? taxPct = const $CopyWithPlaceholder(),
    Object? servicePct = const $CopyWithPlaceholder(),
  }) {
    return OutletInput(
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
          : timezone as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as OutletInputLocaleEnum?,
      openTime: openTime == const $CopyWithPlaceholder()
          ? _value.openTime
          // ignore: cast_nullable_to_non_nullable
          : openTime as String?,
      closeTime: closeTime == const $CopyWithPlaceholder()
          ? _value.closeTime
          // ignore: cast_nullable_to_non_nullable
          : closeTime as String?,
      taxPct: taxPct == const $CopyWithPlaceholder()
          ? _value.taxPct
          // ignore: cast_nullable_to_non_nullable
          : taxPct as num?,
      servicePct: servicePct == const $CopyWithPlaceholder()
          ? _value.servicePct
          // ignore: cast_nullable_to_non_nullable
          : servicePct as num?,
    );
  }
}

extension $OutletInputCopyWith on OutletInput {
  /// Returns a callable class that can be used as follows: `instanceOfOutletInput.copyWith(...)` or like so:`instanceOfOutletInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OutletInputCWProxy get copyWith => _$OutletInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletInput _$OutletInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  'OutletInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['code', 'name']);
    final val = OutletInput(
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      address: $checkedConvert('address', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      timezone: $checkedConvert('timezone', (v) => v as String?),
      locale: $checkedConvert(
        'locale',
        (v) => $enumDecodeNullable(_$OutletInputLocaleEnumEnumMap, v),
      ),
      openTime: $checkedConvert('open_time', (v) => v as String?),
      closeTime: $checkedConvert('close_time', (v) => v as String?),
      taxPct: $checkedConvert('tax_pct', (v) => v as num? ?? 0),
      servicePct: $checkedConvert('service_pct', (v) => v as num? ?? 0),
    );
    return val;
  },
  fieldKeyMap: const {
    'openTime': 'open_time',
    'closeTime': 'close_time',
    'taxPct': 'tax_pct',
    'servicePct': 'service_pct',
  },
);

Map<String, dynamic> _$OutletInputToJson(OutletInput instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'address': ?instance.address,
      'phone': ?instance.phone,
      'timezone': ?instance.timezone,
      'locale': ?_$OutletInputLocaleEnumEnumMap[instance.locale],
      'open_time': ?instance.openTime,
      'close_time': ?instance.closeTime,
      'tax_pct': ?instance.taxPct,
      'service_pct': ?instance.servicePct,
    };

const _$OutletInputLocaleEnumEnumMap = {
  OutletInputLocaleEnum.id: 'id',
  OutletInputLocaleEnum.en: 'en',
};
