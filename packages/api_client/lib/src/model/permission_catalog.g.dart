// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_catalog.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PermissionCatalogCWProxy {
  PermissionCatalog groups(List<PermissionGroup> groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionCatalog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionCatalog(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionCatalog call({List<PermissionGroup> groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPermissionCatalog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPermissionCatalog.copyWith.fieldName(...)`
class _$PermissionCatalogCWProxyImpl implements _$PermissionCatalogCWProxy {
  const _$PermissionCatalogCWProxyImpl(this._value);

  final PermissionCatalog _value;

  @override
  PermissionCatalog groups(List<PermissionGroup> groups) =>
      this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionCatalog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionCatalog(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionCatalog call({Object? groups = const $CopyWithPlaceholder()}) {
    return PermissionCatalog(
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<PermissionGroup>,
    );
  }
}

extension $PermissionCatalogCopyWith on PermissionCatalog {
  /// Returns a callable class that can be used as follows: `instanceOfPermissionCatalog.copyWith(...)` or like so:`instanceOfPermissionCatalog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PermissionCatalogCWProxy get copyWith =>
      _$PermissionCatalogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionCatalog _$PermissionCatalogFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PermissionCatalog', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['groups']);
      final val = PermissionCatalog(
        groups: $checkedConvert(
          'groups',
          (v) => (v as List<dynamic>)
              .map((e) => PermissionGroup.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PermissionCatalogToJson(PermissionCatalog instance) =>
    <String, dynamic>{
      'groups': instance.groups.map((e) => e.toJson()).toList(),
    };
