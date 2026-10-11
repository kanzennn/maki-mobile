// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FloorCWProxy {
  Floor areas(List<FloorArea> areas);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Floor(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Floor(...).copyWith(id: 12, name: "My name")
  /// ````
  Floor call({List<FloorArea> areas});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFloor.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFloor.copyWith.fieldName(...)`
class _$FloorCWProxyImpl implements _$FloorCWProxy {
  const _$FloorCWProxyImpl(this._value);

  final Floor _value;

  @override
  Floor areas(List<FloorArea> areas) => this(areas: areas);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Floor(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Floor(...).copyWith(id: 12, name: "My name")
  /// ````
  Floor call({Object? areas = const $CopyWithPlaceholder()}) {
    return Floor(
      areas: areas == const $CopyWithPlaceholder()
          ? _value.areas
          // ignore: cast_nullable_to_non_nullable
          : areas as List<FloorArea>,
    );
  }
}

extension $FloorCopyWith on Floor {
  /// Returns a callable class that can be used as follows: `instanceOfFloor.copyWith(...)` or like so:`instanceOfFloor.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FloorCWProxy get copyWith => _$FloorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floor _$FloorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Floor', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['areas']);
      final val = Floor(
        areas: $checkedConvert(
          'areas',
          (v) => (v as List<dynamic>)
              .map((e) => FloorArea.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
  'areas': instance.areas.map((e) => e.toJson()).toList(),
};
