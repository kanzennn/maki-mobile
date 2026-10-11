//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Area {
  /// Returns a new [Area] instance.
  Area({

    required  this.areaId,

    required  this.name,

    required  this.sortOrder,

    required  this.tableCount,

    required  this.createdAt,

    required  this.updatedAt,
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



      /// Its place in the order, from 0.
  @JsonKey(
    
    name: r'sort_order',
    required: true,
    includeIfNull: false,
  )


  final int sortOrder;



      /// Tables in it, placed on its layout or not.
  @JsonKey(
    
    name: r'table_count',
    required: true,
    includeIfNull: false,
  )


  final int tableCount;



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
    bool operator ==(Object other) => identical(this, other) || other is Area &&
      other.areaId == areaId &&
      other.name == name &&
      other.sortOrder == sortOrder &&
      other.tableCount == tableCount &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        areaId.hashCode +
        name.hashCode +
        sortOrder.hashCode +
        tableCount.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

