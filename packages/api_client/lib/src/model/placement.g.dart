// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placement.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PlacementCWProxy {
  Placement tableId(String tableId);

  Placement x(int x);

  Placement y(int y);

  Placement w(int w);

  Placement h(int h);

  Placement rotation(Rotation rotation);

  Placement shape(TableShape shape);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Placement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Placement(...).copyWith(id: 12, name: "My name")
  /// ````
  Placement call({
    String tableId,
    int x,
    int y,
    int w,
    int h,
    Rotation rotation,
    TableShape shape,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPlacement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPlacement.copyWith.fieldName(...)`
class _$PlacementCWProxyImpl implements _$PlacementCWProxy {
  const _$PlacementCWProxyImpl(this._value);

  final Placement _value;

  @override
  Placement tableId(String tableId) => this(tableId: tableId);

  @override
  Placement x(int x) => this(x: x);

  @override
  Placement y(int y) => this(y: y);

  @override
  Placement w(int w) => this(w: w);

  @override
  Placement h(int h) => this(h: h);

  @override
  Placement rotation(Rotation rotation) => this(rotation: rotation);

  @override
  Placement shape(TableShape shape) => this(shape: shape);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Placement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Placement(...).copyWith(id: 12, name: "My name")
  /// ````
  Placement call({
    Object? tableId = const $CopyWithPlaceholder(),
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
    Object? w = const $CopyWithPlaceholder(),
    Object? h = const $CopyWithPlaceholder(),
    Object? rotation = const $CopyWithPlaceholder(),
    Object? shape = const $CopyWithPlaceholder(),
  }) {
    return Placement(
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String,
      x: x == const $CopyWithPlaceholder()
          ? _value.x
          // ignore: cast_nullable_to_non_nullable
          : x as int,
      y: y == const $CopyWithPlaceholder()
          ? _value.y
          // ignore: cast_nullable_to_non_nullable
          : y as int,
      w: w == const $CopyWithPlaceholder()
          ? _value.w
          // ignore: cast_nullable_to_non_nullable
          : w as int,
      h: h == const $CopyWithPlaceholder()
          ? _value.h
          // ignore: cast_nullable_to_non_nullable
          : h as int,
      rotation: rotation == const $CopyWithPlaceholder()
          ? _value.rotation
          // ignore: cast_nullable_to_non_nullable
          : rotation as Rotation,
      shape: shape == const $CopyWithPlaceholder()
          ? _value.shape
          // ignore: cast_nullable_to_non_nullable
          : shape as TableShape,
    );
  }
}

extension $PlacementCopyWith on Placement {
  /// Returns a callable class that can be used as follows: `instanceOfPlacement.copyWith(...)` or like so:`instanceOfPlacement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PlacementCWProxy get copyWith => _$PlacementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Placement _$PlacementFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('Placement', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const ['table_id', 'x', 'y', 'w', 'h', 'rotation', 'shape'],
  );
  final val = Placement(
    tableId: $checkedConvert('table_id', (v) => v as String),
    x: $checkedConvert('x', (v) => (v as num).toInt()),
    y: $checkedConvert('y', (v) => (v as num).toInt()),
    w: $checkedConvert('w', (v) => (v as num).toInt()),
    h: $checkedConvert('h', (v) => (v as num).toInt()),
    rotation: $checkedConvert(
      'rotation',
      (v) => $enumDecode(_$RotationEnumMap, v),
    ),
    shape: $checkedConvert('shape', (v) => $enumDecode(_$TableShapeEnumMap, v)),
  );
  return val;
}, fieldKeyMap: const {'tableId': 'table_id'});

Map<String, dynamic> _$PlacementToJson(Placement instance) => <String, dynamic>{
  'table_id': instance.tableId,
  'x': instance.x,
  'y': instance.y,
  'w': instance.w,
  'h': instance.h,
  'rotation': _$RotationEnumMap[instance.rotation]!,
  'shape': _$TableShapeEnumMap[instance.shape]!,
};

const _$RotationEnumMap = {
  Rotation.number0: 0,
  Rotation.number90: 90,
  Rotation.number180: 180,
  Rotation.number270: 270,
};

const _$TableShapeEnumMap = {
  TableShape.square: 'square',
  TableShape.round: 'round',
  TableShape.rectangle: 'rectangle',
};
