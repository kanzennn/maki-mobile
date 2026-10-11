// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffListCWProxy {
  StaffList data(List<Staff> data);

  StaffList meta(ListMeta meta);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffList(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffList call({List<Staff> data, ListMeta meta});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaffList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaffList.copyWith.fieldName(...)`
class _$StaffListCWProxyImpl implements _$StaffListCWProxy {
  const _$StaffListCWProxyImpl(this._value);

  final StaffList _value;

  @override
  StaffList data(List<Staff> data) => this(data: data);

  @override
  StaffList meta(ListMeta meta) => this(meta: meta);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffList(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffList call({
    Object? data = const $CopyWithPlaceholder(),
    Object? meta = const $CopyWithPlaceholder(),
  }) {
    return StaffList(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<Staff>,
      meta: meta == const $CopyWithPlaceholder()
          ? _value.meta
          // ignore: cast_nullable_to_non_nullable
          : meta as ListMeta,
    );
  }
}

extension $StaffListCopyWith on StaffList {
  /// Returns a callable class that can be used as follows: `instanceOfStaffList.copyWith(...)` or like so:`instanceOfStaffList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffListCWProxy get copyWith => _$StaffListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffList _$StaffListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StaffList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = StaffList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Staff.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => ListMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StaffListToJson(StaffList instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
