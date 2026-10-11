// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TableInputCWProxy {
  TableInput name(String name);

  TableInput areaId(String areaId);

  TableInput capacity(int? capacity);

  TableInput shape(TableShape? shape);

  TableInput isActive(bool? isActive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableInput(...).copyWith(id: 12, name: "My name")
  /// ````
  TableInput call({
    String name,
    String areaId,
    int? capacity,
    TableShape? shape,
    bool? isActive,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTableInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTableInput.copyWith.fieldName(...)`
class _$TableInputCWProxyImpl implements _$TableInputCWProxy {
  const _$TableInputCWProxyImpl(this._value);

  final TableInput _value;

  @override
  TableInput name(String name) => this(name: name);

  @override
  TableInput areaId(String areaId) => this(areaId: areaId);

  @override
  TableInput capacity(int? capacity) => this(capacity: capacity);

  @override
  TableInput shape(TableShape? shape) => this(shape: shape);

  @override
  TableInput isActive(bool? isActive) => this(isActive: isActive);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TableInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TableInput(...).copyWith(id: 12, name: "My name")
  /// ````
  TableInput call({
    Object? name = const $CopyWithPlaceholder(),
    Object? areaId = const $CopyWithPlaceholder(),
    Object? capacity = const $CopyWithPlaceholder(),
    Object? shape = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
  }) {
    return TableInput(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      areaId: areaId == const $CopyWithPlaceholder()
          ? _value.areaId
          // ignore: cast_nullable_to_non_nullable
          : areaId as String,
      capacity: capacity == const $CopyWithPlaceholder()
          ? _value.capacity
          // ignore: cast_nullable_to_non_nullable
          : capacity as int?,
      shape: shape == const $CopyWithPlaceholder()
          ? _value.shape
          // ignore: cast_nullable_to_non_nullable
          : shape as TableShape?,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool?,
    );
  }
}

extension $TableInputCopyWith on TableInput {
  /// Returns a callable class that can be used as follows: `instanceOfTableInput.copyWith(...)` or like so:`instanceOfTableInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TableInputCWProxy get copyWith => _$TableInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableInput _$TableInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TableInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name', 'area_id']);
      final val = TableInput(
        name: $checkedConvert('name', (v) => v as String),
        areaId: $checkedConvert('area_id', (v) => v as String),
        capacity: $checkedConvert('capacity', (v) => (v as num?)?.toInt()),
        shape: $checkedConvert(
          'shape',
          (v) => $enumDecodeNullable(_$TableShapeEnumMap, v),
        ),
        isActive: $checkedConvert('is_active', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'areaId': 'area_id', 'isActive': 'is_active'});

Map<String, dynamic> _$TableInputToJson(TableInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'area_id': instance.areaId,
      'capacity': ?instance.capacity,
      'shape': ?_$TableShapeEnumMap[instance.shape],
      'is_active': ?instance.isActive,
    };

const _$TableShapeEnumMap = {
  TableShape.square: 'square',
  TableShape.round: 'round',
  TableShape.rectangle: 'rectangle',
};
