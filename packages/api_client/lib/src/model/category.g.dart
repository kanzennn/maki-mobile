// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoryCWProxy {
  Category categoryId(String categoryId);

  Category name(String name);

  Category icon(String? icon);

  Category sortOrder(int sortOrder);

  Category isActive(bool isActive);

  Category menuCount(int menuCount);

  Category createdAt(DateTime createdAt);

  Category updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    String categoryId,
    String name,
    String? icon,
    int sortOrder,
    bool isActive,
    int menuCount,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategory.copyWith.fieldName(...)`
class _$CategoryCWProxyImpl implements _$CategoryCWProxy {
  const _$CategoryCWProxyImpl(this._value);

  final Category _value;

  @override
  Category categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  Category name(String name) => this(name: name);

  @override
  Category icon(String? icon) => this(icon: icon);

  @override
  Category sortOrder(int sortOrder) => this(sortOrder: sortOrder);

  @override
  Category isActive(bool isActive) => this(isActive: isActive);

  @override
  Category menuCount(int menuCount) => this(menuCount: menuCount);

  @override
  Category createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Category updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? sortOrder = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? menuCount = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Category(
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
      sortOrder: sortOrder == const $CopyWithPlaceholder()
          ? _value.sortOrder
          // ignore: cast_nullable_to_non_nullable
          : sortOrder as int,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
      menuCount: menuCount == const $CopyWithPlaceholder()
          ? _value.menuCount
          // ignore: cast_nullable_to_non_nullable
          : menuCount as int,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $CategoryCopyWith on Category {
  /// Returns a callable class that can be used as follows: `instanceOfCategory.copyWith(...)` or like so:`instanceOfCategory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoryCWProxy get copyWith => _$CategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Category',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'category_id',
        'name',
        'icon',
        'sort_order',
        'is_active',
        'menu_count',
        'created_at',
        'updated_at',
      ],
    );
    final val = Category(
      categoryId: $checkedConvert('category_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      icon: $checkedConvert('icon', (v) => v as String?),
      sortOrder: $checkedConvert('sort_order', (v) => (v as num).toInt()),
      isActive: $checkedConvert('is_active', (v) => v as bool),
      menuCount: $checkedConvert('menu_count', (v) => (v as num).toInt()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'categoryId': 'category_id',
    'sortOrder': 'sort_order',
    'isActive': 'is_active',
    'menuCount': 'menu_count',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'category_id': instance.categoryId,
  'name': instance.name,
  'icon': instance.icon,
  'sort_order': instance.sortOrder,
  'is_active': instance.isActive,
  'menu_count': instance.menuCount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
