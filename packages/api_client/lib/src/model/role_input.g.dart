// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RoleInputCWProxy {
  RoleInput name(String name);

  RoleInput description(String? description);

  RoleInput permissions(List<String>? permissions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleInput(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleInput call({String name, String? description, List<String>? permissions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRoleInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRoleInput.copyWith.fieldName(...)`
class _$RoleInputCWProxyImpl implements _$RoleInputCWProxy {
  const _$RoleInputCWProxyImpl(this._value);

  final RoleInput _value;

  @override
  RoleInput name(String name) => this(name: name);

  @override
  RoleInput description(String? description) => this(description: description);

  @override
  RoleInput permissions(List<String>? permissions) =>
      this(permissions: permissions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RoleInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RoleInput(...).copyWith(id: 12, name: "My name")
  /// ````
  RoleInput call({
    Object? name = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
  }) {
    return RoleInput(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as List<String>?,
    );
  }
}

extension $RoleInputCopyWith on RoleInput {
  /// Returns a callable class that can be used as follows: `instanceOfRoleInput.copyWith(...)` or like so:`instanceOfRoleInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RoleInputCWProxy get copyWith => _$RoleInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleInput _$RoleInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RoleInput', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name']);
      final val = RoleInput(
        name: $checkedConvert('name', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        permissions: $checkedConvert(
          'permissions',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RoleInputToJson(RoleInput instance) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
  'permissions': ?instance.permissions,
};
