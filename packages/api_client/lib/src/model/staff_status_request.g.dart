// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_status_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffStatusRequestCWProxy {
  StaffStatusRequest status(StaffStatusRequestStatusEnum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffStatusRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffStatusRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffStatusRequest call({StaffStatusRequestStatusEnum status});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaffStatusRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaffStatusRequest.copyWith.fieldName(...)`
class _$StaffStatusRequestCWProxyImpl implements _$StaffStatusRequestCWProxy {
  const _$StaffStatusRequestCWProxyImpl(this._value);

  final StaffStatusRequest _value;

  @override
  StaffStatusRequest status(StaffStatusRequestStatusEnum status) =>
      this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffStatusRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffStatusRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffStatusRequest call({Object? status = const $CopyWithPlaceholder()}) {
    return StaffStatusRequest(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as StaffStatusRequestStatusEnum,
    );
  }
}

extension $StaffStatusRequestCopyWith on StaffStatusRequest {
  /// Returns a callable class that can be used as follows: `instanceOfStaffStatusRequest.copyWith(...)` or like so:`instanceOfStaffStatusRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffStatusRequestCWProxy get copyWith =>
      _$StaffStatusRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffStatusRequest _$StaffStatusRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StaffStatusRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = StaffStatusRequest(
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$StaffStatusRequestStatusEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$StaffStatusRequestToJson(StaffStatusRequest instance) =>
    <String, dynamic>{
      'status': _$StaffStatusRequestStatusEnumEnumMap[instance.status]!,
    };

const _$StaffStatusRequestStatusEnumEnumMap = {
  StaffStatusRequestStatusEnum.active: 'active',
  StaffStatusRequestStatusEnum.inactive: 'inactive',
};
