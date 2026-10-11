// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ScheduleListCWProxy {
  ScheduleList data(List<Schedule> data);

  ScheduleList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleList(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleList call({List<Schedule> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfScheduleList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfScheduleList.copyWith.fieldName(...)`
class _$ScheduleListCWProxyImpl implements _$ScheduleListCWProxy {
  const _$ScheduleListCWProxyImpl(this._value);

  final ScheduleList _value;

  @override
  ScheduleList data(List<Schedule> data) => this(data: data);

  @override
  ScheduleList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ScheduleList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ScheduleList(...).copyWith(id: 12, name: "My name")
  /// ````
  ScheduleList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return ScheduleList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Schedule>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $ScheduleListCopyWith on ScheduleList {
  /// Returns a callable class that can be used as follows: `instanceOfScheduleList.copyWith(...)` or like so:`instanceOfScheduleList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ScheduleListCWProxy get copyWith => _$ScheduleListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ScheduleList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ScheduleList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ScheduleListToJson(ScheduleList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
