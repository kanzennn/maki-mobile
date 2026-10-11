// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_ref.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaRefCWProxy {
  AreaRef areaId(String areaId);

  AreaRef name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaRef(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaRef call({String areaId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAreaRef.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAreaRef.copyWith.fieldName(...)`
class _$AreaRefCWProxyImpl implements _$AreaRefCWProxy {
  const _$AreaRefCWProxyImpl(this._value);

  final AreaRef _value;

  @override
  AreaRef areaId(String areaId) => this(areaId: areaId);

  @override
  AreaRef name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaRef(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaRef(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaRef call({
    Object? areaId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return AreaRef(
      areaId: areaId == const $CopyWithPlaceholder()
          ? _value.areaId
          // ignore: cast_nullable_to_non_nullable
          : areaId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $AreaRefCopyWith on AreaRef {
  /// Returns a callable class that can be used as follows: `instanceOfAreaRef.copyWith(...)` or like so:`instanceOfAreaRef.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AreaRefCWProxy get copyWith => _$AreaRefCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaRef _$AreaRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaRef', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['area_id', 'name']);
      final val = AreaRef(
        areaId: $checkedConvert('area_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'areaId': 'area_id'});

Map<String, dynamic> _$AreaRefToJson(AreaRef instance) => <String, dynamic>{
  'area_id': instance.areaId,
  'name': instance.name,
};
