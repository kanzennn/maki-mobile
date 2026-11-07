//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_outlets_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardOutletsInner {
  /// Returns a new [DashboardOutletsInner] instance.
  DashboardOutletsInner({

    required  this.outletId,

    required  this.code,

    required  this.name,

    required  this.sales,

    required  this.transactions,

    required  this.previousSales,

    required  this.previousTransactions,
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



  @JsonKey(
    
    name: r'sales',
    required: true,
    includeIfNull: false,
  )


  final int sales;



  @JsonKey(
    
    name: r'transactions',
    required: true,
    includeIfNull: false,
  )


  final int transactions;



  @JsonKey(
    
    name: r'previous_sales',
    required: true,
    includeIfNull: false,
  )


  final int previousSales;



  @JsonKey(
    
    name: r'previous_transactions',
    required: true,
    includeIfNull: false,
  )


  final int previousTransactions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardOutletsInner &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name &&
      other.sales == sales &&
      other.transactions == transactions &&
      other.previousSales == previousSales &&
      other.previousTransactions == previousTransactions;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode +
        sales.hashCode +
        transactions.hashCode +
        previousSales.hashCode +
        previousTransactions.hashCode;

  factory DashboardOutletsInner.fromJson(Map<String, dynamic> json) => _$DashboardOutletsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardOutletsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

