//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_category.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosCategory {
  /// Returns a new [PosCategory] instance.
  PosCategory({

    required  this.categoryId,

    required  this.name,

    required  this.icon,

    required  this.itemCount,
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



      /// How many of the catalog's menus it holds.
  @JsonKey(
    
    name: r'item_count',
    required: true,
    includeIfNull: false,
  )


  final int itemCount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosCategory &&
      other.categoryId == categoryId &&
      other.name == name &&
      other.icon == icon &&
      other.itemCount == itemCount;

    @override
    int get hashCode =>
        categoryId.hashCode +
        name.hashCode +
        (icon == null ? 0 : icon.hashCode) +
        itemCount.hashCode;

  factory PosCategory.fromJson(Map<String, dynamic> json) => _$PosCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$PosCategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

