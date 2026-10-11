//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/area_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_table.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ScheduleTable {
  /// Returns a new [ScheduleTable] instance.
  ScheduleTable({

    required  this.tableId,

    required  this.name,

    required  this.area,

    required  this.deleted,
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
    
    name: r'area',
    required: true,
    includeIfNull: false,
  )


  final AreaRef area;



      /// Whether the table was deleted since.
  @JsonKey(
    
    name: r'deleted',
    required: true,
    includeIfNull: false,
  )


  final bool deleted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ScheduleTable &&
      other.tableId == tableId &&
      other.name == name &&
      other.area == area &&
      other.deleted == deleted;

    @override
    int get hashCode =>
        tableId.hashCode +
        name.hashCode +
        area.hashCode +
        deleted.hashCode;

  factory ScheduleTable.fromJson(Map<String, dynamic> json) => _$ScheduleTableFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleTableToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

