//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_photo_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetPhotoRequest {
  /// Returns a new [SetPhotoRequest] instance.
  SetPhotoRequest({

    required  this.uploadKey,
  });

  @JsonKey(
    
    name: r'upload_key',
    required: true,
    includeIfNull: false,
  )


  final String uploadKey;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetPhotoRequest &&
      other.uploadKey == uploadKey;

    @override
    int get hashCode =>
        uploadKey.hashCode;

  factory SetPhotoRequest.fromJson(Map<String, dynamic> json) => _$SetPhotoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetPhotoRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

