// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoryListCWProxy {
  CategoryList data(List<Category> data);

  CategoryList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryList(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryList call({List<Category> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategoryList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategoryList.copyWith.fieldName(...)`
class _$CategoryListCWProxyImpl implements _$CategoryListCWProxy {
  const _$CategoryListCWProxyImpl(this._value);

  final CategoryList _value;

  @override
  CategoryList data(List<Category> data) => this(data: data);

  @override
  CategoryList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryList(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return CategoryList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Category>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $CategoryListCopyWith on CategoryList {
  /// Returns a callable class that can be used as follows: `instanceOfCategoryList.copyWith(...)` or like so:`instanceOfCategoryList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoryListCWProxy get copyWith => _$CategoryListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CategoryList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = CategoryList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
