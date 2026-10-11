//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum OrderType {
      @JsonValue(r'dine_in')
      dineIn(r'dine_in'),
      @JsonValue(r'takeaway')
      takeaway(r'takeaway');

  const OrderType(this.value);

  final String value;

  @override
  String toString() => value;
}
