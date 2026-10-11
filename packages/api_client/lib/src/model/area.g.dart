// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaCWProxy {
  Area areaId(String areaId);

  Area name(String name);

  Area sortOrder(int sortOrder);

  Area tableCount(int tableCount);

  Area createdAt(DateTime createdAt);

  Area updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Area(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Area(...).copyWith(id: 12, name: "My name")
  /// ````
  Area call({
    String areaId,
    String name,
    int sortOrder,
    int tableCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArea.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArea.copyWith.fieldName(...)`
class _$AreaCWProxyImpl implements _$AreaCWProxy {
  const _$AreaCWProxyImpl(this._value);

  final Area _value;

  @override
  Area areaId(String areaId) => this(areaId: areaId);

  @override
  Area name(String name) => this(name: name);

  @override
  Area sortOrder(int sortOrder) => this(sortOrder: sortOrder);

  @override
  Area tableCount(int tableCount) => this(tableCount: tableCount);

  @override
  Area createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Area updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Area(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Area(...).copyWith(id: 12, name: "My name")
  /// ````
  Area call({
    Object? areaId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? sortOrder = const $CopyWithPlaceholder(),
    Object? tableCount = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Area(
      areaId: areaId == const $CopyWithPlaceholder()
          ? _value.areaId
          // ignore: cast_nullable_to_non_nullable
          : areaId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      sortOrder: sortOrder == const $CopyWithPlaceholder()
          ? _value.sortOrder
          // ignore: cast_nullable_to_non_nullable
          : sortOrder as int,
      tableCount: tableCount == const $CopyWithPlaceholder()
          ? _value.tableCount
          // ignore: cast_nullable_to_non_nullable
          : tableCount as int,
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

extension $AreaCopyWith on Area {
  /// Returns a callable class that can be used as follows: `instanceOfArea.copyWith(...)` or like so:`instanceOfArea.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AreaCWProxy get copyWith => _$AreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Area',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'area_id',
        'name',
        'sort_order',
        'table_count',
        'created_at',
        'updated_at',
      ],
    );
    final val = Area(
      areaId: $checkedConvert('area_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      sortOrder: $checkedConvert('sort_order', (v) => (v as num).toInt()),
      tableCount: $checkedConvert('table_count', (v) => (v as num).toInt()),
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
    'areaId': 'area_id',
    'sortOrder': 'sort_order',
    'tableCount': 'table_count',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
  'area_id': instance.areaId,
  'name': instance.name,
  'sort_order': instance.sortOrder,
  'table_count': instance.tableCount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
