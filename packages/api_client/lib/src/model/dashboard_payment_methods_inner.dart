//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_payment_methods_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DashboardPaymentMethodsInner {
  /// Returns a new [DashboardPaymentMethodsInner] instance.
  DashboardPaymentMethodsInner({

    required  this.method,

    required  this.amount,

    required  this.transactions,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final String method;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final int amount;



  @JsonKey(
    
    name: r'transactions',
    required: true,
    includeIfNull: false,
  )


  final int transactions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DashboardPaymentMethodsInner &&
      other.method == method &&
      other.amount == amount &&
      other.transactions == transactions;

    @override
    int get hashCode =>
        method.hashCode +
        amount.hashCode +
        transactions.hashCode;

  factory DashboardPaymentMethodsInner.fromJson(Map<String, dynamic> json) => _$DashboardPaymentMethodsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardPaymentMethodsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

