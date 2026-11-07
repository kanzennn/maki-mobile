// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_photo_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetPhotoRequestCWProxy {
  SetPhotoRequest uploadKey(String uploadKey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPhotoRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPhotoRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPhotoRequest call({String uploadKey});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetPhotoRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetPhotoRequest.copyWith.fieldName(...)`
class _$SetPhotoRequestCWProxyImpl implements _$SetPhotoRequestCWProxy {
  const _$SetPhotoRequestCWProxyImpl(this._value);

  final SetPhotoRequest _value;

  @override
  SetPhotoRequest uploadKey(String uploadKey) => this(uploadKey: uploadKey);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetPhotoRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetPhotoRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetPhotoRequest call({Object? uploadKey = const $CopyWithPlaceholder()}) {
    return SetPhotoRequest(
      uploadKey: uploadKey == const $CopyWithPlaceholder()
          ? _value.uploadKey
          // ignore: cast_nullable_to_non_nullable
          : uploadKey as String,
    );
  }
}

extension $SetPhotoRequestCopyWith on SetPhotoRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSetPhotoRequest.copyWith(...)` or like so:`instanceOfSetPhotoRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetPhotoRequestCWProxy get copyWith => _$SetPhotoRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPhotoRequest _$SetPhotoRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetPhotoRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['upload_key']);
      final val = SetPhotoRequest(
        uploadKey: $checkedConvert('upload_key', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'uploadKey': 'upload_key'});

Map<String, dynamic> _$SetPhotoRequestToJson(SetPhotoRequest instance) =>
    <String, dynamic>{'upload_key': instance.uploadKey};
