// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuCategoryCWProxy {
  MenuCategory categoryId(String categoryId);

  MenuCategory name(String name);

  MenuCategory icon(String? icon);

  MenuCategory isActive(bool isActive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuCategory call({
    String categoryId,
    String name,
    String? icon,
    bool isActive,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuCategory.copyWith.fieldName(...)`
class _$MenuCategoryCWProxyImpl implements _$MenuCategoryCWProxy {
  const _$MenuCategoryCWProxyImpl(this._value);

  final MenuCategory _value;

  @override
  MenuCategory categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  MenuCategory name(String name) => this(name: name);

  @override
  MenuCategory icon(String? icon) => this(icon: icon);

  @override
  MenuCategory isActive(bool isActive) => this(isActive: isActive);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuCategory call({
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
  }) {
    return MenuCategory(
      categoryId: categoryId == const $CopyWithPlaceholder()
          ? _value.categoryId
          // ignore: cast_nullable_to_non_nullable
          : categoryId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      icon: icon == const $CopyWithPlaceholder()
          ? _value.icon
          // ignore: cast_nullable_to_non_nullable
          : icon as String?,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
    );
  }
}

extension $MenuCategoryCopyWith on MenuCategory {
  /// Returns a callable class that can be used as follows: `instanceOfMenuCategory.copyWith(...)` or like so:`instanceOfMenuCategory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuCategoryCWProxy get copyWith => _$MenuCategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MenuCategory',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['category_id', 'name', 'icon', 'is_active'],
        );
        final val = MenuCategory(
          categoryId: $checkedConvert('category_id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          icon: $checkedConvert('icon', (v) => v as String?),
          isActive: $checkedConvert('is_active', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'categoryId': 'category_id', 'isActive': 'is_active'},
    );

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'icon': instance.icon,
      'is_active': instance.isActive,
    };
