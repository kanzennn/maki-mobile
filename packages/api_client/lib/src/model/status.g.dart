// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StatusCWProxy {
  Status status(String status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Status(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Status(...).copyWith(id: 12, name: "My name")
  /// ````
  Status call({String status});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStatus.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStatus.copyWith.fieldName(...)`
class _$StatusCWProxyImpl implements _$StatusCWProxy {
  const _$StatusCWProxyImpl(this._value);

  final Status _value;

  @override
  Status status(String status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Status(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Status(...).copyWith(id: 12, name: "My name")
  /// ````
  Status call({Object? status = const $CopyWithPlaceholder()}) {
    return Status(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
    );
  }
}

extension $StatusCopyWith on Status {
  /// Returns a callable class that can be used as follows: `instanceOfStatus.copyWith(...)` or like so:`instanceOfStatus.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StatusCWProxy get copyWith => _$StatusCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Status', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['status']);
      final val = Status(status: $checkedConvert('status', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'status': instance.status,
};
