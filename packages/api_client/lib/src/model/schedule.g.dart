// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScheduleCWProxy {
  Schedule scheduleId(String scheduleId);

  Schedule title(String title);

  Schedule startAt(DateTime startAt);

  Schedule endAt(DateTime endAt);

  Schedule status(ScheduleStatus status);

  Schedule tables(List<ScheduleTable> tables);

  Schedule createdBy(UserRef createdBy);

  Schedule cancelledAt(DateTime? cancelledAt);

  Schedule cancelledBy(UserRef? cancelledBy);

  Schedule createdAt(DateTime createdAt);

  Schedule updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Schedule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Schedule(...).copyWith(id: 12, name: "My name")
  /// ````
  Schedule call({
    String scheduleId,
    String title,
    DateTime startAt,
    DateTime endAt,
    ScheduleStatus status,
    List<ScheduleTable> tables,
    UserRef createdBy,
    DateTime? cancelledAt,
    UserRef? cancelledBy,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchedule.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchedule.copyWith.fieldName(...)`
class _$ScheduleCWProxyImpl implements _$ScheduleCWProxy {
  const _$ScheduleCWProxyImpl(this._value);

  final Schedule _value;

  @override
  Schedule scheduleId(String scheduleId) => this(scheduleId: scheduleId);

  @override
  Schedule title(String title) => this(title: title);

  @override
  Schedule startAt(DateTime startAt) => this(startAt: startAt);

  @override
  Schedule endAt(DateTime endAt) => this(endAt: endAt);

  @override
  Schedule status(ScheduleStatus status) => this(status: status);

  @override
  Schedule tables(List<ScheduleTable> tables) => this(tables: tables);

  @override
  Schedule createdBy(UserRef createdBy) => this(createdBy: createdBy);

  @override
  Schedule cancelledAt(DateTime? cancelledAt) => this(cancelledAt: cancelledAt);

  @override
  Schedule cancelledBy(UserRef? cancelledBy) => this(cancelledBy: cancelledBy);

  @override
  Schedule createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Schedule updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Schedule(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Schedule(...).copyWith(id: 12, name: "My name")
  /// ````
  Schedule call({
    Object? scheduleId = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? startAt = const $CopyWithPlaceholder(),
    Object? endAt = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? tables = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
    Object? cancelledAt = const $CopyWithPlaceholder(),
    Object? cancelledBy = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Schedule(
      scheduleId: scheduleId == const $CopyWithPlaceholder()
          ? _value.scheduleId
          // ignore: cast_nullable_to_non_nullable
          : scheduleId as String,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      startAt: startAt == const $CopyWithPlaceholder()
          ? _value.startAt
          // ignore: cast_nullable_to_non_nullable
          : startAt as DateTime,
      endAt: endAt == const $CopyWithPlaceholder()
          ? _value.endAt
          // ignore: cast_nullable_to_non_nullable
          : endAt as DateTime,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ScheduleStatus,
      tables: tables == const $CopyWithPlaceholder()
          ? _value.tables
          // ignore: cast_nullable_to_non_nullable
          : tables as List<ScheduleTable>,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as UserRef,
      cancelledAt: cancelledAt == const $CopyWithPlaceholder()
          ? _value.cancelledAt
          // ignore: cast_nullable_to_non_nullable
          : cancelledAt as DateTime?,
      cancelledBy: cancelledBy == const $CopyWithPlaceholder()
          ? _value.cancelledBy
          // ignore: cast_nullable_to_non_nullable
          : cancelledBy as UserRef?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $ScheduleCopyWith on Schedule {
  /// Returns a callable class that can be used as follows: `instanceOfSchedule.copyWith(...)` or like so:`instanceOfSchedule.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScheduleCWProxy get copyWith => _$ScheduleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Schedule',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'schedule_id',
        'title',
        'start_at',
        'end_at',
        'status',
        'tables',
        'created_by',
        'cancelled_at',
        'cancelled_by',
        'created_at',
        'updated_at',
      ],
    );
    final val = Schedule(
      scheduleId: $checkedConvert('schedule_id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      startAt: $checkedConvert('start_at', (v) => DateTime.parse(v as String)),
      endAt: $checkedConvert('end_at', (v) => DateTime.parse(v as String)),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$ScheduleStatusEnumMap, v),
      ),
      tables: $checkedConvert(
        'tables',
        (v) => (v as List<dynamic>)
            .map((e) => ScheduleTable.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      createdBy: $checkedConvert(
        'created_by',
        (v) => UserRef.fromJson(v as Map<String, dynamic>),
      ),
      cancelledAt: $checkedConvert(
        'cancelled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      cancelledBy: $checkedConvert(
        'cancelled_by',
        (v) => v == null ? null : UserRef.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'scheduleId': 'schedule_id',
    'startAt': 'start_at',
    'endAt': 'end_at',
    'createdBy': 'created_by',
    'cancelledAt': 'cancelled_at',
    'cancelledBy': 'cancelled_by',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'schedule_id': instance.scheduleId,
  'title': instance.title,
  'start_at': instance.startAt.toIso8601String(),
  'end_at': instance.endAt.toIso8601String(),
  'status': _$ScheduleStatusEnumMap[instance.status]!,
  'tables': instance.tables.map((e) => e.toJson()).toList(),
  'created_by': instance.createdBy.toJson(),
  'cancelled_at': instance.cancelledAt?.toIso8601String(),
  'cancelled_by': instance.cancelledBy?.toJson(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$ScheduleStatusEnumMap = {
  ScheduleStatus.upcoming: 'upcoming',
  ScheduleStatus.ongoing: 'ongoing',
  ScheduleStatus.finished: 'finished',
  ScheduleStatus.cancelled: 'cancelled',
};
