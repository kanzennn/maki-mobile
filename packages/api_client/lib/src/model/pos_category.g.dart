// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_category.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PosCategoryCWProxy {
  PosCategory categoryId(String categoryId);

  PosCategory name(String name);

  PosCategory icon(String? icon);

  PosCategory itemCount(int itemCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  PosCategory call({
    String categoryId,
    String name,
    String? icon,
    int itemCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosCategory.copyWith.fieldName(...)`
class _$PosCategoryCWProxyImpl implements _$PosCategoryCWProxy {
  const _$PosCategoryCWProxyImpl(this._value);

  final PosCategory _value;

  @override
  PosCategory categoryId(String categoryId) => this(categoryId: categoryId);

  @override
  PosCategory name(String name) => this(name: name);

  @override
  PosCategory icon(String? icon) => this(icon: icon);

  @override
  PosCategory itemCount(int itemCount) => this(itemCount: itemCount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PosCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PosCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  PosCategory call({
    Object? categoryId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? icon = const $CopyWithPlaceholder(),
    Object? itemCount = const $CopyWithPlaceholder(),
  }) {
    return PosCategory(
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
      itemCount: itemCount == const $CopyWithPlaceholder()
          ? _value.itemCount
          // ignore: cast_nullable_to_non_nullable
          : itemCount as int,
    );
  }
}

extension $PosCategoryCopyWith on PosCategory {
  /// Returns a callable class that can be used as follows: `instanceOfPosCategory.copyWith(...)` or like so:`instanceOfPosCategory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PosCategoryCWProxy get copyWith => _$PosCategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosCategory _$PosCategoryFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PosCategory',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['category_id', 'name', 'icon', 'item_count'],
    );
    final val = PosCategory(
      categoryId: $checkedConvert('category_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      icon: $checkedConvert('icon', (v) => v as String?),
      itemCount: $checkedConvert('item_count', (v) => (v as num).toInt()),
    );
    return val;
  },
  fieldKeyMap: const {'categoryId': 'category_id', 'itemCount': 'item_count'},
);

Map<String, dynamic> _$PosCategoryToJson(PosCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'icon': instance.icon,
      'item_count': instance.itemCount,
    };
