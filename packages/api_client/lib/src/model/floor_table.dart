//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/rotation.dart';
import 'package:maki_api_client/src/model/seated.dart';
import 'package:maki_api_client/src/model/table_status.dart';
import 'package:maki_api_client/src/model/box.dart';
import 'package:maki_api_client/src/model/table_shape.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'floor_table.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FloorTable {
  /// Returns a new [FloorTable] instance.
  FloorTable({

    required  this.tableId,

    required  this.name,

    required  this.capacity,

    required  this.shape,

    required  this.box,

    required  this.rotation,

    required  this.status,

    required  this.seated,
  });

  @JsonKey(
    
    name: r'table_id',
    required: true,
    includeIfNull: false,
  )


  final String tableId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'capacity',
    required: true,
    includeIfNull: true,
  )


  final int? capacity;



  @JsonKey(
    
    name: r'shape',
    required: true,
    includeIfNull: false,
  )


  final TableShape shape;



      /// Its place on its area's layout; null while it isn't placed.
  @JsonKey(
    
    name: r'box',
    required: true,
    includeIfNull: true,
  )


  final Box? box;



  @JsonKey(
    
    name: r'rotation',
    required: true,
    includeIfNull: false,
  )


  final Rotation rotation;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final TableStatus status;



  @JsonKey(
    
    name: r'seated',
    required: true,
    includeIfNull: true,
  )


  final Seated? seated;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FloorTable &&
      other.tableId == tableId &&
      other.name == name &&
      other.capacity == capacity &&
      other.shape == shape &&
      other.box == box &&
      other.rotation == rotation &&
      other.status == status &&
      other.seated == seated;

    @override
    int get hashCode =>
        tableId.hashCode +
        name.hashCode +
        (capacity == null ? 0 : capacity.hashCode) +
        shape.hashCode +
        (box == null ? 0 : box.hashCode) +
        rotation.hashCode +
        status.hashCode +
        (seated == null ? 0 : seated.hashCode);

  factory FloorTable.fromJson(Map<String, dynamic> json) => _$FloorTableFromJson(json);

  Map<String, dynamic> toJson() => _$FloorTableToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

