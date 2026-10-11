//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/decoration.dart';
import 'package:maki_api_client/src/model/placement.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layout_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LayoutInput {
  /// Returns a new [LayoutInput] instance.
  LayoutInput({

    required  this.version,

    required  this.tables,

    required  this.decorations,
  });

      /// The layout's version as the editor opened it.
  @JsonKey(
    
    name: r'version',
    required: true,
    includeIfNull: false,
  )


  final int version;



      /// The tables placed on it; the area's others come off it.
  @JsonKey(
    
    name: r'tables',
    required: true,
    includeIfNull: false,
  )


  final List<Placement> tables;



  @JsonKey(
    
    name: r'decorations',
    required: true,
    includeIfNull: false,
  )


  final List<Decoration> decorations;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LayoutInput &&
      other.version == version &&
      other.tables == tables &&
      other.decorations == decorations;

    @override
    int get hashCode =>
        version.hashCode +
        tables.hashCode +
        decorations.hashCode;

  factory LayoutInput.fromJson(Map<String, dynamic> json) => _$LayoutInputFromJson(json);

  Map<String, dynamic> toJson() => _$LayoutInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

