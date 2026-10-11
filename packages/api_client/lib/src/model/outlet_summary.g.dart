// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OutletSummaryCWProxy {
  OutletSummary outletId(String outletId);

  OutletSummary code(String code);

  OutletSummary name(String name);

  OutletSummary timezone(String timezone);

  OutletSummary locale(String locale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletSummary call({
    String outletId,
    String code,
    String name,
    String timezone,
    String locale,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOutletSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOutletSummary.copyWith.fieldName(...)`
class _$OutletSummaryCWProxyImpl implements _$OutletSummaryCWProxy {
  const _$OutletSummaryCWProxyImpl(this._value);

  final OutletSummary _value;

  @override
  OutletSummary outletId(String outletId) => this(outletId: outletId);

  @override
  OutletSummary code(String code) => this(code: code);

  @override
  OutletSummary name(String name) => this(name: name);

  @override
  OutletSummary timezone(String timezone) => this(timezone: timezone);

  @override
  OutletSummary locale(String locale) => this(locale: locale);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletSummary call({
    Object? outletId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? timezone = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
  }) {
    return OutletSummary(
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
      timezone: timezone == const $CopyWithPlaceholder()
          ? _value.timezone
          // ignore: cast_nullable_to_non_nullable
          : timezone as String,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String,
    );
  }
}

extension $OutletSummaryCopyWith on OutletSummary {
  /// Returns a callable class that can be used as follows: `instanceOfOutletSummary.copyWith(...)` or like so:`instanceOfOutletSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OutletSummaryCWProxy get copyWith => _$OutletSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletSummary _$OutletSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OutletSummary', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['outlet_id', 'code', 'name', 'timezone', 'locale'],
      );
      final val = OutletSummary(
        outletId: $checkedConvert('outlet_id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        timezone: $checkedConvert('timezone', (v) => v as String),
        locale: $checkedConvert('locale', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'outletId': 'outlet_id'});

Map<String, dynamic> _$OutletSummaryToJson(OutletSummary instance) =>
    <String, dynamic>{
      'outlet_id': instance.outletId,
      'code': instance.code,
      'name': instance.name,
      'timezone': instance.timezone,
      'locale': instance.locale,
    };
