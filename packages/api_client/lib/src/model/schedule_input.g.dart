// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScheduleInputCWProxy {
  ScheduleInput title(String title);

  ScheduleInput startAt(DateTime startAt);

  ScheduleInput endAt(DateTime endAt);

  ScheduleInput tableIds(List<String> tableIds);

  ScheduleInput confirmOverlap(bool? confirmOverlap);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleInput(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleInput call({
    String title,
    DateTime startAt,
    DateTime endAt,
    List<String> tableIds,
    bool? confirmOverlap,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScheduleInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScheduleInput.copyWith.fieldName(...)`
class _$ScheduleInputCWProxyImpl implements _$ScheduleInputCWProxy {
  const _$ScheduleInputCWProxyImpl(this._value);

  final ScheduleInput _value;

  @override
  ScheduleInput title(String title) => this(title: title);

  @override
  ScheduleInput startAt(DateTime startAt) => this(startAt: startAt);

  @override
  ScheduleInput endAt(DateTime endAt) => this(endAt: endAt);

  @override
  ScheduleInput tableIds(List<String> tableIds) => this(tableIds: tableIds);

  @override
  ScheduleInput confirmOverlap(bool? confirmOverlap) =>
      this(confirmOverlap: confirmOverlap);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleInput(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleInput call({
    Object? title = const $CopyWithPlaceholder(),
    Object? startAt = const $CopyWithPlaceholder(),
    Object? endAt = const $CopyWithPlaceholder(),
    Object? tableIds = const $CopyWithPlaceholder(),
    Object? confirmOverlap = const $CopyWithPlaceholder(),
  }) {
    return ScheduleInput(
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
      tableIds: tableIds == const $CopyWithPlaceholder()
          ? _value.tableIds
          // ignore: cast_nullable_to_non_nullable
          : tableIds as List<String>,
      confirmOverlap: confirmOverlap == const $CopyWithPlaceholder()
          ? _value.confirmOverlap
          // ignore: cast_nullable_to_non_nullable
          : confirmOverlap as bool?,
    );
  }
}

extension $ScheduleInputCopyWith on ScheduleInput {
  /// Returns a callable class that can be used as follows: `instanceOfScheduleInput.copyWith(...)` or like so:`instanceOfScheduleInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScheduleInputCWProxy get copyWith => _$ScheduleInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleInput _$ScheduleInputFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ScheduleInput',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'start_at', 'end_at', 'table_ids'],
        );
        final val = ScheduleInput(
          title: $checkedConvert('title', (v) => v as String),
          startAt: $checkedConvert(
            'start_at',
            (v) => DateTime.parse(v as String),
          ),
          endAt: $checkedConvert('end_at', (v) => DateTime.parse(v as String)),
          tableIds: $checkedConvert(
            'table_ids',
            (v) => (v as List<dynamic>).map((e) => e as String).toList(),
          ),
          confirmOverlap: $checkedConvert('confirm_overlap', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'startAt': 'start_at',
        'endAt': 'end_at',
        'tableIds': 'table_ids',
        'confirmOverlap': 'confirm_overlap',
      },
    );

Map<String, dynamic> _$ScheduleInputToJson(ScheduleInput instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start_at': instance.startAt.toIso8601String(),
      'end_at': instance.endAt.toIso8601String(),
      'table_ids': instance.tableIds,
      'confirm_overlap': ?instance.confirmOverlap,
    };
