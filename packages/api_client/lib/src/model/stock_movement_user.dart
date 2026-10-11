//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_movement_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StockMovementUser {
  /// Returns a new [StockMovementUser] instance.
  StockMovementUser({

    required  this.userId,

    required  this.name,
  });

  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StockMovementUser &&
      other.userId == userId &&
      other.name == name;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode;

  factory StockMovementUser.fromJson(Map<String, dynamic> json) => _$StockMovementUserFromJson(json);

  Map<String, dynamic> toJson() => _$StockMovementUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

