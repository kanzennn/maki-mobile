//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `untracked`: always available. Tracked stock is `out` at 0 or below, `low` above 0 and at or below `stock_alert`, `ok` otherwise; an alert of 0 or none is off. 
enum StockStatus {
      @JsonValue(r'untracked')
      untracked(r'untracked'),
      @JsonValue(r'ok')
      ok(r'ok'),
      @JsonValue(r'low')
      low(r'low'),
      @JsonValue(r'out')
      out_(r'out');

  const StockStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
