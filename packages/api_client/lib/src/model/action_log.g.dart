// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_log.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActionLogCWProxy {
  ActionLog actionLogId(String actionLogId);

  ActionLog action(String action);

  ActionLog targetType(String? targetType);

  ActionLog targetId(String? targetId);

  ActionLog user(ActionLogUser? user);

  ActionLog outlet(ActionLogOutlet? outlet);

  ActionLog device(ActionLogDevice? device);

  ActionLog before(Map<String, Object>? before);

  ActionLog after(Map<String, Object>? after);

  ActionLog ip(String? ip);

  ActionLog occurredAt(DateTime occurredAt);

  ActionLog createdAt(DateTime createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLog call({
    String actionLogId,
    String action,
    String? targetType,
    String? targetId,
    ActionLogUser? user,
    ActionLogOutlet? outlet,
    ActionLogDevice? device,
    Map<String, Object>? before,
    Map<String, Object>? after,
    String? ip,
    DateTime occurredAt,
    DateTime createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActionLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActionLog.copyWith.fieldName(...)`
class _$ActionLogCWProxyImpl implements _$ActionLogCWProxy {
  const _$ActionLogCWProxyImpl(this._value);

  final ActionLog _value;

  @override
  ActionLog actionLogId(String actionLogId) => this(actionLogId: actionLogId);

  @override
  ActionLog action(String action) => this(action: action);

  @override
  ActionLog targetType(String? targetType) => this(targetType: targetType);

  @override
  ActionLog targetId(String? targetId) => this(targetId: targetId);

  @override
  ActionLog user(ActionLogUser? user) => this(user: user);

  @override
  ActionLog outlet(ActionLogOutlet? outlet) => this(outlet: outlet);

  @override
  ActionLog device(ActionLogDevice? device) => this(device: device);

  @override
  ActionLog before(Map<String, Object>? before) => this(before: before);

  @override
  ActionLog after(Map<String, Object>? after) => this(after: after);

  @override
  ActionLog ip(String? ip) => this(ip: ip);

  @override
  ActionLog occurredAt(DateTime occurredAt) => this(occurredAt: occurredAt);

  @override
  ActionLog createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActionLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActionLog(...).copyWith(id: 12, name: "My name")
  /// ````
  ActionLog call({
    Object? actionLogId = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
    Object? targetType = const $CopyWithPlaceholder(),
    Object? targetId = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? outlet = const $CopyWithPlaceholder(),
    Object? device = const $CopyWithPlaceholder(),
    Object? before = const $CopyWithPlaceholder(),
    Object? after = const $CopyWithPlaceholder(),
    Object? ip = const $CopyWithPlaceholder(),
    Object? occurredAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return ActionLog(
      actionLogId: actionLogId == const $CopyWithPlaceholder()
          ? _value.actionLogId
          // ignore: cast_nullable_to_non_nullable
          : actionLogId as String,
      action: action == const $CopyWithPlaceholder()
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as String,
      targetType: targetType == const $CopyWithPlaceholder()
          ? _value.targetType
          // ignore: cast_nullable_to_non_nullable
          : targetType as String?,
      targetId: targetId == const $CopyWithPlaceholder()
          ? _value.targetId
          // ignore: cast_nullable_to_non_nullable
          : targetId as String?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as ActionLogUser?,
      outlet: outlet == const $CopyWithPlaceholder()
          ? _value.outlet
          // ignore: cast_nullable_to_non_nullable
          : outlet as ActionLogOutlet?,
      device: device == const $CopyWithPlaceholder()
          ? _value.device
          // ignore: cast_nullable_to_non_nullable
          : device as ActionLogDevice?,
      before: before == const $CopyWithPlaceholder()
          ? _value.before
          // ignore: cast_nullable_to_non_nullable
          : before as Map<String, Object>?,
      after: after == const $CopyWithPlaceholder()
          ? _value.after
          // ignore: cast_nullable_to_non_nullable
          : after as Map<String, Object>?,
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      occurredAt: occurredAt == const $CopyWithPlaceholder()
          ? _value.occurredAt
          // ignore: cast_nullable_to_non_nullable
          : occurredAt as DateTime,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $ActionLogCopyWith on ActionLog {
  /// Returns a callable class that can be used as follows: `instanceOfActionLog.copyWith(...)` or like so:`instanceOfActionLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActionLogCWProxy get copyWith => _$ActionLogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionLog _$ActionLogFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ActionLog',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'action_log_id',
        'action',
        'target_type',
        'target_id',
        'user',
        'outlet',
        'device',
        'before',
        'after',
        'ip',
        'occurred_at',
        'created_at',
      ],
    );
    final val = ActionLog(
      actionLogId: $checkedConvert('action_log_id', (v) => v as String),
      action: $checkedConvert('action', (v) => v as String),
      targetType: $checkedConvert('target_type', (v) => v as String?),
      targetId: $checkedConvert('target_id', (v) => v as String?),
      user: $checkedConvert(
        'user',
        (v) => v == null
            ? null
            : ActionLogUser.fromJson(v as Map<String, dynamic>),
      ),
      outlet: $checkedConvert(
        'outlet',
        (v) => v == null
            ? null
            : ActionLogOutlet.fromJson(v as Map<String, dynamic>),
      ),
      device: $checkedConvert(
        'device',
        (v) => v == null
            ? null
            : ActionLogDevice.fromJson(v as Map<String, dynamic>),
      ),
      before: $checkedConvert(
        'before',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      after: $checkedConvert(
        'after',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      ip: $checkedConvert('ip', (v) => v as String?),
      occurredAt: $checkedConvert(
        'occurred_at',
        (v) => DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'actionLogId': 'action_log_id',
    'targetType': 'target_type',
    'targetId': 'target_id',
    'occurredAt': 'occurred_at',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$ActionLogToJson(ActionLog instance) => <String, dynamic>{
  'action_log_id': instance.actionLogId,
  'action': instance.action,
  'target_type': instance.targetType,
  'target_id': instance.targetId,
  'user': instance.user?.toJson(),
  'outlet': instance.outlet?.toJson(),
  'device': instance.device?.toJson(),
  'before': instance.before,
  'after': instance.after,
  'ip': instance.ip,
  'occurred_at': instance.occurredAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};
