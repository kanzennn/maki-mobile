// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionLogListCWProxy {
  ActionLogList data(List<ActionLog> data);

  ActionLogList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogList(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogList call({List<ActionLog> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionLogList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionLogList.copyWith.fieldName(...)`
class _$ActionLogListCWProxyImpl implements _$ActionLogListCWProxy {
  const _$ActionLogListCWProxyImpl(this._value);

  final ActionLogList _value;

  @override
  ActionLogList data(List<ActionLog> data) => this(data: data);

  @override
  ActionLogList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLogList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLogList(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLogList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return ActionLogList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<ActionLog>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $ActionLogListCopyWith on ActionLogList {
  /// Returns a callable class that can be used as follows: `instanceOfActionLogList.copyWith(...)` or like so:`instanceOfActionLogList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionLogListCWProxy get copyWith => _$ActionLogListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLogList _$ActionLogListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActionLogList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ActionLogList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => ActionLog.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ActionLogListToJson(ActionLogList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
