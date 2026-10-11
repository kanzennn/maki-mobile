//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_adjustment_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StockAdjustmentInput {
  /// Returns a new [StockAdjustmentInput] instance.
  StockAdjustmentInput({

    required  this.type,

    required  this.qty,

    required  this.reason,

     this.note,
  });

      /// `in` adds, `out` takes away, `set` is a stock take: the count found.
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final StockAdjustmentInputTypeEnum type;



      /// The amount to add or take away (at least 1), or the count found.
          // minimum: 0
          // maximum: 1000000
  @JsonKey(
    
    name: r'qty',
    required: true,
    includeIfNull: false,
  )


  final int qty;



      /// `damaged` is damaged or spoiled; `other` says what in `note`.
  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final StockAdjustmentInputReasonEnum reason;



      /// Required for the reason `other`. Shown as typed, never translated.
  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StockAdjustmentInput &&
      other.type == type &&
      other.qty == qty &&
      other.reason == reason &&
      other.note == note;

    @override
    int get hashCode =>
        type.hashCode +
        qty.hashCode +
        reason.hashCode +
        (note == null ? 0 : note.hashCode);

  factory StockAdjustmentInput.fromJson(Map<String, dynamic> json) => _$StockAdjustmentInputFromJson(json);

  Map<String, dynamic> toJson() => _$StockAdjustmentInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `in` adds, `out` takes away, `set` is a stock take: the count found.
enum StockAdjustmentInputTypeEnum {
@JsonValue(r'in')
in_(r'in'),
@JsonValue(r'out')
out_(r'out'),
@JsonValue(r'set')
set_(r'set');

const StockAdjustmentInputTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// `damaged` is damaged or spoiled; `other` says what in `note`.
enum StockAdjustmentInputReasonEnum {
@JsonValue(r'restock')
restock(r'restock'),
@JsonValue(r'damaged')
damaged(r'damaged'),
@JsonValue(r'correction')
correction(r'correction'),
@JsonValue(r'other')
other(r'other');

const StockAdjustmentInputReasonEnum(this.value);

final String value;

@override
String toString() => value;
}


