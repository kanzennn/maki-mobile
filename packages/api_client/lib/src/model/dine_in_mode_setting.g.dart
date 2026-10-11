// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dine_in_mode_setting.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DineInModeSettingCWProxy {
  DineInModeSetting mode(DineInMode mode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DineInModeSetting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DineInModeSetting(...).copyWith(id: 12, name: "My name")
  /// ````
  DineInModeSetting call({DineInMode mode});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDineInModeSetting.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDineInModeSetting.copyWith.fieldName(...)`
class _$DineInModeSettingCWProxyImpl implements _$DineInModeSettingCWProxy {
  const _$DineInModeSettingCWProxyImpl(this._value);

  final DineInModeSetting _value;

  @override
  DineInModeSetting mode(DineInMode mode) => this(mode: mode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DineInModeSetting(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DineInModeSetting(...).copyWith(id: 12, name: "My name")
  /// ````
  DineInModeSetting call({Object? mode = const $CopyWithPlaceholder()}) {
    return DineInModeSetting(
      mode: mode == const $CopyWithPlaceholder()
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as DineInMode,
    );
  }
}

extension $DineInModeSettingCopyWith on DineInModeSetting {
  /// Returns a callable class that can be used as follows: `instanceOfDineInModeSetting.copyWith(...)` or like so:`instanceOfDineInModeSetting.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DineInModeSettingCWProxy get copyWith =>
      _$DineInModeSettingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DineInModeSetting _$DineInModeSettingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DineInModeSetting', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['mode']);
      final val = DineInModeSetting(
        mode: $checkedConvert(
          'mode',
          (v) => $enumDecode(_$DineInModeEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DineInModeSettingToJson(DineInModeSetting instance) =>
    <String, dynamic>{'mode': _$DineInModeEnumMap[instance.mode]!};

const _$DineInModeEnumMap = {
  DineInMode.table: 'table',
  DineInMode.number: 'number',
};
