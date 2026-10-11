//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/decoration.dart';
import 'package:maki_api_client/src/model/table.dart';
import 'package:maki_api_client/src/model/area_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Layout {
  /// Returns a new [Layout] instance.
  Layout({

    required  this.area,

    required  this.version,

    required  this.decorations,

    required  this.tables,
  });

  @JsonKey(
    
    name: r'area',
    required: true,
    includeIfNull: false,
  )


  final AreaRef area;



      /// Goes up with each change to the layout or to a table in the area; the editor saves on the one it opened. 
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;



  @JsonKey(
    
    name: r'decorations',
    required: true,
    includeIfNull: false,
  )


  final List<Decoration> decorations;



      /// Every table in the area, placed or not, by name.
  @JsonKey(
    
    name: r'tables',
    required: true,
    includeIfNull: false,
  )


  final List<Table> tables;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Layout &&
      other.area == area &&
      other.version == version &&
      other.decorations == decorations &&
      other.tables == tables;

    @override
    int get hashCode =>
        area.hashCode +
        version.hashCode +
        decorations.hashCode +
        tables.hashCode;

  factory Layout.fromJson(Map<String, dynamic> json) => _$LayoutFromJson(json);

  Map<String, dynamic> toJson() => _$LayoutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

