//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/rotation.dart';
import 'package:maki_api_client/src/model/seated.dart';
import 'package:maki_api_client/src/model/table_status.dart';
import 'package:maki_api_client/src/model/box.dart';
import 'package:maki_api_client/src/model/table_shape.dart';
import 'package:maki_api_client/src/model/area_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Table {
  /// Returns a new [Table] instance.
  Table({

    required  this.tableId,

    required  this.area,

    required  this.name,

    required  this.capacity,

    required  this.shape,

    required  this.box,

    required  this.rotation,

    required  this.isActive,

    required  this.status,

    required  this.seated,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'table_id',
    required: true,
    includeIfNull: false,
  )


  final String tableId;



  @JsonKey(
    
    name: r'area',
    required: true,
    includeIfNull: false,
  )


  final AreaRef area;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// Seats; null when not given.
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
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final TableStatus status;



      /// Who is seated there, while the status is `occupied`; null otherwise.
  @JsonKey(
    
    name: r'seated',
    required: true,
    includeIfNull: true,
  )


  final Seated? seated;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Table &&
      other.tableId == tableId &&
      other.area == area &&
      other.name == name &&
      other.capacity == capacity &&
      other.shape == shape &&
      other.box == box &&
      other.rotation == rotation &&
      other.isActive == isActive &&
      other.status == status &&
      other.seated == seated &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        tableId.hashCode +
        area.hashCode +
        name.hashCode +
        (capacity == null ? 0 : capacity.hashCode) +
        shape.hashCode +
        (box == null ? 0 : box.hashCode) +
        rotation.hashCode +
        isActive.hashCode +
        status.hashCode +
        (seated == null ? 0 : seated.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);

  Map<String, dynamic> toJson() => _$TableToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

