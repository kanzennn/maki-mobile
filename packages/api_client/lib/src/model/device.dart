//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/device_person.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Device {
  /// Returns a new [Device] instance.
  Device({

    required  this.deviceId,

    required  this.code,

    required  this.name,

    required  this.platform,

    required  this.status,

    required  this.activatedBy,

    required  this.activatedAt,

    required  this.lastSeenAt,

    required  this.revokedAt,

    required  this.revokedBy,
  });

  @JsonKey(
    
    name: r'device_id',
    required: true,
    includeIfNull: false,
  )


  final String deviceId;



      /// In every receipt number the device makes, after the outlet's code.
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


  final DevicePlatformEnum platform;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final DeviceStatusEnum status;



  @JsonKey(
    
    name: r'activated_by',
    required: true,
    includeIfNull: false,
  )


  final DevicePerson activatedBy;



  @JsonKey(
    
    name: r'activated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime activatedAt;



      /// When the device last sold, or started the cashier.
  @JsonKey(
    
    name: r'last_seen_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? lastSeenAt;



  @JsonKey(
    
    name: r'revoked_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? revokedAt;



  @JsonKey(
    
    name: r'revoked_by',
    required: true,
    includeIfNull: true,
  )


  final DevicePerson? revokedBy;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Device &&
      other.deviceId == deviceId &&
      other.code == code &&
      other.name == name &&
      other.platform == platform &&
      other.status == status &&
      other.activatedBy == activatedBy &&
      other.activatedAt == activatedAt &&
      other.lastSeenAt == lastSeenAt &&
      other.revokedAt == revokedAt &&
      other.revokedBy == revokedBy;

    @override
    int get hashCode =>
        deviceId.hashCode +
        code.hashCode +
        name.hashCode +
        platform.hashCode +
        status.hashCode +
        activatedBy.hashCode +
        activatedAt.hashCode +
        (lastSeenAt == null ? 0 : lastSeenAt.hashCode) +
        (revokedAt == null ? 0 : revokedAt.hashCode) +
        (revokedBy == null ? 0 : revokedBy.hashCode);

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum DevicePlatformEnum {
@JsonValue(r'web')
web(r'web'),
@JsonValue(r'android')
android(r'android');

const DevicePlatformEnum(this.value);

final String value;

@override
String toString() => value;
}


enum DeviceStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'revoked')
revoked(r'revoked');

const DeviceStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


