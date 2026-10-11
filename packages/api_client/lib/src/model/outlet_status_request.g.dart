// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_status_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OutletStatusRequestCWProxy {
  OutletStatusRequest status(OutletStatusRequestStatusEnum status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletStatusRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletStatusRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletStatusRequest call({OutletStatusRequestStatusEnum status});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOutletStatusRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOutletStatusRequest.copyWith.fieldName(...)`
class _$OutletStatusRequestCWProxyImpl implements _$OutletStatusRequestCWProxy {
  const _$OutletStatusRequestCWProxyImpl(this._value);

  final OutletStatusRequest _value;

  @override
  OutletStatusRequest status(OutletStatusRequestStatusEnum status) =>
      this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OutletStatusRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OutletStatusRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OutletStatusRequest call({Object? status = const $CopyWithPlaceholder()}) {
    return OutletStatusRequest(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OutletStatusRequestStatusEnum,
    );
  }
}

extension $OutletStatusRequestCopyWith on OutletStatusRequest {
  /// Returns a callable class that can be used as follows: `instanceOfOutletStatusRequest.copyWith(...)` or like so:`instanceOfOutletStatusRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OutletStatusRequestCWProxy get copyWith =>
      _$OutletStatusRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletStatusRequest _$OutletStatusRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OutletStatusRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = OutletStatusRequest(
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$OutletStatusRequestStatusEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OutletStatusRequestToJson(
  OutletStatusRequest instance,
) => <String, dynamic>{
  'status': _$OutletStatusRequestStatusEnumEnumMap[instance.status]!,
};

const _$OutletStatusRequestStatusEnumEnumMap = {
  OutletStatusRequestStatusEnum.active: 'active',
  OutletStatusRequestStatusEnum.inactive: 'inactive',
};
