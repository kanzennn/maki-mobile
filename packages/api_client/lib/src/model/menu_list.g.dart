// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuListCWProxy {
  MenuList data(List<Menu> data);

  MenuList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuList(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuList call({List<Menu> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenuList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenuList.copyWith.fieldName(...)`
class _$MenuListCWProxyImpl implements _$MenuListCWProxy {
  const _$MenuListCWProxyImpl(this._value);

  final MenuList _value;

  @override
  MenuList data(List<Menu> data) => this(data: data);

  @override
  MenuList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MenuList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MenuList(...).copyWith(id: 12, name: "My name")
  /// ````
  MenuList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return MenuList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Menu>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $MenuListCopyWith on MenuList {
  /// Returns a callable class that can be used as follows: `instanceOfMenuList.copyWith(...)` or like so:`instanceOfMenuList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MenuListCWProxy get copyWith => _$MenuListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuList _$MenuListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MenuList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = MenuList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
