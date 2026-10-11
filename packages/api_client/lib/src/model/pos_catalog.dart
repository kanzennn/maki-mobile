//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/pos_category.dart';
import 'package:maki_api_client/src/model/pos_outlet.dart';
import 'package:maki_api_client/src/model/dine_in_mode.dart';
import 'package:maki_api_client/src/model/payment_method.dart';
import 'package:maki_api_client/src/model/pos_menu.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_catalog.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosCatalog {
  /// Returns a new [PosCatalog] instance.
  PosCatalog({

    required  this.outlet,

    required  this.paymentMethods,

    required  this.dineInMode,

    required  this.categories,

    required  this.menus,
  });

  @JsonKey(
    
    name: r'outlet',
    required: true,
    includeIfNull: false,
  )


  final PosOutlet outlet;



      /// The methods the cashier offers, in order.
  @JsonKey(
    
    name: r'payment_methods',
    required: true,
    includeIfNull: false,
  )


  final List<PaymentMethod> paymentMethods;



  @JsonKey(
    
    name: r'dine_in_mode',
    required: true,
    includeIfNull: false,
  )


  final DineInMode dineInMode;



      /// The active categories holding one of the menus, in the cashier's order.
  @JsonKey(
    
    name: r'categories',
    required: true,
    includeIfNull: false,
  )


  final List<PosCategory> categories;



      /// In the cashier's order.
  @JsonKey(
    
    name: r'menus',
    required: true,
    includeIfNull: false,
  )


  final List<PosMenu> menus;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosCatalog &&
      other.outlet == outlet &&
      other.paymentMethods == paymentMethods &&
      other.dineInMode == dineInMode &&
      other.categories == categories &&
      other.menus == menus;

    @override
    int get hashCode =>
        outlet.hashCode +
        paymentMethods.hashCode +
        dineInMode.hashCode +
        categories.hashCode +
        menus.hashCode;

  factory PosCatalog.fromJson(Map<String, dynamic> json) => _$PosCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$PosCatalogToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

