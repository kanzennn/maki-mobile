//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/rotation.dart';
import 'package:maki_api_client/src/model/table_shape.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'placement.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Placement {
  /// Returns a new [Placement] instance.
  Placement({

    required  this.tableId,

    required  this.x,

    required  this.y,

    required  this.w,

    required  this.h,

    required  this.rotation,

    required  this.shape,
  });

  @JsonKey(
    
    name: r'table_id',
    required: true,
    includeIfNull: false,
  )


  final String tableId;



  @JsonKey(
    
    name: r'x',
    required: true,
    includeIfNull: false,
  )


  final int x;



  @JsonKey(
    
    name: r'y',
    required: true,
    includeIfNull: false,
  )


  final int y;



  @JsonKey(
    
    name: r'w',
    required: true,
    includeIfNull: false,
  )


  final int w;



  @JsonKey(
    
    name: r'h',
    required: true,
    includeIfNull: false,
  )


  final int h;



  @JsonKey(
    
    name: r'rotation',
    required: true,
    includeIfNull: false,
  )


  final Rotation rotation;



  @JsonKey(
    
    name: r'shape',
    required: true,
    includeIfNull: false,
  )


  final TableShape shape;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Placement &&
      other.tableId == tableId &&
      other.x == x &&
      other.y == y &&
      other.w == w &&
      other.h == h &&
      other.rotation == rotation &&
      other.shape == shape;

    @override
    int get hashCode =>
        tableId.hashCode +
        x.hashCode +
        y.hashCode +
        w.hashCode +
        h.hashCode +
        rotation.hashCode +
        shape.hashCode;

  factory Placement.fromJson(Map<String, dynamic> json) => _$PlacementFromJson(json);

  Map<String, dynamic> toJson() => _$PlacementToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

