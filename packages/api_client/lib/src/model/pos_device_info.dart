//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_device_info.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosDeviceInfo {
  /// Returns a new [PosDeviceInfo] instance.
  PosDeviceInfo({

    required  this.deviceId,

    required  this.code,

    required  this.name,

    required  this.platform,
  });

  @JsonKey(
    
    name: r'device_id',
    required: true,
    includeIfNull: false,
  )


  final String deviceId;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final PosDeviceInfoPlatformEnum platform;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosDeviceInfo &&
      other.deviceId == deviceId &&
      other.code == code &&
      other.name == name &&
      other.platform == platform;

    @override
    int get hashCode =>
        deviceId.hashCode +
        code.hashCode +
        name.hashCode +
        platform.hashCode;

  factory PosDeviceInfo.fromJson(Map<String, dynamic> json) => _$PosDeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PosDeviceInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum PosDeviceInfoPlatformEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'android')
android(r'android');

const PosDeviceInfoPlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


