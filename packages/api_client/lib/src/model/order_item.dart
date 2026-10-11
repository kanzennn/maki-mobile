//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderItem {
  /// Returns a new [OrderItem] instance.
  OrderItem({

    required  this.orderItemId,

    required  this.menuId,

    required  this.menuName,

    required  this.price,

    required  this.qty,

    required  this.note,

    required  this.lineTotal,
  });

  @JsonKey(
    
    name: r'order_item_id',
    required: true,
    includeIfNull: false,
  )


  final String orderItemId;



  @JsonKey(
    
    name: r'menu_id',
    required: true,
    includeIfNull: false,
  )


  final String menuId;



      /// The menu's name at the sale.
  @JsonKey(
    
    name: r'menu_name',
    required: true,
    includeIfNull: false,
  )


  final String menuName;



      /// The menu's price at the sale.
  @JsonKey(
    
    name: r'price',
    required: true,
    includeIfNull: false,
  )


  final int price;



  @JsonKey(
    
    name: r'qty',
    required: true,
    includeIfNull: false,
  )


  final int qty;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



  @JsonKey(
    
    name: r'line_total',
    required: true,
    includeIfNull: false,
  )


  final int lineTotal;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrderItem &&
      other.orderItemId == orderItemId &&
      other.menuId == menuId &&
      other.menuName == menuName &&
      other.price == price &&
      other.qty == qty &&
      other.note == note &&
      other.lineTotal == lineTotal;

    @override
    int get hashCode =>
        orderItemId.hashCode +
        menuId.hashCode +
        menuName.hashCode +
        price.hashCode +
        qty.hashCode +
        (note == null ? 0 : note.hashCode) +
        lineTotal.hashCode;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

