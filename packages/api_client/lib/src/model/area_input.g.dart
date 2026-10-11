// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaInputCWProxy {
  AreaInput name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaInput(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaInput call({String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAreaInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAreaInput.copyWith.fieldName(...)`
class _$AreaInputCWProxyImpl implements _$AreaInputCWProxy {
  const _$AreaInputCWProxyImpl(this._value);

  final AreaInput _value;

  @override
  AreaInput name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaInput(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaInput call({Object? name = const $CopyWithPlaceholder()}) {
    return AreaInput(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $AreaInputCopyWith on AreaInput {
  /// Returns a callable class that can be used as follows: `instanceOfAreaInput.copyWith(...)` or like so:`instanceOfAreaInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AreaInputCWProxy get copyWith => _$AreaInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaInput _$AreaInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name']);
      final val = AreaInput(name: $checkedConvert('name', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$AreaInputToJson(AreaInput instance) => <String, dynamic>{
  'name': instance.name,
};
