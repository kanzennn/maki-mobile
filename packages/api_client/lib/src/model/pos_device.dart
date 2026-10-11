//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/pos_device_info.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosDevice {
  /// Returns a new [PosDevice] instance.
  PosDevice({

    required  this.device,

    required  this.orderNoPrefix,

    required  this.day,

    required  this.nextNumber,
  });

  @JsonKey(
    
    name: r'device',
    required: true,
    includeIfNull: false,
  )


  final PosDeviceInfo device;



      /// The outlet's code and the device's, which start each of its receipt numbers.
  @JsonKey(
    
    name: r'order_no_prefix',
    required: true,
    includeIfNull: false,
  )


  final String orderNoPrefix;



      /// Today in the outlet's time zone.
  @JsonKey(
    
    name: r'day',
    required: true,
    includeIfNull: false,
  )


  final DateTime day;



      /// The count the device's next receipt number today takes.
          // minimum: 1
  @JsonKey(
    
    name: r'next_number',
    required: true,
    includeIfNull: false,
  )


  final int nextNumber;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosDevice &&
      other.device == device &&
      other.orderNoPrefix == orderNoPrefix &&
      other.day == day &&
      other.nextNumber == nextNumber;

    @override
    int get hashCode =>
        device.hashCode +
        orderNoPrefix.hashCode +
        day.hashCode +
        nextNumber.hashCode;

  factory PosDevice.fromJson(Map<String, dynamic> json) => _$PosDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$PosDeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

