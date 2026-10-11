//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_person.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderPerson {
  /// Returns a new [OrderPerson] instance.
  OrderPerson({

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
    bool operator ==(Object other) => identical(this, other) || other is OrderPerson &&
      other.userId == userId &&
      other.name == name;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode;

  factory OrderPerson.fromJson(Map<String, dynamic> json) => _$OrderPersonFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPersonToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

