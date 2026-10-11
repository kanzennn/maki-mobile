//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_item.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateOrderItem {
  /// Returns a new [CreateOrderItem] instance.
  CreateOrderItem({

    required  this.menuId,

    required  this.qty,

    required  this.price,

     this.note,
  });

  @JsonKey(
    
    name: r'menu_id',
    required: true,
    includeIfNull: false,
  )


  final String menuId;



          // minimum: 1
          // maximum: 999
  @JsonKey(
    
    name: r'qty',
    required: true,
    includeIfNull: false,
  )


  final int qty;



      /// The menu's price, as the cashier showed it.
  @JsonKey(
    
    name: r'price',
    required: true,
    includeIfNull: false,
  )


  final int price;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateOrderItem &&
      other.menuId == menuId &&
      other.qty == qty &&
      other.price == price &&
      other.note == note;

    @override
    int get hashCode =>
        menuId.hashCode +
        qty.hashCode +
        price.hashCode +
        (note == null ? 0 : note.hashCode);

  factory CreateOrderItem.fromJson(Map<String, dynamic> json) => _$CreateOrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderItemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

