//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/stock_movement_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_movement.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StockMovement {
  /// Returns a new [StockMovement] instance.
  StockMovement({

    required  this.stockMovementId,

    required  this.type,

    required  this.qtyChange,

    required  this.stockAfter,

    required  this.reason,

    required  this.note,

    required  this.user,

    required  this.orderId,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'stock_movement_id',
    required: true,
    includeIfNull: false,
  )


  final String stockMovementId;



      /// `initial`: the count tracking started from; `in`, `out`, `set`: an adjustment; `sale`, `void`: the cashier's, with their order. 
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final StockMovementTypeEnum type;



      /// The change to the count, new minus old; 0 for a stock take that matched.
  @JsonKey(
    
    name: r'qty_change',
    required: true,
    includeIfNull: false,
  )


  final int qtyChange;



      /// The count it left.
  @JsonKey(
    
    name: r'stock_after',
    required: true,
    includeIfNull: false,
  )


  final int stockAfter;



      /// An adjustment's reason, or `initial`; null for a sale or void.
  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: true,
  )


  final StockMovementReasonEnum? reason;



  @JsonKey(
    
    name: r'note',
    required: true,
    includeIfNull: true,
  )


  final String? note;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: false,
  )


  final StockMovementUser user;



      /// The order of a sale or void.
  @JsonKey(
    
    name: r'order_id',
    required: true,
    includeIfNull: true,
  )


  final String? orderId;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StockMovement &&
      other.stockMovementId == stockMovementId &&
      other.type == type &&
      other.qtyChange == qtyChange &&
      other.stockAfter == stockAfter &&
      other.reason == reason &&
      other.note == note &&
      other.user == user &&
      other.orderId == orderId &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        stockMovementId.hashCode +
        type.hashCode +
        qtyChange.hashCode +
        stockAfter.hashCode +
        (reason == null ? 0 : reason.hashCode) +
        (note == null ? 0 : note.hashCode) +
        user.hashCode +
        (orderId == null ? 0 : orderId.hashCode) +
        createdAt.hashCode;

  factory StockMovement.fromJson(Map<String, dynamic> json) => _$StockMovementFromJson(json);

  Map<String, dynamic> toJson() => _$StockMovementToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `initial`: the count tracking started from; `in`, `out`, `set`: an adjustment; `sale`, `void`: the cashier's, with their order. 
enum StockMovementTypeEnum {
@JsonValue(r'initial')
initial(r'initial'),
@JsonValue(r'in')
in_(r'in'),
@JsonValue(r'out')
out_(r'out'),
@JsonValue(r'set')
set_(r'set'),
@JsonValue(r'sale')
sale(r'sale'),
@JsonValue(r'void')
void_(r'void');

const StockMovementTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// An adjustment's reason, or `initial`; null for a sale or void.
enum StockMovementReasonEnum {
@JsonValue(r'initial')
initial(r'initial'),
@JsonValue(r'restock')
restock(r'restock'),
@JsonValue(r'damaged')
damaged(r'damaged'),
@JsonValue(r'correction')
correction(r'correction'),
@JsonValue(r'other')
other(r'other');

const StockMovementReasonEnum(this.value);

final String value;

@override
String toString() => value;
}


