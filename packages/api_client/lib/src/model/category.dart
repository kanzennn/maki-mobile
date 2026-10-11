//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Category {
  /// Returns a new [Category] instance.
  Category({

    required  this.categoryId,

    required  this.name,

    required  this.icon,

    required  this.sortOrder,

    required  this.isActive,

    required  this.menuCount,

    required  this.createdAt,

    required  this.updatedAt,
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



      /// An emoji, on the category's tile and on its menus until they have a photo.
  @JsonKey(
    
    name: r'icon',
    required: true,
    includeIfNull: true,
  )


  final String? icon;



      /// Its place in the cashier's order, from 0.
  @JsonKey(
    
    name: r'sort_order',
    required: true,
    includeIfNull: false,
  )


  final int sortOrder;



      /// An inactive category and its menus are hidden at the cashier.
  @JsonKey(
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;



      /// Menus in it, deleted ones aside.
  @JsonKey(
    
    name: r'menu_count',
    required: true,
    includeIfNull: false,
  )


  final int menuCount;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Category &&
      other.categoryId == categoryId &&
      other.name == name &&
      other.icon == icon &&
      other.sortOrder == sortOrder &&
      other.isActive == isActive &&
      other.menuCount == menuCount &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        categoryId.hashCode +
        name.hashCode +
        (icon == null ? 0 : icon.hashCode) +
        sortOrder.hashCode +
        isActive.hashCode +
        menuCount.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

