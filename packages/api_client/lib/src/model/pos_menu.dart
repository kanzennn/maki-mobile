//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/stock_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_menu.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosMenu {
  /// Returns a new [PosMenu] instance.
  PosMenu({

    required  this.menuId,

    required  this.categoryId,

    required  this.name,

    required  this.description,

    required  this.sku,

    required  this.price,

    required  this.imageUrl,

    required  this.trackStock,

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
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



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



      /// The photo's address, with the upload milestone; null until then.
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



      /// The count, the most one order may take; null when the stock isn't tracked, always available.
  @JsonKey(
    
    name: r'stock_qty',
    required: true,
    includeIfNull: true,
  )


  final int? stockQty;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosMenu &&
      other.menuId == menuId &&
      other.categoryId == categoryId &&
      other.name == name &&
      other.description == description &&
      other.sku == sku &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.trackStock == trackStock &&
      other.stockQty == stockQty &&
      other.stockAlert == stockAlert &&
      other.stockStatus == stockStatus;

    @override
    int get hashCode =>
        menuId.hashCode +
        categoryId.hashCode +
        name.hashCode +
        (description == null ? 0 : description.hashCode) +
        (sku == null ? 0 : sku.hashCode) +
        price.hashCode +
        (imageUrl == null ? 0 : imageUrl.hashCode) +
        trackStock.hashCode +
        (stockQty == null ? 0 : stockQty.hashCode) +
        (stockAlert == null ? 0 : stockAlert.hashCode) +
        stockStatus.hashCode;

  factory PosMenu.fromJson(Map<String, dynamic> json) => _$PosMenuFromJson(json);

  Map<String, dynamic> toJson() => _$PosMenuToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

