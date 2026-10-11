//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/floor_area.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'floor.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Floor {
  /// Returns a new [Floor] instance.
  Floor({

    required  this.areas,
  });

      /// The outlet's areas that hold tables, in order.
  @JsonKey(
    
    name: r'areas',
    required: true,
    includeIfNull: false,
  )


  final List<FloorArea> areas;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Floor &&
      other.areas == areas;

    @override
    int get hashCode =>
        areas.hashCode;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  Map<String, dynamic> toJson() => _$FloorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

