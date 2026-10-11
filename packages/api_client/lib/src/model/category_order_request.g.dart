// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_order_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoryOrderRequestCWProxy {
  CategoryOrderRequest categoryIds(List<String> categoryIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryOrderRequest call({List<String> categoryIds});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategoryOrderRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategoryOrderRequest.copyWith.fieldName(...)`
class _$CategoryOrderRequestCWProxyImpl
    implements _$CategoryOrderRequestCWProxy {
  const _$CategoryOrderRequestCWProxyImpl(this._value);

  final CategoryOrderRequest _value;

  @override
  CategoryOrderRequest categoryIds(List<String> categoryIds) =>
      this(categoryIds: categoryIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CategoryOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CategoryOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CategoryOrderRequest call({
    Object? categoryIds = const $CopyWithPlaceholder(),
  }) {
    return CategoryOrderRequest(
      categoryIds: categoryIds == const $CopyWithPlaceholder()
          ? _value.categoryIds
          // ignore: cast_nullable_to_non_nullable
          : categoryIds as List<String>,
    );
  }
}

extension $CategoryOrderRequestCopyWith on CategoryOrderRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCategoryOrderRequest.copyWith(...)` or like so:`instanceOfCategoryOrderRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CategoryOrderRequestCWProxy get copyWith =>
      _$CategoryOrderRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryOrderRequest _$CategoryOrderRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CategoryOrderRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['category_ids']);
  final val = CategoryOrderRequest(
    categoryIds: $checkedConvert(
      'category_ids',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'categoryIds': 'category_ids'});

Map<String, dynamic> _$CategoryOrderRequestToJson(
  CategoryOrderRequest instance,
) => <String, dynamic>{'category_ids': instance.categoryIds};
