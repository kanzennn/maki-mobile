// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BoxCWProxy {
  Box x(int x);

  Box y(int y);

  Box w(int w);

  Box h(int h);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Box(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Box(...).copyWith(id: 12, name: "My name")
  /// ````
  Box call({int x, int y, int w, int h});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBox.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBox.copyWith.fieldName(...)`
class _$BoxCWProxyImpl implements _$BoxCWProxy {
  const _$BoxCWProxyImpl(this._value);

  final Box _value;

  @override
  Box x(int x) => this(x: x);

  @override
  Box y(int y) => this(y: y);

  @override
  Box w(int w) => this(w: w);

  @override
  Box h(int h) => this(h: h);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Box(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Box(...).copyWith(id: 12, name: "My name")
  /// ````
  Box call({
    Object? x = const $CopyWithPlaceholder(),
    Object? y = const $CopyWithPlaceholder(),
    Object? w = const $CopyWithPlaceholder(),
    Object? h = const $CopyWithPlaceholder(),
  }) {
    return Box(
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
    );
  }
}

extension $BoxCopyWith on Box {
  /// Returns a callable class that can be used as follows: `instanceOfBox.copyWith(...)` or like so:`instanceOfBox.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BoxCWProxy get copyWith => _$BoxCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Box _$BoxFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Box', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['x', 'y', 'w', 'h']);
      final val = Box(
        x: $checkedConvert('x', (v) => (v as num).toInt()),
        y: $checkedConvert('y', (v) => (v as num).toInt()),
        w: $checkedConvert('w', (v) => (v as num).toInt()),
        h: $checkedConvert('h', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$BoxToJson(Box instance) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'w': instance.w,
  'h': instance.h,
};
