//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presign_upload_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PresignUploadRequest {
  /// Returns a new [PresignUploadRequest] instance.
  PresignUploadRequest({

    required  this.purpose,

    required  this.contentType,

    required  this.size,
  });

  @JsonKey(
    
    name: r'purpose',
    required: true,
    includeIfNull: false,
  )


  final PresignUploadRequestPurposeEnum purpose;



  @JsonKey(
    
    name: r'content_type',
    required: true,
    includeIfNull: false,
  )


  final PresignUploadRequestContentTypeEnum contentType;



      /// The file's exact size in bytes, at most 2 MB.
          // minimum: 1
          // maximum: 2097152
  @JsonKey(
    
    name: r'size',
    required: true,
    includeIfNull: false,
  )


  final int size;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PresignUploadRequest &&
      other.purpose == purpose &&
      other.contentType == contentType &&
      other.size == size;

    @override
    int get hashCode =>
        purpose.hashCode +
        contentType.hashCode +
        size.hashCode;

  factory PresignUploadRequest.fromJson(Map<String, dynamic> json) => _$PresignUploadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PresignUploadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum PresignUploadRequestPurposeEnum {
@JsonValue(r'menu_image')
menuImage(r'menu_image'),
@JsonValue(r'user_photo')
userPhoto(r'user_photo');

const PresignUploadRequestPurposeEnum(this.value);

final String value;

@override
String toString() => value;
}


enum PresignUploadRequestContentTypeEnum {
@JsonValue(r'image/jpeg')
imageSlashJpeg(r'image/jpeg'),
@JsonValue(r'image/png')
imageSlashPng(r'image/png'),
@JsonValue(r'image/webp')
imageSlashWebp(r'image/webp');

const PresignUploadRequestContentTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


