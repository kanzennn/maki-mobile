// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FloorAreaCWProxy {
  FloorArea areaId(String areaId);

  FloorArea name(String name);

  FloorArea decorations(List<Decoration> decorations);

  FloorArea tables(List<FloorTable> tables);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FloorArea(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FloorArea(...).copyWith(id: 12, name: "My name")
  /// ````
  FloorArea call({
    String areaId,
    String name,
    List<Decoration> decorations,
    List<FloorTable> tables,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFloorArea.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFloorArea.copyWith.fieldName(...)`
class _$FloorAreaCWProxyImpl implements _$FloorAreaCWProxy {
  const _$FloorAreaCWProxyImpl(this._value);

  final FloorArea _value;

  @override
  FloorArea areaId(String areaId) => this(areaId: areaId);

  @override
  FloorArea name(String name) => this(name: name);

  @override
  FloorArea decorations(List<Decoration> decorations) =>
      this(decorations: decorations);

  @override
  FloorArea tables(List<FloorTable> tables) => this(tables: tables);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FloorArea(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FloorArea(...).copyWith(id: 12, name: "My name")
  /// ````
  FloorArea call({
    Object? areaId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? decorations = const $CopyWithPlaceholder(),
    Object? tables = const $CopyWithPlaceholder(),
  }) {
    return FloorArea(
      areaId: areaId == const $CopyWithPlaceholder()
          ? _value.areaId
          // ignore: cast_nullable_to_non_nullable
          : areaId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      decorations: decorations == const $CopyWithPlaceholder()
          ? _value.decorations
          // ignore: cast_nullable_to_non_nullable
          : decorations as List<Decoration>,
      tables: tables == const $CopyWithPlaceholder()
          ? _value.tables
          // ignore: cast_nullable_to_non_nullable
          : tables as List<FloorTable>,
    );
  }
}

extension $FloorAreaCopyWith on FloorArea {
  /// Returns a callable class that can be used as follows: `instanceOfFloorArea.copyWith(...)` or like so:`instanceOfFloorArea.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FloorAreaCWProxy get copyWith => _$FloorAreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloorArea _$FloorAreaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FloorArea', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['area_id', 'name', 'decorations', 'tables'],
      );
      final val = FloorArea(
        areaId: $checkedConvert('area_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        decorations: $checkedConvert(
          'decorations',
          (v) => (v as List<dynamic>)
              .map((e) => Decoration.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        tables: $checkedConvert(
          'tables',
          (v) => (v as List<dynamic>)
              .map((e) => FloorTable.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'areaId': 'area_id'});

Map<String, dynamic> _$FloorAreaToJson(FloorArea instance) => <String, dynamic>{
  'area_id': instance.areaId,
  'name': instance.name,
  'decorations': instance.decorations.map((e) => e.toJson()).toList(),
  'tables': instance.tables.map((e) => e.toJson()).toList(),
};
