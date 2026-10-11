//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AreaInput {
  /// Returns a new [AreaInput] instance.
  AreaInput({

    required  this.name,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AreaInput &&
      other.name == name;

    @override
    int get hashCode =>
        name.hashCode;

  factory AreaInput.fromJson(Map<String, dynamic> json) => _$AreaInputFromJson(json);

  Map<String, dynamic> toJson() => _$AreaInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

