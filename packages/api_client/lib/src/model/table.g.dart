// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TableCWProxy {
  Table tableId(String tableId);

  Table area(AreaRef area);

  Table name(String name);

  Table capacity(int? capacity);

  Table shape(TableShape shape);

  Table box(Box? box);

  Table rotation(Rotation rotation);

  Table isActive(bool isActive);

  Table status(TableStatus status);

  Table seated(Seated? seated);

  Table createdAt(DateTime createdAt);

  Table updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Table(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Table(...).copyWith(id: 12, name: "My name")
  /// ````
  Table call({
    String tableId,
    AreaRef area,
    String name,
    int? capacity,
    TableShape shape,
    Box? box,
    Rotation rotation,
    bool isActive,
    TableStatus status,
    Seated? seated,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTable.copyWith.fieldName(...)`
class _$TableCWProxyImpl implements _$TableCWProxy {
  const _$TableCWProxyImpl(this._value);

  final Table _value;

  @override
  Table tableId(String tableId) => this(tableId: tableId);

  @override
  Table area(AreaRef area) => this(area: area);

  @override
  Table name(String name) => this(name: name);

  @override
  Table capacity(int? capacity) => this(capacity: capacity);

  @override
  Table shape(TableShape shape) => this(shape: shape);

  @override
  Table box(Box? box) => this(box: box);

  @override
  Table rotation(Rotation rotation) => this(rotation: rotation);

  @override
  Table isActive(bool isActive) => this(isActive: isActive);

  @override
  Table status(TableStatus status) => this(status: status);

  @override
  Table seated(Seated? seated) => this(seated: seated);

  @override
  Table createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Table updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Table(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Table(...).copyWith(id: 12, name: "My name")
  /// ````
  Table call({
    Object? tableId = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? capacity = const $CopyWithPlaceholder(),
    Object? shape = const $CopyWithPlaceholder(),
    Object? box = const $CopyWithPlaceholder(),
    Object? rotation = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? seated = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Table(
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as AreaRef,
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
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TableStatus,
      seated: seated == const $CopyWithPlaceholder()
          ? _value.seated
          // ignore: cast_nullable_to_non_nullable
          : seated as Seated?,
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

extension $TableCopyWith on Table {
  /// Returns a callable class that can be used as follows: `instanceOfTable.copyWith(...)` or like so:`instanceOfTable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TableCWProxy get copyWith => _$TableCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Table _$TableFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Table',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'table_id',
        'area',
        'name',
        'capacity',
        'shape',
        'box',
        'rotation',
        'is_active',
        'status',
        'seated',
        'created_at',
        'updated_at',
      ],
    );
    final val = Table(
      tableId: $checkedConvert('table_id', (v) => v as String),
      area: $checkedConvert(
        'area',
        (v) => AreaRef.fromJson(v as Map<String, dynamic>),
      ),
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
      isActive: $checkedConvert('is_active', (v) => v as bool),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$TableStatusEnumMap, v),
      ),
      seated: $checkedConvert(
        'seated',
        (v) => v == null ? null : Seated.fromJson(v as Map<String, dynamic>),
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
    'tableId': 'table_id',
    'isActive': 'is_active',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
  'table_id': instance.tableId,
  'area': instance.area.toJson(),
  'name': instance.name,
  'capacity': instance.capacity,
  'shape': _$TableShapeEnumMap[instance.shape]!,
  'box': instance.box?.toJson(),
  'rotation': _$RotationEnumMap[instance.rotation]!,
  'is_active': instance.isActive,
  'status': _$TableStatusEnumMap[instance.status]!,
  'seated': instance.seated?.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
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
