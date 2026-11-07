// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log_outlet.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionLogOutletCWProxy {
  ActionLogOutlet outletId(String outletId);

  ActionLogOutlet code(String code);

  ActionLogOutlet name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogOutlet call({String outletId, String code, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionLogOutlet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionLogOutlet.copyWith.fieldName(...)`
class _$ActionLogOutletCWProxyImpl implements _$ActionLogOutletCWProxy {
  const _$ActionLogOutletCWProxyImpl(this._value);

  final ActionLogOutlet _value;

  @override
  ActionLogOutlet outletId(String outletId) => this(outletId: outletId);

  @override
  ActionLogOutlet code(String code) => this(code: code);

  @override
  ActionLogOutlet name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogOutlet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogOutlet(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogOutlet call({
    Object? outletId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ActionLogOutlet(
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $ActionLogOutletCopyWith on ActionLogOutlet {
  /// Returns a callable class that can be used as follows: `instanceOfActionLogOutlet.copyWith(...)` or like so:`instanceOfActionLogOutlet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionLogOutletCWProxy get copyWith => _$ActionLogOutletCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLogOutlet _$ActionLogOutletFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActionLogOutlet', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['outlet_id', 'code', 'name']);
      final val = ActionLogOutlet(
        outletId: $checkedConvert('outlet_id', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'outletId': 'outlet_id'});

Map<String, dynamic> _$ActionLogOutletToJson(ActionLogOutlet instance) =>
    <String, dynamic>{
      'outlet_id': instance.outletId,
      'code': instance.code,
      'name': instance.name,
    };
