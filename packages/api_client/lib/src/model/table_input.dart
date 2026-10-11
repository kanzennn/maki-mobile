//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/table_shape.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TableInput {
  /// Returns a new [TableInput] instance.
  TableInput({

    required  this.name,

    required  this.areaId,

     this.capacity,

     this.shape,

     this.isActive,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// A table moved to another area leaves its place on the old one's layout.
  @JsonKey(
    
    name: r'area_id',
    required: true,
    includeIfNull: false,
  )


  final String areaId;



          // minimum: 1
          // maximum: 99
  @JsonKey(
    
    name: r'capacity',
    required: false,
    includeIfNull: false,
  )


  final int? capacity;



  @JsonKey(
    
    name: r'shape',
    required: false,
    includeIfNull: false,
  )


  final TableShape? shape;



      /// For a new table, active when left out; an existing one changes it with `PATCH …/status`.
  @JsonKey(
    
    name: r'is_active',
    required: false,
    includeIfNull: false,
  )


  final bool? isActive;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TableInput &&
      other.name == name &&
      other.areaId == areaId &&
      other.capacity == capacity &&
      other.shape == shape &&
      other.isActive == isActive;

    @override
    int get hashCode =>
        name.hashCode +
        areaId.hashCode +
        (capacity == null ? 0 : capacity.hashCode) +
        shape.hashCode +
        isActive.hashCode;

  factory TableInput.fromJson(Map<String, dynamic> json) => _$TableInputFromJson(json);

  Map<String, dynamic> toJson() => _$TableInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

