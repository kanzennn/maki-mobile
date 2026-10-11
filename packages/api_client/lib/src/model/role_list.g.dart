// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleListCWProxy {
  RoleList data(List<Role> data);

  RoleList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleList(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleList call({List<Role> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoleList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoleList.copyWith.fieldName(...)`
class _$RoleListCWProxyImpl implements _$RoleListCWProxy {
  const _$RoleListCWProxyImpl(this._value);

  final RoleList _value;

  @override
  RoleList data(List<Role> data) => this(data: data);

  @override
  RoleList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleList(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return RoleList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Role>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $RoleListCopyWith on RoleList {
  /// Returns a callable class that can be used as follows: `instanceOfRoleList.copyWith(...)` or like so:`instanceOfRoleList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleListCWProxy get copyWith => _$RoleListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleList _$RoleListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoleList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = RoleList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Role.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RoleListToJson(RoleList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
