//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_top_menus_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardTopMenusInner {
  /// Returns a new [DashboardTopMenusInner] instance.
  DashboardTopMenusInner({

    required  this.menuId,

    required  this.outletId,

    required  this.name,

    required  this.qty,

    required  this.sales,
  });

  @JsonKey(
    
    name: r'menu_id',
    required: true,
    includeIfNull: false,
  )


  final String menuId;



  @JsonKey(
    
    name: r'outlet_id',
    required: true,
    includeIfNull: false,
  )


  final String outletId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'qty',
    required: true,
    includeIfNull: false,
  )


  final int qty;



  @JsonKey(
    
    name: r'sales',
    required: true,
    includeIfNull: false,
  )


  final int sales;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardTopMenusInner &&
      other.menuId == menuId &&
      other.outletId == outletId &&
      other.name == name &&
      other.qty == qty &&
      other.sales == sales;

    @override
    int get hashCode =>
        menuId.hashCode +
        outletId.hashCode +
        name.hashCode +
        qty.hashCode +
        sales.hashCode;

  factory DashboardTopMenusInner.fromJson(Map<String, dynamic> json) => _$DashboardTopMenusInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardTopMenusInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

