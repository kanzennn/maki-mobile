//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_log_outlet.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionLogOutlet {
  /// Returns a new [ActionLogOutlet] instance.
  ActionLogOutlet({

    required  this.outletId,

    required  this.code,

    required  this.name,
  });

  @JsonKey(
    
    name: r'outlet_id',
    required: true,
    includeIfNull: false,
  )


  final String outletId;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionLogOutlet &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode;

  factory ActionLogOutlet.fromJson(Map<String, dynamic> json) => _$ActionLogOutletFromJson(json);

  Map<String, dynamic> toJson() => _$ActionLogOutletToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

