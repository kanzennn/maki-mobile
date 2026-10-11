//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MenuInput {
  /// Returns a new [MenuInput] instance.
  MenuInput({

    required  this.name,

    required  this.categoryId,

    required  this.price,

     this.description,

     this.sku,

     this.trackStock = false,

     this.initialStock,

     this.stockAlert,

     this.isActive,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



      /// Rupiah.
          // minimum: 0
          // maximum: 100000000
  @JsonKey(
    
    name: r'price',
    required: true,
    includeIfNull: false,
  )


  final int price;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



      /// Up to 32 letters, digits, dots, dashes or underscores; unique in the outlet.
  @JsonKey(
    
    name: r'sku',
    required: false,
    includeIfNull: false,
  )


  final String? sku;



  @JsonKey(
    defaultValue: false,
    name: r'track_stock',
    required: false,
    includeIfNull: false,
  )


  final bool? trackStock;



      /// The count tracking starts from; counts only then.
          // minimum: 0
          // maximum: 1000000
  @JsonKey(
    
    name: r'initial_stock',
    required: false,
    includeIfNull: false,
  )


  final int? initialStock;



      /// Ignored for an untracked menu.
          // minimum: 0
          // maximum: 1000000
  @JsonKey(
    
    name: r'stock_alert',
    required: false,
    includeIfNull: false,
  )


  final int? stockAlert;



      /// For a new menu (active when left out); PATCH …/status changes an existing one's.
  @JsonKey(
    
    name: r'is_active',
    required: false,
    includeIfNull: false,
  )


  final bool? isActive;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MenuInput &&
      other.name == name &&
      other.categoryId == categoryId &&
      other.price == price &&
      other.description == description &&
      other.sku == sku &&
      other.trackStock == trackStock &&
      other.initialStock == initialStock &&
      other.stockAlert == stockAlert &&
      other.isActive == isActive;

    @override
    int get hashCode =>
        name.hashCode +
        categoryId.hashCode +
        price.hashCode +
        (description == null ? 0 : description.hashCode) +
        (sku == null ? 0 : sku.hashCode) +
        trackStock.hashCode +
        (initialStock == null ? 0 : initialStock.hashCode) +
        (stockAlert == null ? 0 : stockAlert.hashCode) +
        (isActive == null ? 0 : isActive.hashCode);

  factory MenuInput.fromJson(Map<String, dynamic> json) => _$MenuInputFromJson(json);

  Map<String, dynamic> toJson() => _$MenuInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

