// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_order_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaOrderRequestCWProxy {
  AreaOrderRequest areaIds(List<String> areaIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaOrderRequest call({List<String> areaIds});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAreaOrderRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAreaOrderRequest.copyWith.fieldName(...)`
class _$AreaOrderRequestCWProxyImpl implements _$AreaOrderRequestCWProxy {
  const _$AreaOrderRequestCWProxyImpl(this._value);

  final AreaOrderRequest _value;

  @override
  AreaOrderRequest areaIds(List<String> areaIds) => this(areaIds: areaIds);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AreaOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AreaOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  AreaOrderRequest call({Object? areaIds = const $CopyWithPlaceholder()}) {
    return AreaOrderRequest(
      areaIds: areaIds == const $CopyWithPlaceholder()
          ? _value.areaIds
          // ignore: cast_nullable_to_non_nullable
          : areaIds as List<String>,
    );
  }
}

extension $AreaOrderRequestCopyWith on AreaOrderRequest {
  /// Returns a callable class that can be used as follows: `instanceOfAreaOrderRequest.copyWith(...)` or like so:`instanceOfAreaOrderRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AreaOrderRequestCWProxy get copyWith => _$AreaOrderRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreaOrderRequest _$AreaOrderRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AreaOrderRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['area_ids']);
      final val = AreaOrderRequest(
        areaIds: $checkedConvert(
          'area_ids',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'areaIds': 'area_ids'});

Map<String, dynamic> _$AreaOrderRequestToJson(AreaOrderRequest instance) =>
    <String, dynamic>{'area_ids': instance.areaIds};
