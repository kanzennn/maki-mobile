//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/device.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activated_device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActivatedDevice {
  /// Returns a new [ActivatedDevice] instance.
  ActivatedDevice({

    required  this.device,

    required  this.token,
  });

  @JsonKey(
    
    name: r'device',
    required: true,
    includeIfNull: false,
  )


  final Device device;



      /// The Android app's device token, its one copy; null for a browser, which gets the cookie.
  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: true,
  )


  final String? token;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActivatedDevice &&
      other.device == device &&
      other.token == token;

    @override
    int get hashCode =>
        device.hashCode +
        (token == null ? 0 : token.hashCode);

  factory ActivatedDevice.fromJson(Map<String, dynamic> json) => _$ActivatedDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$ActivatedDeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

