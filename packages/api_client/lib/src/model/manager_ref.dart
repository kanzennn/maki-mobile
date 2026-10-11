//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manager_ref.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ManagerRef {
  /// Returns a new [ManagerRef] instance.
  ManagerRef({

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
    bool operator ==(Object other) => identical(this, other) || other is ManagerRef &&
      other.userId == userId &&
      other.name == name;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode;

  factory ManagerRef.fromJson(Map<String, dynamic> json) => _$ManagerRefFromJson(json);

  Map<String, dynamic> toJson() => _$ManagerRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

