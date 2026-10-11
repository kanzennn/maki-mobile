//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Worked out when read, in this order: `occupied` while customers are seated, `inactive` (turned off), `scheduled` (a schedule under way has it out of service), `available`. The cashier seats an order at an available or an occupied table. 
enum TableStatus {
      @JsonValue(r'available')
      available(r'available'),
      @JsonValue(r'occupied')
      occupied(r'occupied'),
      @JsonValue(r'inactive')
      inactive(r'inactive'),
      @JsonValue(r'scheduled')
      scheduled(r'scheduled');

  const TableStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
