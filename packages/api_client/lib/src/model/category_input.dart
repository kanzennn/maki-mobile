//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CategoryInput {
  /// Returns a new [CategoryInput] instance.
  CategoryInput({

    required  this.name,

     this.icon,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



      /// An emoji, up to 8 characters; no letters or spaces.
  @JsonKey(
    
    name: r'icon',
    required: false,
    includeIfNull: false,
  )


  final String? icon;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CategoryInput &&
      other.name == name &&
      other.icon == icon;

    @override
    int get hashCode =>
        name.hashCode +
        (icon == null ? 0 : icon.hashCode);

  factory CategoryInput.fromJson(Map<String, dynamic> json) => _$CategoryInputFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

