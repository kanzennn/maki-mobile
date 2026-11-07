//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_days_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardDaysInner {
  /// Returns a new [DashboardDaysInner] instance.
  DashboardDaysInner({

    required  this.date,

    required  this.sales,

    required  this.transactions,
  });

  @JsonKey(
    
    name: r'date',
    required: true,
    includeIfNull: false,
  )


  final DateTime date;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardDaysInner &&
      other.date == date &&
      other.sales == sales &&
      other.transactions == transactions;

    @override
    int get hashCode =>
        date.hashCode +
        sales.hashCode +
        transactions.hashCode;

  factory DashboardDaysInner.fromJson(Map<String, dynamic> json) => _$DashboardDaysInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDaysInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

