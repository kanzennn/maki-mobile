//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Error {
  /// Returns a new [Error] instance.
  Error({

    required  this.code,

    required  this.message,

     this.details,

     this.requestId,
  });

      /// Stable, machine-readable error code that clients switch on.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



      /// Safe to show to the user, in the language of `Accept-Language` (Indonesian by default); a fallback when the client has no translation for `code`. 
  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



      /// Machine-readable extra data, such as the remaining stock.
  @JsonKey(
    
    name: r'details',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? details;



      /// Matches the X-Request-ID response header and the server logs.
  @JsonKey(
    
    name: r'request_id',
    required: false,
    includeIfNull: false,
  )


  final String? requestId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Error &&
      other.code == code &&
      other.message == message &&
      other.details == details &&
      other.requestId == requestId;

    @override
    int get hashCode =>
        code.hashCode +
        message.hashCode +
        details.hashCode +
        requestId.hashCode;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

