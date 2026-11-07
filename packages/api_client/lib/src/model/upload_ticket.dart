//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_ticket.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UploadTicket {
  /// Returns a new [UploadTicket] instance.
  UploadTicket({

    required  this.uploadUrl,

    required  this.uploadKey,

    required  this.expiresAt,
  });

      /// A presigned address to `PUT` the file to.
  @JsonKey(
    
    name: r'upload_url',
    required: true,
    includeIfNull: false,
  )


  final String uploadUrl;



  @JsonKey(
    
    name: r'upload_key',
    required: true,
    includeIfNull: false,
  )


  final String uploadKey;



  @JsonKey(
    
    name: r'expires_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiresAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UploadTicket &&
      other.uploadUrl == uploadUrl &&
      other.uploadKey == uploadKey &&
      other.expiresAt == expiresAt;

    @override
    int get hashCode =>
        uploadUrl.hashCode +
        uploadKey.hashCode +
        expiresAt.hashCode;

  factory UploadTicket.fromJson(Map<String, dynamic> json) => _$UploadTicketFromJson(json);

  Map<String, dynamic> toJson() => _$UploadTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

