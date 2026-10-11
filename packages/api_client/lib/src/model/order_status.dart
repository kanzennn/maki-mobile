//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
      @JsonValue(r'paid')
      paid(r'paid'),
      @JsonValue(r'void')
      void_(r'void');

  const OrderStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
