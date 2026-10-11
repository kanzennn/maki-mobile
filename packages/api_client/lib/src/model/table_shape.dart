//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum TableShape {
      @JsonValue(r'square')
      square(r'square'),
      @JsonValue(r'round')
      round(r'round'),
      @JsonValue(r'rectangle')
      rectangle(r'rectangle');

  const TableShape(this.value);

  final String value;

  @override
  String toString() => value;
}
