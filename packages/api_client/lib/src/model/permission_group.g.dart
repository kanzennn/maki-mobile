// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_group.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PermissionGroupCWProxy {
  PermissionGroup module(String module);

  PermissionGroup permissions(List<String> permissions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionGroup call({String module, List<String> permissions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPermissionGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPermissionGroup.copyWith.fieldName(...)`
class _$PermissionGroupCWProxyImpl implements _$PermissionGroupCWProxy {
  const _$PermissionGroupCWProxyImpl(this._value);

  final PermissionGroup _value;

  @override
  PermissionGroup module(String module) => this(module: module);

  @override
  PermissionGroup permissions(List<String> permissions) =>
      this(permissions: permissions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PermissionGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PermissionGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  PermissionGroup call({
    Object? module = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
  }) {
    return PermissionGroup(
      module: module == const $CopyWithPlaceholder()
          ? _value.module
          // ignore: cast_nullable_to_non_nullable
          : module as String,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as List<String>,
    );
  }
}

extension $PermissionGroupCopyWith on PermissionGroup {
  /// Returns a callable class that can be used as follows: `instanceOfPermissionGroup.copyWith(...)` or like so:`instanceOfPermissionGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PermissionGroupCWProxy get copyWith => _$PermissionGroupCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionGroup _$PermissionGroupFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PermissionGroup', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['module', 'permissions']);
      final val = PermissionGroup(
        module: $checkedConvert('module', (v) => v as String),
        permissions: $checkedConvert(
          'permissions',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PermissionGroupToJson(PermissionGroup instance) =>
    <String, dynamic>{
      'module': instance.module,
      'permissions': instance.permissions,
    };
