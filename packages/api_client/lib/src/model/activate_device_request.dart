//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activate_device_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActivateDeviceRequest {
  /// Returns a new [ActivateDeviceRequest] instance.
  ActivateDeviceRequest({

    required  this.name,

    required  this.platform,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// `web` gets its token as a cookie, `android` in the body.
  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final ActivateDeviceRequestPlatformEnum platform;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActivateDeviceRequest &&
      other.name == name &&
      other.platform == platform;

    @override
    int get hashCode =>
        name.hashCode +
        platform.hashCode;

  factory ActivateDeviceRequest.fromJson(Map<String, dynamic> json) => _$ActivateDeviceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivateDeviceRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `web` gets its token as a cookie, `android` in the body.
enum ActivateDeviceRequestPlatformEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'android')
android(r'android');

const ActivateDeviceRequestPlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


