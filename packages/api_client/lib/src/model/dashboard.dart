//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/dashboard_hours_inner.dart';
import 'package:maki_api_client/src/model/dashboard_outlets_inner.dart';
import 'package:maki_api_client/src/model/dashboard_payment_methods_inner.dart';
import 'package:maki_api_client/src/model/dashboard_cashiers_inner.dart';
import 'package:maki_api_client/src/model/dashboard_summary.dart';
import 'package:maki_api_client/src/model/dashboard_tables_inner.dart';
import 'package:maki_api_client/src/model/dashboard_top_menus_inner.dart';
import 'package:maki_api_client/src/model/dashboard_days_inner.dart';
import 'package:maki_api_client/src/model/dashboard_low_stock_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Dashboard {
  /// Returns a new [Dashboard] instance.
  Dashboard({

    required  this.from,

    required  this.to,

    required  this.previousFrom,

    required  this.previousTo,

    required  this.summary,

    required  this.days,

    required  this.hours,

    required  this.outlets,

    required  this.paymentMethods,

    required  this.topMenus,

    required  this.lowStock,

    required  this.cashiers,

    required  this.tables,
  });

  @JsonKey(
    
    name: r'from',
    required: true,
    includeIfNull: false,
  )


  final DateTime from;



  @JsonKey(
    
    name: r'to',
    required: true,
    includeIfNull: false,
  )


  final DateTime to;



  @JsonKey(
    
    name: r'previous_from',
    required: true,
    includeIfNull: false,
  )


  final DateTime previousFrom;



  @JsonKey(
    
    name: r'previous_to',
    required: true,
    includeIfNull: false,
  )


  final DateTime previousTo;



  @JsonKey(
    
    name: r'summary',
    required: true,
    includeIfNull: false,
  )


  final DashboardSummary summary;



      /// Every day of the period, those without a sale too.
  @JsonKey(
    
    name: r'days',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardDaysInner> days;



      /// An outlet's, every hour of the day, 0 to 23.
  @JsonKey(
    
    name: r'hours',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardHoursInner> hours;



      /// The Owner's ranking, the best first.
  @JsonKey(
    
    name: r'outlets',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardOutletsInner> outlets;



  @JsonKey(
    
    name: r'payment_methods',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardPaymentMethodsInner> paymentMethods;



      /// At most ten, the most sold first.
  @JsonKey(
    
    name: r'top_menus',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardTopMenusInner> topMenus;



      /// Menus at or below their alert, or out of stock, now, whatever the period. At most 50, the emptiest first.
  @JsonKey(
    
    name: r'low_stock',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardLowStockInner> lowStock;



      /// An outlet's, the most sold first.
  @JsonKey(
    
    name: r'cashiers',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardCashiersInner> cashiers;



      /// An outlet's tables customers are seated at now, whatever the period.
  @JsonKey(
    
    name: r'tables',
    required: true,
    includeIfNull: false,
  )


  final List<DashboardTablesInner> tables;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Dashboard &&
      other.from == from &&
      other.to == to &&
      other.previousFrom == previousFrom &&
      other.previousTo == previousTo &&
      other.summary == summary &&
      other.days == days &&
      other.hours == hours &&
      other.outlets == outlets &&
      other.paymentMethods == paymentMethods &&
      other.topMenus == topMenus &&
      other.lowStock == lowStock &&
      other.cashiers == cashiers &&
      other.tables == tables;

    @override
    int get hashCode =>
        from.hashCode +
        to.hashCode +
        previousFrom.hashCode +
        previousTo.hashCode +
        summary.hashCode +
        days.hashCode +
        hours.hashCode +
        outlets.hashCode +
        paymentMethods.hashCode +
        topMenus.hashCode +
        lowStock.hashCode +
        cashiers.hashCode +
        tables.hashCode;

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

