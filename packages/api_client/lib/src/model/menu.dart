//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/stock_status.dart';
import 'package:maki_api_client/src/model/menu_category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Menu {
  /// Returns a new [Menu] instance.
  Menu({

    required  this.menuId,

    required  this.name,

    required  this.description,

    required  this.sku,

    required  this.price,

    required  this.imageUrl,

    required  this.trackStock,

    required  this.stockQty,

    required  this.stockAlert,

    required  this.stockStatus,

    required  this.isActive,

    required  this.category,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'menu_id',
    required: true,
    includeIfNull: false,
  )


  final String menuId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: true,
  )


  final String? description;



  @JsonKey(
    
    name: r'sku',
    required: true,
    includeIfNull: true,
  )


  final String? sku;



      /// Rupiah.
  @JsonKey(
    
    name: r'price',
    required: true,
    includeIfNull: false,
  )


  final int price;



      /// The photo on the CDN; null until photos arrive, and for a menu without one.
  @JsonKey(
    
    name: r'image_url',
    required: true,
    includeIfNull: true,
  )


  final String? imageUrl;



  @JsonKey(
    
    name: r'track_stock',
    required: true,
    includeIfNull: false,
  )


  final bool trackStock;



      /// The count, for a tracked menu.
  @JsonKey(
    
    name: r'stock_qty',
    required: true,
    includeIfNull: false,
  )


  final int stockQty;



      /// At or below it, stock is low; null or 0 is off.
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


  final StockStatus stockStatus;



      /// An inactive menu is hidden at the cashier.
  @JsonKey(
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;



  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final MenuCategory category;



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
    bool operator ==(Object other) => identical(this, other) || other is Menu &&
      other.menuId == menuId &&
      other.name == name &&
      other.description == description &&
      other.sku == sku &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.trackStock == trackStock &&
      other.stockQty == stockQty &&
      other.stockAlert == stockAlert &&
      other.stockStatus == stockStatus &&
      other.isActive == isActive &&
      other.category == category &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        menuId.hashCode +
        name.hashCode +
        (description == null ? 0 : description.hashCode) +
        (sku == null ? 0 : sku.hashCode) +
        price.hashCode +
        (imageUrl == null ? 0 : imageUrl.hashCode) +
        trackStock.hashCode +
        stockQty.hashCode +
        (stockAlert == null ? 0 : stockAlert.hashCode) +
        stockStatus.hashCode +
        isActive.hashCode +
        category.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

