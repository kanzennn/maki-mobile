// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LayoutInputCWProxy {
  LayoutInput version(int version);

  LayoutInput tables(List<Placement> tables);

  LayoutInput decorations(List<Decoration> decorations);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LayoutInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LayoutInput(...).copyWith(id: 12, name: "My name")
  /// ````
  LayoutInput call({
    int version,
    List<Placement> tables,
    List<Decoration> decorations,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLayoutInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLayoutInput.copyWith.fieldName(...)`
class _$LayoutInputCWProxyImpl implements _$LayoutInputCWProxy {
  const _$LayoutInputCWProxyImpl(this._value);

  final LayoutInput _value;

  @override
  LayoutInput version(int version) => this(version: version);

  @override
  LayoutInput tables(List<Placement> tables) => this(tables: tables);

  @override
  LayoutInput decorations(List<Decoration> decorations) =>
      this(decorations: decorations);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LayoutInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LayoutInput(...).copyWith(id: 12, name: "My name")
  /// ````
  LayoutInput call({
    Object? version = const $CopyWithPlaceholder(),
    Object? tables = const $CopyWithPlaceholder(),
    Object? decorations = const $CopyWithPlaceholder(),
  }) {
    return LayoutInput(
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
      tables: tables == const $CopyWithPlaceholder()
          ? _value.tables
          // ignore: cast_nullable_to_non_nullable
          : tables as List<Placement>,
      decorations: decorations == const $CopyWithPlaceholder()
          ? _value.decorations
          // ignore: cast_nullable_to_non_nullable
          : decorations as List<Decoration>,
    );
  }
}

extension $LayoutInputCopyWith on LayoutInput {
  /// Returns a callable class that can be used as follows: `instanceOfLayoutInput.copyWith(...)` or like so:`instanceOfLayoutInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LayoutInputCWProxy get copyWith => _$LayoutInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayoutInput _$LayoutInputFromJson(Map<String, dynamic> json) => $checkedCreate(
  'LayoutInput',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['version', 'tables', 'decorations']);
    final val = LayoutInput(
      version: $checkedConvert('version', (v) => (v as num).toInt()),
      tables: $checkedConvert(
        'tables',
        (v) => (v as List<dynamic>)
            .map((e) => Placement.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      decorations: $checkedConvert(
        'decorations',
        (v) => (v as List<dynamic>)
            .map((e) => Decoration.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$LayoutInputToJson(LayoutInput instance) =>
    <String, dynamic>{
      'version': instance.version,
      'tables': instance.tables.map((e) => e.toJson()).toList(),
      'decorations': instance.decorations.map((e) => e.toJson()).toList(),
    };
