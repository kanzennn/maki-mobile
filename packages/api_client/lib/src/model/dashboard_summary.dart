//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardSummary {
  /// Returns a new [DashboardSummary] instance.
  DashboardSummary({

    required  this.sales,

    required  this.transactions,

    required  this.averageTransaction,

    required  this.itemsSold,

    required  this.voidCount,

    required  this.voidTotal,

    required  this.previousSales,

    required  this.previousTransactions,
  });

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
    
    name: r'average_transaction',
    required: true,
    includeIfNull: false,
  )


  final int averageTransaction;



  @JsonKey(
    
    name: r'items_sold',
    required: true,
    includeIfNull: false,
  )


  final int itemsSold;



  @JsonKey(
    
    name: r'void_count',
    required: true,
    includeIfNull: false,
  )


  final int voidCount;



  @JsonKey(
    
    name: r'void_total',
    required: true,
    includeIfNull: false,
  )


  final int voidTotal;



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
    bool operator ==(Object other) => identical(this, other) || other is DashboardSummary &&
      other.sales == sales &&
      other.transactions == transactions &&
      other.averageTransaction == averageTransaction &&
      other.itemsSold == itemsSold &&
      other.voidCount == voidCount &&
      other.voidTotal == voidTotal &&
      other.previousSales == previousSales &&
      other.previousTransactions == previousTransactions;

    @override
    int get hashCode =>
        sales.hashCode +
        transactions.hashCode +
        averageTransaction.hashCode +
        itemsSold.hashCode +
        voidCount.hashCode +
        voidTotal.hashCode +
        previousSales.hashCode +
        previousTransactions.hashCode;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) => _$DashboardSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

