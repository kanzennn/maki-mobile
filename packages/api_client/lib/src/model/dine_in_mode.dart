//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// How the outlet seats its dine-in customers, one way at a time: `table`, at the tables of its layout, which the cashier may pick (an outlet that never chose sits them so); `number`, wherever they set down the number stand the cashier gave them, where a waiter brings the order. There a dine-in sale carries its stand's number, and no table. 
enum DineInMode {
      @JsonValue(r'table')
      table(r'table'),
      @JsonValue(r'number')
      number(r'number');

  const DineInMode(this.value);

  final String value;

  @override
  String toString() => value;
}
