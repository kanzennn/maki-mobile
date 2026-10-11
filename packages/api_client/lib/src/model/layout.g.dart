// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LayoutCWProxy {
  Layout area(AreaRef area);

  Layout version(int version);

  Layout decorations(List<Decoration> decorations);

  Layout tables(List<Table> tables);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Layout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Layout(...).copyWith(id: 12, name: "My name")
  /// ````
  Layout call({
    AreaRef area,
    int version,
    List<Decoration> decorations,
    List<Table> tables,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLayout.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLayout.copyWith.fieldName(...)`
class _$LayoutCWProxyImpl implements _$LayoutCWProxy {
  const _$LayoutCWProxyImpl(this._value);

  final Layout _value;

  @override
  Layout area(AreaRef area) => this(area: area);

  @override
  Layout version(int version) => this(version: version);

  @override
  Layout decorations(List<Decoration> decorations) =>
      this(decorations: decorations);

  @override
  Layout tables(List<Table> tables) => this(tables: tables);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Layout(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Layout(...).copyWith(id: 12, name: "My name")
  /// ````
  Layout call({
    Object? area = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? decorations = const $CopyWithPlaceholder(),
    Object? tables = const $CopyWithPlaceholder(),
  }) {
    return Layout(
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as AreaRef,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as int,
      decorations: decorations == const $CopyWithPlaceholder()
          ? _value.decorations
          // ignore: cast_nullable_to_non_nullable
          : decorations as List<Decoration>,
      tables: tables == const $CopyWithPlaceholder()
          ? _value.tables
          // ignore: cast_nullable_to_non_nullable
          : tables as List<Table>,
    );
  }
}

extension $LayoutCopyWith on Layout {
  /// Returns a callable class that can be used as follows: `instanceOfLayout.copyWith(...)` or like so:`instanceOfLayout.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LayoutCWProxy get copyWith => _$LayoutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Layout _$LayoutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Layout', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['area', 'version', 'decorations', 'tables'],
      );
      final val = Layout(
        area: $checkedConvert(
          'area',
          (v) => AreaRef.fromJson(v as Map<String, dynamic>),
        ),
        version: $checkedConvert('version', (v) => (v as num).toInt()),
        decorations: $checkedConvert(
          'decorations',
          (v) => (v as List<dynamic>)
              .map((e) => Decoration.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        tables: $checkedConvert(
          'tables',
          (v) => (v as List<dynamic>)
              .map((e) => Table.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LayoutToJson(Layout instance) => <String, dynamic>{
  'area': instance.area.toJson(),
  'version': instance.version,
  'decorations': instance.decorations.map((e) => e.toJson()).toList(),
  'tables': instance.tables.map((e) => e.toJson()).toList(),
};
