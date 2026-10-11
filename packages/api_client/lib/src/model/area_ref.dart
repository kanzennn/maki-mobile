//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area_ref.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AreaRef {
  /// Returns a new [AreaRef] instance.
  AreaRef({

    required  this.areaId,

    required  this.name,
  });

  @JsonKey(
    
    name: r'area_id',
    required: true,
    includeIfNull: false,
  )


  final String areaId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AreaRef &&
      other.areaId == areaId &&
      other.name == name;

    @override
    int get hashCode =>
        areaId.hashCode +
        name.hashCode;

  factory AreaRef.fromJson(Map<String, dynamic> json) => _$AreaRefFromJson(json);

  Map<String, dynamic> toJson() => _$AreaRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

