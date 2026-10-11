// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActiveRequestCWProxy {
  ActiveRequest isActive(bool isActive);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveRequest call({bool isActive});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActiveRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActiveRequest.copyWith.fieldName(...)`
class _$ActiveRequestCWProxyImpl implements _$ActiveRequestCWProxy {
  const _$ActiveRequestCWProxyImpl(this._value);

  final ActiveRequest _value;

  @override
  ActiveRequest isActive(bool isActive) => this(isActive: isActive);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActiveRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActiveRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ActiveRequest call({Object? isActive = const $CopyWithPlaceholder()}) {
    return ActiveRequest(
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool,
    );
  }
}

extension $ActiveRequestCopyWith on ActiveRequest {
  /// Returns a callable class that can be used as follows: `instanceOfActiveRequest.copyWith(...)` or like so:`instanceOfActiveRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActiveRequestCWProxy get copyWith => _$ActiveRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveRequest _$ActiveRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ActiveRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['is_active']);
      final val = ActiveRequest(
        isActive: $checkedConvert('is_active', (v) => v as bool),
      );
      return val;
    }, fieldKeyMap: const {'isActive': 'is_active'});

Map<String, dynamic> _$ActiveRequestToJson(ActiveRequest instance) =>
    <String, dynamic>{'is_active': instance.isActive};
