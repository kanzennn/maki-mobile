//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/dine_in_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dine_in_mode_setting.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DineInModeSetting {
  /// Returns a new [DineInModeSetting] instance.
  DineInModeSetting({

    required  this.mode,
  });

  @JsonKey(
    
    name: r'mode',
    required: true,
    includeIfNull: false,
  )


  final DineInMode mode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DineInModeSetting &&
      other.mode == mode;

    @override
    int get hashCode =>
        mode.hashCode;

  factory DineInModeSetting.fromJson(Map<String, dynamic> json) => _$DineInModeSettingFromJson(json);

  Map<String, dynamic> toJson() => _$DineInModeSettingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

