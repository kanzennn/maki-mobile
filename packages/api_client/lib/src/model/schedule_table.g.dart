// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_table.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScheduleTableCWProxy {
  ScheduleTable tableId(String tableId);

  ScheduleTable name(String name);

  ScheduleTable area(AreaRef area);

  ScheduleTable deleted(bool deleted);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleTable call({String tableId, String name, AreaRef area, bool deleted});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScheduleTable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScheduleTable.copyWith.fieldName(...)`
class _$ScheduleTableCWProxyImpl implements _$ScheduleTableCWProxy {
  const _$ScheduleTableCWProxyImpl(this._value);

  final ScheduleTable _value;

  @override
  ScheduleTable tableId(String tableId) => this(tableId: tableId);

  @override
  ScheduleTable name(String name) => this(name: name);

  @override
  ScheduleTable area(AreaRef area) => this(area: area);

  @override
  ScheduleTable deleted(bool deleted) => this(deleted: deleted);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleTable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleTable(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleTable call({
    Object? tableId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? deleted = const $CopyWithPlaceholder(),
  }) {
    return ScheduleTable(
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as AreaRef,
      deleted: deleted == const $CopyWithPlaceholder()
          ? _value.deleted
          // ignore: cast_nullable_to_non_nullable
          : deleted as bool,
    );
  }
}

extension $ScheduleTableCopyWith on ScheduleTable {
  /// Returns a callable class that can be used as follows: `instanceOfScheduleTable.copyWith(...)` or like so:`instanceOfScheduleTable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScheduleTableCWProxy get copyWith => _$ScheduleTableCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleTable _$ScheduleTableFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ScheduleTable', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['table_id', 'name', 'area', 'deleted'],
      );
      final val = ScheduleTable(
        tableId: $checkedConvert('table_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        area: $checkedConvert(
          'area',
          (v) => AreaRef.fromJson(v as Map<String, dynamic>),
        ),
        deleted: $checkedConvert('deleted', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'tableId': 'table_id'});

Map<String, dynamic> _$ScheduleTableToJson(ScheduleTable instance) =>
    <String, dynamic>{
      'table_id': instance.tableId,
      'name': instance.name,
      'area': instance.area.toJson(),
      'deleted': instance.deleted,
    };
