//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_low_stock_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardLowStockInner {
  /// Returns a new [DashboardLowStockInner] instance.
  DashboardLowStockInner({

    required  this.menuId,

    required  this.outletId,

    required  this.outletName,

    required  this.name,

    required  this.stockQty,

    required  this.stockAlert,

    required  this.stockStatus,
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
    
    name: r'outlet_name',
    required: true,
    includeIfNull: false,
  )


  final String outletName;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'stock_qty',
    required: true,
    includeIfNull: false,
  )


  final int stockQty;



  @JsonKey(
    
    name: r'stock_alert',
    required: true,
    includeIfNull: true,
  )


  final int? stockAlert;



  @JsonKey(
    
    name: r'stock_status',
    required: true,
    includeIfNull: false,
  )


  final DashboardLowStockInnerStockStatusEnum stockStatus;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardLowStockInner &&
      other.menuId == menuId &&
      other.outletId == outletId &&
      other.outletName == outletName &&
      other.name == name &&
      other.stockQty == stockQty &&
      other.stockAlert == stockAlert &&
      other.stockStatus == stockStatus;

    @override
    int get hashCode =>
        menuId.hashCode +
        outletId.hashCode +
        outletName.hashCode +
        name.hashCode +
        stockQty.hashCode +
        (stockAlert == null ? 0 : stockAlert.hashCode) +
        stockStatus.hashCode;

  factory DashboardLowStockInner.fromJson(Map<String, dynamic> json) => _$DashboardLowStockInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardLowStockInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum DashboardLowStockInnerStockStatusEnum {
@JsonValue(r'low')
low(r'low'),
@JsonValue(r'out')
out_(r'out');

const DashboardLowStockInnerStockStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


