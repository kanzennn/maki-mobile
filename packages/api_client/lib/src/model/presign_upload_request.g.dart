// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presign_upload_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PresignUploadRequestCWProxy {
  PresignUploadRequest purpose(PresignUploadRequestPurposeEnum purpose);

  PresignUploadRequest contentType(
    PresignUploadRequestContentTypeEnum contentType,
  );

  PresignUploadRequest size(int size);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignUploadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignUploadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignUploadRequest call({
    PresignUploadRequestPurposeEnum purpose,
    PresignUploadRequestContentTypeEnum contentType,
    int size,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPresignUploadRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPresignUploadRequest.copyWith.fieldName(...)`
class _$PresignUploadRequestCWProxyImpl
    implements _$PresignUploadRequestCWProxy {
  const _$PresignUploadRequestCWProxyImpl(this._value);

  final PresignUploadRequest _value;

  @override
  PresignUploadRequest purpose(PresignUploadRequestPurposeEnum purpose) =>
      this(purpose: purpose);

  @override
  PresignUploadRequest contentType(
    PresignUploadRequestContentTypeEnum contentType,
  ) => this(contentType: contentType);

  @override
  PresignUploadRequest size(int size) => this(size: size);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PresignUploadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PresignUploadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PresignUploadRequest call({
    Object? purpose = const $CopyWithPlaceholder(),
    Object? contentType = const $CopyWithPlaceholder(),
    Object? size = const $CopyWithPlaceholder(),
  }) {
    return PresignUploadRequest(
      purpose: purpose == const $CopyWithPlaceholder()
          ? _value.purpose
          // ignore: cast_nullable_to_non_nullable
          : purpose as PresignUploadRequestPurposeEnum,
      contentType: contentType == const $CopyWithPlaceholder()
          ? _value.contentType
          // ignore: cast_nullable_to_non_nullable
          : contentType as PresignUploadRequestContentTypeEnum,
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int,
    );
  }
}

extension $PresignUploadRequestCopyWith on PresignUploadRequest {
  /// Returns a callable class that can be used as follows: `instanceOfPresignUploadRequest.copyWith(...)` or like so:`instanceOfPresignUploadRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PresignUploadRequestCWProxy get copyWith =>
      _$PresignUploadRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignUploadRequest _$PresignUploadRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PresignUploadRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['purpose', 'content_type', 'size']);
  final val = PresignUploadRequest(
    purpose: $checkedConvert(
      'purpose',
      (v) => $enumDecode(_$PresignUploadRequestPurposeEnumEnumMap, v),
    ),
    contentType: $checkedConvert(
      'content_type',
      (v) => $enumDecode(_$PresignUploadRequestContentTypeEnumEnumMap, v),
    ),
    size: $checkedConvert('size', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'contentType': 'content_type'});

Map<String, dynamic> _$PresignUploadRequestToJson(
  PresignUploadRequest instance,
) => <String, dynamic>{
  'purpose': _$PresignUploadRequestPurposeEnumEnumMap[instance.purpose]!,
  'content_type':
      _$PresignUploadRequestContentTypeEnumEnumMap[instance.contentType]!,
  'size': instance.size,
};

const _$PresignUploadRequestPurposeEnumEnumMap = {
  PresignUploadRequestPurposeEnum.menuImage: 'menu_image',
  PresignUploadRequestPurposeEnum.userPhoto: 'user_photo',
};

const _$PresignUploadRequestContentTypeEnumEnumMap = {
  PresignUploadRequestContentTypeEnum.imageSlashJpeg: 'image/jpeg',
  PresignUploadRequestContentTypeEnum.imageSlashPng: 'image/png',
  PresignUploadRequestContentTypeEnum.imageSlashWebp: 'image/webp',
};
