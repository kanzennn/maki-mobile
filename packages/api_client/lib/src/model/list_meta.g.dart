// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_meta.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListMetaCWProxy {
  ListMeta page(int page);

  ListMeta pageSize(int pageSize);

  ListMeta total(int total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListMeta(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListMeta(...).copyWith(id: 12, name: "My name")
  /// ````
  ListMeta call({int page, int pageSize, int total});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListMeta.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListMeta.copyWith.fieldName(...)`
class _$ListMetaCWProxyImpl implements _$ListMetaCWProxy {
  const _$ListMetaCWProxyImpl(this._value);

  final ListMeta _value;

  @override
  ListMeta page(int page) => this(page: page);

  @override
  ListMeta pageSize(int pageSize) => this(pageSize: pageSize);

  @override
  ListMeta total(int total) => this(total: total);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListMeta(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListMeta(...).copyWith(id: 12, name: "My name")
  /// ````
  ListMeta call({
    Object? page = const $CopyWithPlaceholder(),
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return ListMeta(
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      pageSize: pageSize == const $CopyWithPlaceholder()
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
    );
  }
}

extension $ListMetaCopyWith on ListMeta {
  /// Returns a callable class that can be used as follows: `instanceOfListMeta.copyWith(...)` or like so:`instanceOfListMeta.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListMetaCWProxy get copyWith => _$ListMetaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMeta _$ListMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListMeta', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['page', 'page_size', 'total']);
      final val = ListMeta(
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        pageSize: $checkedConvert('page_size', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'pageSize': 'page_size'});

Map<String, dynamic> _$ListMetaToJson(ListMeta instance) => <String, dynamic>{
  'page': instance.page,
  'page_size': instance.pageSize,
  'total': instance.total,
};
