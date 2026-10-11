// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OutletCWProxy {
  Outlet outletId(String outletId);

  Outlet code(String code);

  Outlet name(String name);

  Outlet address(String? address);

  Outlet phone(String? phone);

  Outlet timezone(String timezone);

  Outlet locale(OutletLocaleEnum locale);

  Outlet openTime(String? openTime);

  Outlet closeTime(String? closeTime);

  Outlet taxPct(num taxPct);

  Outlet servicePct(num servicePct);

  Outlet status(OutletStatusEnum status);

  Outlet managers(List<ManagerRef> managers);

  Outlet createdAt(DateTime createdAt);

  Outlet updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Outlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Outlet(...).copyWith(id: 12, name: "My name")
  /// ````
  Outlet call({
    String outletId,
    String code,
    String name,
    String? address,
    String? phone,
    String timezone,
    OutletLocaleEnum locale,
    String? openTime,
    String? closeTime,
    num taxPct,
    num servicePct,
    OutletStatusEnum status,
    List<ManagerRef> managers,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOutlet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOutlet.copyWith.fieldName(...)`
class _$OutletCWProxyImpl implements _$OutletCWProxy {
  const _$OutletCWProxyImpl(this._value);

  final Outlet _value;

  @override
  Outlet outletId(String outletId) => this(outletId: outletId);

  @override
  Outlet code(String code) => this(code: code);

  @override
  Outlet name(String name) => this(name: name);

  @override
  Outlet address(String? address) => this(address: address);

  @override
  Outlet phone(String? phone) => this(phone: phone);

  @override
  Outlet timezone(String timezone) => this(timezone: timezone);

  @override
  Outlet locale(OutletLocaleEnum locale) => this(locale: locale);

  @override
  Outlet openTime(String? openTime) => this(openTime: openTime);

  @override
  Outlet closeTime(String? closeTime) => this(closeTime: closeTime);

  @override
  Outlet taxPct(num taxPct) => this(taxPct: taxPct);

  @override
  Outlet servicePct(num servicePct) => this(servicePct: servicePct);

  @override
  Outlet status(OutletStatusEnum status) => this(status: status);

  @override
  Outlet managers(List<ManagerRef> managers) => this(managers: managers);

  @override
  Outlet createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Outlet updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Outlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Outlet(...).copyWith(id: 12, name: "My name")
  /// ````
  Outlet call({
    Object? outletId = const $CopyWithPlaceholder(),
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
    Object? status = const $CopyWithPlaceholder(),
    Object? managers = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Outlet(
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
          : locale as OutletLocaleEnum,
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
          : taxPct as num,
      servicePct: servicePct == const $CopyWithPlaceholder()
          ? _value.servicePct
          // ignore: cast_nullable_to_non_nullable
          : servicePct as num,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OutletStatusEnum,
      managers: managers == const $CopyWithPlaceholder()
          ? _value.managers
          // ignore: cast_nullable_to_non_nullable
          : managers as List<ManagerRef>,
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

extension $OutletCopyWith on Outlet {
  /// Returns a callable class that can be used as follows: `instanceOfOutlet.copyWith(...)` or like so:`instanceOfOutlet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OutletCWProxy get copyWith => _$OutletCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Outlet _$OutletFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Outlet',
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
        'open_time',
        'close_time',
        'tax_pct',
        'service_pct',
        'status',
        'managers',
        'created_at',
        'updated_at',
      ],
    );
    final val = Outlet(
      outletId: $checkedConvert('outlet_id', (v) => v as String),
      code: $checkedConvert('code', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      address: $checkedConvert('address', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      timezone: $checkedConvert('timezone', (v) => v as String),
      locale: $checkedConvert(
        'locale',
        (v) => $enumDecode(_$OutletLocaleEnumEnumMap, v),
      ),
      openTime: $checkedConvert('open_time', (v) => v as String?),
      closeTime: $checkedConvert('close_time', (v) => v as String?),
      taxPct: $checkedConvert('tax_pct', (v) => v as num),
      servicePct: $checkedConvert('service_pct', (v) => v as num),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$OutletStatusEnumEnumMap, v),
      ),
      managers: $checkedConvert(
        'managers',
        (v) => (v as List<dynamic>)
            .map((e) => ManagerRef.fromJson(e as Map<String, dynamic>))
            .toList(),
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
    'outletId': 'outlet_id',
    'openTime': 'open_time',
    'closeTime': 'close_time',
    'taxPct': 'tax_pct',
    'servicePct': 'service_pct',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$OutletToJson(Outlet instance) => <String, dynamic>{
  'outlet_id': instance.outletId,
  'code': instance.code,
  'name': instance.name,
  'address': instance.address,
  'phone': instance.phone,
  'timezone': instance.timezone,
  'locale': _$OutletLocaleEnumEnumMap[instance.locale]!,
  'open_time': instance.openTime,
  'close_time': instance.closeTime,
  'tax_pct': instance.taxPct,
  'service_pct': instance.servicePct,
  'status': _$OutletStatusEnumEnumMap[instance.status]!,
  'managers': instance.managers.map((e) => e.toJson()).toList(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$OutletLocaleEnumEnumMap = {
  OutletLocaleEnum.id: 'id',
  OutletLocaleEnum.en: 'en',
};

const _$OutletStatusEnumEnumMap = {
  OutletStatusEnum.active: 'active',
  OutletStatusEnum.inactive: 'inactive',
};
