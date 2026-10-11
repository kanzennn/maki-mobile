// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_catalog.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosCatalogCWProxy {
  PosCatalog outlet(PosOutlet outlet);

  PosCatalog paymentMethods(List<PaymentMethod> paymentMethods);

  PosCatalog dineInMode(DineInMode dineInMode);

  PosCatalog categories(List<PosCategory> categories);

  PosCatalog menus(List<PosMenu> menus);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosCatalog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosCatalog(...).copyWith(id: 12, name: "My name")
  /// ````
  PosCatalog call({
    PosOutlet outlet,
    List<PaymentMethod> paymentMethods,
    DineInMode dineInMode,
    List<PosCategory> categories,
    List<PosMenu> menus,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosCatalog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosCatalog.copyWith.fieldName(...)`
class _$PosCatalogCWProxyImpl implements _$PosCatalogCWProxy {
  const _$PosCatalogCWProxyImpl(this._value);

  final PosCatalog _value;

  @override
  PosCatalog outlet(PosOutlet outlet) => this(outlet: outlet);

  @override
  PosCatalog paymentMethods(List<PaymentMethod> paymentMethods) =>
      this(paymentMethods: paymentMethods);

  @override
  PosCatalog dineInMode(DineInMode dineInMode) => this(dineInMode: dineInMode);

  @override
  PosCatalog categories(List<PosCategory> categories) =>
      this(categories: categories);

  @override
  PosCatalog menus(List<PosMenu> menus) => this(menus: menus);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosCatalog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosCatalog(...).copyWith(id: 12, name: "My name")
  /// ````
  PosCatalog call({
    Object? outlet = const $CopyWithPlaceholder(),
    Object? paymentMethods = const $CopyWithPlaceholder(),
    Object? dineInMode = const $CopyWithPlaceholder(),
    Object? categories = const $CopyWithPlaceholder(),
    Object? menus = const $CopyWithPlaceholder(),
  }) {
    return PosCatalog(
      outlet: outlet == const $CopyWithPlaceholder()
          ? _value.outlet
          // ignore: cast_nullable_to_non_nullable
          : outlet as PosOutlet,
      paymentMethods: paymentMethods == const $CopyWithPlaceholder()
          ? _value.paymentMethods
          // ignore: cast_nullable_to_non_nullable
          : paymentMethods as List<PaymentMethod>,
      dineInMode: dineInMode == const $CopyWithPlaceholder()
          ? _value.dineInMode
          // ignore: cast_nullable_to_non_nullable
          : dineInMode as DineInMode,
      categories: categories == const $CopyWithPlaceholder()
          ? _value.categories
          // ignore: cast_nullable_to_non_nullable
          : categories as List<PosCategory>,
      menus: menus == const $CopyWithPlaceholder()
          ? _value.menus
          // ignore: cast_nullable_to_non_nullable
          : menus as List<PosMenu>,
    );
  }
}

extension $PosCatalogCopyWith on PosCatalog {
  /// Returns a callable class that can be used as follows: `instanceOfPosCatalog.copyWith(...)` or like so:`instanceOfPosCatalog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosCatalogCWProxy get copyWith => _$PosCatalogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosCatalog _$PosCatalogFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PosCatalog',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'outlet',
        'payment_methods',
        'dine_in_mode',
        'categories',
        'menus',
      ],
    );
    final val = PosCatalog(
      outlet: $checkedConvert(
        'outlet',
        (v) => PosOutlet.fromJson(v as Map<String, dynamic>),
      ),
      paymentMethods: $checkedConvert(
        'payment_methods',
        (v) => (v as List<dynamic>)
            .map((e) => $enumDecode(_$PaymentMethodEnumMap, e))
            .toList(),
      ),
      dineInMode: $checkedConvert(
        'dine_in_mode',
        (v) => $enumDecode(_$DineInModeEnumMap, v),
      ),
      categories: $checkedConvert(
        'categories',
        (v) => (v as List<dynamic>)
            .map((e) => PosCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      menus: $checkedConvert(
        'menus',
        (v) => (v as List<dynamic>)
            .map((e) => PosMenu.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'paymentMethods': 'payment_methods',
    'dineInMode': 'dine_in_mode',
  },
);

Map<String, dynamic> _$PosCatalogToJson(PosCatalog instance) =>
    <String, dynamic>{
      'outlet': instance.outlet.toJson(),
      'payment_methods': instance.paymentMethods
          .map((e) => _$PaymentMethodEnumMap[e]!)
          .toList(),
      'dine_in_mode': _$DineInModeEnumMap[instance.dineInMode]!,
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'menus': instance.menus.map((e) => e.toJson()).toList(),
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qris: 'qris',
  PaymentMethod.debit: 'debit',
};

const _$DineInModeEnumMap = {
  DineInMode.table: 'table',
  DineInMode.number: 'number',
};
