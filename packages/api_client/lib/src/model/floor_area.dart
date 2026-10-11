//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/decoration.dart';
import 'package:maki_api_client/src/model/floor_table.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'floor_area.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FloorArea {
  /// Returns a new [FloorArea] instance.
  FloorArea({

    required  this.areaId,

    required  this.name,

    required  this.decorations,

    required  this.tables,
  });

  @JsonKey(
    
    name: r'area_id',
    required: true,
    includeIfNull: false,
  )


  final String areaId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'decorations',
    required: true,
    includeIfNull: false,
  )


  final List<Decoration> decorations;



      /// By name, placed or not.
  @JsonKey(
    
    name: r'tables',
    required: true,
    includeIfNull: false,
  )


  final List<FloorTable> tables;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FloorArea &&
      other.areaId == areaId &&
      other.name == name &&
      other.decorations == decorations &&
      other.tables == tables;

    @override
    int get hashCode =>
        areaId.hashCode +
        name.hashCode +
        decorations.hashCode +
        tables.hashCode;

  factory FloorArea.fromJson(Map<String, dynamic> json) => _$FloorAreaFromJson(json);

  Map<String, dynamic> toJson() => _$FloorAreaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

