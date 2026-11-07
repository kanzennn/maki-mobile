//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_control_method.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentControlMethod {
  /// Returns a new [PaymentControlMethod] instance.
  PaymentControlMethod({

    required  this.method,

    required  this.isEnabled,

    required  this.available,
  });

  @JsonKey(
    
    name: r'method',
    required: true,
    includeIfNull: false,
  )


  final PaymentControlMethodMethodEnum method;



  @JsonKey(
    
    name: r'is_enabled',
    required: true,
    includeIfNull: false,
  )


  final bool isEnabled;



      /// False for a method not released yet, which stays off.
  @JsonKey(
    
    name: r'available',
    required: true,
    includeIfNull: false,
  )


  final bool available;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentControlMethod &&
      other.method == method &&
      other.isEnabled == isEnabled &&
      other.available == available;

    @override
    int get hashCode =>
        method.hashCode +
        isEnabled.hashCode +
        available.hashCode;

  factory PaymentControlMethod.fromJson(Map<String, dynamic> json) => _$PaymentControlMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentControlMethodToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum PaymentControlMethodMethodEnum {
@JsonValue(r'cash')
cash(r'cash'),
@JsonValue(r'qris')
qris(r'qris'),
@JsonValue(r'debit')
debit(r'debit');

const PaymentControlMethodMethodEnum(this.value);

final String value;

@override
String toString() => value;
}


