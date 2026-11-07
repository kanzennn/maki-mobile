// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_ticket.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UploadTicketCWProxy {
  UploadTicket uploadUrl(String uploadUrl);

  UploadTicket uploadKey(String uploadKey);

  UploadTicket expiresAt(DateTime expiresAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UploadTicket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UploadTicket(...).copyWith(id: 12, name: "My name")
  /// ````
  UploadTicket call({String uploadUrl, String uploadKey, DateTime expiresAt});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUploadTicket.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUploadTicket.copyWith.fieldName(...)`
class _$UploadTicketCWProxyImpl implements _$UploadTicketCWProxy {
  const _$UploadTicketCWProxyImpl(this._value);

  final UploadTicket _value;

  @override
  UploadTicket uploadUrl(String uploadUrl) => this(uploadUrl: uploadUrl);

  @override
  UploadTicket uploadKey(String uploadKey) => this(uploadKey: uploadKey);

  @override
  UploadTicket expiresAt(DateTime expiresAt) => this(expiresAt: expiresAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UploadTicket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UploadTicket(...).copyWith(id: 12, name: "My name")
  /// ````
  UploadTicket call({
    Object? uploadUrl = const $CopyWithPlaceholder(),
    Object? uploadKey = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
  }) {
    return UploadTicket(
      uploadUrl: uploadUrl == const $CopyWithPlaceholder()
          ? _value.uploadUrl
          // ignore: cast_nullable_to_non_nullable
          : uploadUrl as String,
      uploadKey: uploadKey == const $CopyWithPlaceholder()
          ? _value.uploadKey
          // ignore: cast_nullable_to_non_nullable
          : uploadKey as String,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime,
    );
  }
}

extension $UploadTicketCopyWith on UploadTicket {
  /// Returns a callable class that can be used as follows: `instanceOfUploadTicket.copyWith(...)` or like so:`instanceOfUploadTicket.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UploadTicketCWProxy get copyWith => _$UploadTicketCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadTicket _$UploadTicketFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UploadTicket',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['upload_url', 'upload_key', 'expires_at'],
        );
        final val = UploadTicket(
          uploadUrl: $checkedConvert('upload_url', (v) => v as String),
          uploadKey: $checkedConvert('upload_key', (v) => v as String),
          expiresAt: $checkedConvert(
            'expires_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'uploadUrl': 'upload_url',
        'uploadKey': 'upload_key',
        'expiresAt': 'expires_at',
      },
    );

Map<String, dynamic> _$UploadTicketToJson(UploadTicket instance) =>
    <String, dynamic>{
      'upload_url': instance.uploadUrl,
      'upload_key': instance.uploadKey,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
