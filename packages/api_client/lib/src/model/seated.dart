//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seated.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Seated {
  /// Returns a new [Seated] instance.
  Seated({

    required  this.since,

    required  this.orders,
  });

      /// When the sale that seated them was taken.
  @JsonKey(
    
    name: r'since',
    required: true,
    includeIfNull: false,
  )


  final DateTime since;



      /// Sales at the table since.
  @JsonKey(
    
    name: r'orders',
    required: true,
    includeIfNull: false,
  )


  final int orders;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Seated &&
      other.since == since &&
      other.orders == orders;

    @override
    int get hashCode =>
        since.hashCode +
        orders.hashCode;

  factory Seated.fromJson(Map<String, dynamic> json) => _$SeatedFromJson(json);

  Map<String, dynamic> toJson() => _$SeatedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

