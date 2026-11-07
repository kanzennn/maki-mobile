//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_cashiers_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardCashiersInner {
  /// Returns a new [DashboardCashiersInner] instance.
  DashboardCashiersInner({

    required  this.userId,

    required  this.name,

    required  this.sales,

    required  this.transactions,
  });

  @JsonKey(
    
    name: r'user_id',
    required: true,
    includeIfNull: false,
  )


  final String userId;



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





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardCashiersInner &&
      other.userId == userId &&
      other.name == name &&
      other.sales == sales &&
      other.transactions == transactions;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode +
        sales.hashCode +
        transactions.hashCode;

  factory DashboardCashiersInner.fromJson(Map<String, dynamic> json) => _$DashboardCashiersInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardCashiersInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

