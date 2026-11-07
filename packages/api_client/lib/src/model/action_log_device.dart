//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_log_device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionLogDevice {
  /// Returns a new [ActionLogDevice] instance.
  ActionLogDevice({

    required  this.deviceId,

    required  this.code,

    required  this.name,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionLogDevice &&
      other.deviceId == deviceId &&
      other.code == code &&
      other.name == name;

    @override
    int get hashCode =>
        deviceId.hashCode +
        code.hashCode +
        name.hashCode;

  factory ActionLogDevice.fromJson(Map<String, dynamic> json) => _$ActionLogDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$ActionLogDeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

