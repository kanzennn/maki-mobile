//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_tables_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardTablesInner {
  /// Returns a new [DashboardTablesInner] instance.
  DashboardTablesInner({

    required  this.tableId,

    required  this.name,

    required  this.areaName,

    required  this.orders,
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
    
    name: r'area_name',
    required: true,
    includeIfNull: false,
  )


  final String areaName;



  @JsonKey(
    
    name: r'orders',
    required: true,
    includeIfNull: false,
  )


  final int orders;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardTablesInner &&
      other.tableId == tableId &&
      other.name == name &&
      other.areaName == areaName &&
      other.orders == orders;

    @override
    int get hashCode =>
        tableId.hashCode +
        name.hashCode +
        areaName.hashCode +
        orders.hashCode;

  factory DashboardTablesInner.fromJson(Map<String, dynamic> json) => _$DashboardTablesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardTablesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

