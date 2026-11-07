//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_hours_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardHoursInner {
  /// Returns a new [DashboardHoursInner] instance.
  DashboardHoursInner({

    required  this.hour,

    required  this.sales,

    required  this.transactions,
  });

  @JsonKey(
    
    name: r'hour',
    required: true,
    includeIfNull: false,
  )


  final int hour;



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
    bool operator ==(Object other) => identical(this, other) || other is DashboardHoursInner &&
      other.hour == hour &&
      other.sales == sales &&
      other.transactions == transactions;

    @override
    int get hashCode =>
        hour.hashCode +
        sales.hashCode +
        transactions.hashCode;

  factory DashboardHoursInner.fromJson(Map<String, dynamic> json) => _$DashboardHoursInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardHoursInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

