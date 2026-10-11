// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorCWProxy {
  Error code(String code);

  Error message(String message);

  Error details(Map<String, Object>? details);

  Error requestId(String? requestId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Error(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Error(...).copyWith(id: 12, name: "My name")
  /// ````
  Error call({
    String code,
    String message,
    Map<String, Object>? details,
    String? requestId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfError.copyWith.fieldName(...)`
class _$ErrorCWProxyImpl implements _$ErrorCWProxy {
  const _$ErrorCWProxyImpl(this._value);

  final Error _value;

  @override
  Error code(String code) => this(code: code);

  @override
  Error message(String message) => this(message: message);

  @override
  Error details(Map<String, Object>? details) => this(details: details);

  @override
  Error requestId(String? requestId) => this(requestId: requestId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Error(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Error(...).copyWith(id: 12, name: "My name")
  /// ````
  Error call({
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? details = const $CopyWithPlaceholder(),
    Object? requestId = const $CopyWithPlaceholder(),
  }) {
    return Error(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      details: details == const $CopyWithPlaceholder()
          ? _value.details
          // ignore: cast_nullable_to_non_nullable
          : details as Map<String, Object>?,
      requestId: requestId == const $CopyWithPlaceholder()
          ? _value.requestId
          // ignore: cast_nullable_to_non_nullable
          : requestId as String?,
    );
  }
}

extension $ErrorCopyWith on Error {
  /// Returns a callable class that can be used as follows: `instanceOfError.copyWith(...)` or like so:`instanceOfError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorCWProxy get copyWith => _$ErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Error', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'message']);
      final val = Error(
        code: $checkedConvert('code', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
        details: $checkedConvert(
          'details',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as Object),
          ),
        ),
        requestId: $checkedConvert('request_id', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'requestId': 'request_id'});

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'details': ?instance.details,
  'request_id': ?instance.requestId,
};
