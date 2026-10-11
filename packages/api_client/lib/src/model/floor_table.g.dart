// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_table.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FloorTableCWProxy {
  FloorTable tableId(String tableId);

  FloorTable name(String name);

  FloorTable capacity(int? capacity);

  FloorTable shape(TableShape shape);

  FloorTable box(Box? box);

  FloorTable rotation(Rotation rotation);

  FloorTable status(TableStatus status);

  FloorTable seated(Seated? seated);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FloorTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FloorTable(...).copyWith(id: 12, name: "My name")
  /// ````
  FloorTable call({
    String tableId,
    String name,
    int? capacity,
    TableShape shape,
    Box? box,
    Rotation rotation,
    TableStatus status,
    Seated? seated,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFloorTable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFloorTable.copyWith.fieldName(...)`
class _$FloorTableCWProxyImpl implements _$FloorTableCWProxy {
  const _$FloorTableCWProxyImpl(this._value);

  final FloorTable _value;

  @override
  FloorTable tableId(String tableId) => this(tableId: tableId);

  @override
  FloorTable name(String name) => this(name: name);

  @override
  FloorTable capacity(int? capacity) => this(capacity: capacity);

  @override
  FloorTable shape(TableShape shape) => this(shape: shape);

  @override
  FloorTable box(Box? box) => this(box: box);

  @override
  FloorTable rotation(Rotation rotation) => this(rotation: rotation);

  @override
  FloorTable status(TableStatus status) => this(status: status);

  @override
  FloorTable seated(Seated? seated) => this(seated: seated);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FloorTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FloorTable(...).copyWith(id: 12, name: "My name")
  /// ````
  FloorTable call({
    Object? tableId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? capacity = const $CopyWithPlaceholder(),
    Object? shape = const $CopyWithPlaceholder(),
    Object? box = const $CopyWithPlaceholder(),
    Object? rotation = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? seated = const $CopyWithPlaceholder(),
  }) {
    return FloorTable(
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      capacity: capacity == const $CopyWithPlaceholder()
          ? _value.capacity
          // ignore: cast_nullable_to_non_nullable
          : capacity as int?,
      shape: shape == const $CopyWithPlaceholder()
          ? _value.shape
          // ignore: cast_nullable_to_non_nullable
          : shape as TableShape,
      box: box == const $CopyWithPlaceholder()
          ? _value.box
          // ignore: cast_nullable_to_non_nullable
          : box as Box?,
      rotation: rotation == const $CopyWithPlaceholder()
          ? _value.rotation
          // ignore: cast_nullable_to_non_nullable
          : rotation as Rotation,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TableStatus,
      seated: seated == const $CopyWithPlaceholder()
          ? _value.seated
          // ignore: cast_nullable_to_non_nullable
          : seated as Seated?,
    );
  }
}

extension $FloorTableCopyWith on FloorTable {
  /// Returns a callable class that can be used as follows: `instanceOfFloorTable.copyWith(...)` or like so:`instanceOfFloorTable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FloorTableCWProxy get copyWith => _$FloorTableCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloorTable _$FloorTableFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FloorTable', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'table_id',
          'name',
          'capacity',
          'shape',
          'box',
          'rotation',
          'status',
          'seated',
        ],
      );
      final val = FloorTable(
        tableId: $checkedConvert('table_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt()),
        shape: $checkedConvert(
          'shape',
          (v) => $enumDecode(_$TableShapeEnumMap, v),
        ),
        box: $checkedConvert(
          'box',
          (v) => v == null ? null : Box.fromJson(v as Map<String, dynamic>),
        ),
        rotation: $checkedConvert(
          'rotation',
          (v) => $enumDecode(_$RotationEnumMap, v),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$TableStatusEnumMap, v),
        ),
        seated: $checkedConvert(
          'seated',
          (v) => v == null ? null : Seated.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    }, fieldKeyMap: const {'tableId': 'table_id'});

Map<String, dynamic> _$FloorTableToJson(FloorTable instance) =>
    <String, dynamic>{
      'table_id': instance.tableId,
      'name': instance.name,
      'capacity': instance.capacity,
      'shape': _$TableShapeEnumMap[instance.shape]!,
      'box': instance.box?.toJson(),
      'rotation': _$RotationEnumMap[instance.rotation]!,
      'status': _$TableStatusEnumMap[instance.status]!,
      'seated': instance.seated?.toJson(),
    };

const _$TableShapeEnumMap = {
  TableShape.square: 'square',
  TableShape.round: 'round',
  TableShape.rectangle: 'rectangle',
};

const _$RotationEnumMap = {
  Rotation.number0: 0,
  Rotation.number90: 90,
  Rotation.number180: 180,
  Rotation.number270: 270,
};

const _$TableStatusEnumMap = {
  TableStatus.available: 'available',
  TableStatus.occupied: 'occupied',
  TableStatus.inactive: 'inactive',
  TableStatus.scheduled: 'scheduled',
};
