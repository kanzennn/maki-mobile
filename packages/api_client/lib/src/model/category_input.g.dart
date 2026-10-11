// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoryInputCWProxy {
  CategoryInput name(String name);

  CategoryInput icon(String? icon);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryInput(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryInput call({String name, String? icon});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategoryInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategoryInput.copyWith.fieldName(...)`
class _$CategoryInputCWProxyImpl implements _$CategoryInputCWProxy {
  const _$CategoryInputCWProxyImpl(this._value);

  final CategoryInput _value;

  @override
  CategoryInput name(String name) => this(name: name);

  @override
  CategoryInput icon(String? icon) => this(icon: icon);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryInput(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryInput call({
    Object? name = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
  }) {
    return CategoryInput(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String?,
    );
  }
}

extension $CategoryInputCopyWith on CategoryInput {
  /// Returns a callable class that can be used as follows: `instanceOfCategoryInput.copyWith(...)` or like so:`instanceOfCategoryInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoryInputCWProxy get copyWith => _$CategoryInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInput _$CategoryInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CategoryInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name']);
      final val = CategoryInput(
        name: $checkedConvert('name', (v) => v as String),
        icon: $checkedConvert('icon', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$CategoryInputToJson(CategoryInput instance) =>
    <String, dynamic>{'name': instance.name, 'icon': ?instance.icon};
