//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// How a drawing turns inside its box; a quarter turn also swaps the box's width and height.
enum Rotation {
      @JsonValue(0)
      number0('0'),
      @JsonValue(90)
      number90('90'),
      @JsonValue(180)
      number180('180'),
      @JsonValue(270)
      number270('270');

  const Rotation(this.value);

  final String value;

  @override
  String toString() => value;
}
