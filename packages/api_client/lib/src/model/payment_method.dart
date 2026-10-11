//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum PaymentMethod {
      @JsonValue(r'cash')
      cash(r'cash'),
      @JsonValue(r'qris')
      qris(r'qris'),
      @JsonValue(r'debit')
      debit(r'debit');

  const PaymentMethod(this.value);

  final String value;

  @override
  String toString() => value;
}
