// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DecorationCWProxy {
  Decoration kind(DecorationKind kind);

  Decoration x(int x);

  Decoration y(int y);

  Decoration w(int w);

  Decoration h(int h);

  Decoration rotation(Rotation rotation);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Decoration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Decoration(...).copyWith(id: 12, name: "My name")
  /// ````
  Decoration call({
    DecorationKind kind,
    int x,
    int y,
    int w,
    int h,
    Rotation rotation,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDecoration.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDecoration.copyWith.fieldName(...)`
class _$DecorationCWProxyImpl implements _$DecorationCWProxy {
  const _$DecorationCWProxyImpl(this._value);

  final Decoration _value;

  @override
  Decoration kind(DecorationKind kind) => this(kind: kind);

  @override
  Decoration x(int x) => this(x: x);

  @override
  Decoration y(int y) => this(y: y);

  @override
  Decoration w(int w) => this(w: w);

  @override
  Decoration h(int h) => this(h: h);

  @override
  Decoration rotation(Rotation rotation) => this(rotation: rotation);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Decoration(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Decoration(...).copyWith(id: 12, name: "My name")
  /// ````
  Decoration call({
    Object? kind = const $CopyWithPlaceholder(),
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
    Object? w = const $CopyWithPlaceholder(),
    Object? h = const $CopyWithPlaceholder(),
    Object? rotation = const $CopyWithPlaceholder(),
  }) {
    return Decoration(
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as DecorationKind,
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
    );
  }
}

extension $DecorationCopyWith on Decoration {
  /// Returns a callable class that can be used as follows: `instanceOfDecoration.copyWith(...)` or like so:`instanceOfDecoration.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DecorationCWProxy get copyWith => _$DecorationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Decoration _$DecorationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Decoration', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['kind', 'x', 'y', 'w', 'h', 'rotation'],
      );
      final val = Decoration(
        kind: $checkedConvert(
          'kind',
          (v) => $enumDecode(_$DecorationKindEnumMap, v),
        ),
        x: $checkedConvert('x', (v) => (v as num).toInt()),
        y: $checkedConvert('y', (v) => (v as num).toInt()),
        w: $checkedConvert('w', (v) => (v as num).toInt()),
        h: $checkedConvert('h', (v) => (v as num).toInt()),
        rotation: $checkedConvert(
          'rotation',
          (v) => $enumDecode(_$RotationEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DecorationToJson(Decoration instance) =>
    <String, dynamic>{
      'kind': _$DecorationKindEnumMap[instance.kind]!,
      'x': instance.x,
      'y': instance.y,
      'w': instance.w,
      'h': instance.h,
      'rotation': _$RotationEnumMap[instance.rotation]!,
    };

const _$DecorationKindEnumMap = {
  DecorationKind.wall: 'wall',
  DecorationKind.cashier: 'cashier',
  DecorationKind.door: 'door',
};

const _$RotationEnumMap = {
  Rotation.number0: 0,
  Rotation.number90: 90,
  Rotation.number180: 180,
  Rotation.number270: 270,
};
