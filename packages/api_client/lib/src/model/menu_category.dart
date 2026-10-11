//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_category.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MenuCategory {
  /// Returns a new [MenuCategory] instance.
  MenuCategory({

    required  this.categoryId,

    required  this.name,

    required  this.icon,

    required  this.isActive,
  });

  @JsonKey(
    
    name: r'category_id',
    required: true,
    includeIfNull: false,
  )


  final String categoryId;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'icon',
    required: true,
    includeIfNull: true,
  )


  final String? icon;



  @JsonKey(
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MenuCategory &&
      other.categoryId == categoryId &&
      other.name == name &&
      other.icon == icon &&
      other.isActive == isActive;

    @override
    int get hashCode =>
        categoryId.hashCode +
        name.hashCode +
        (icon == null ? 0 : icon.hashCode) +
        isActive.hashCode;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

