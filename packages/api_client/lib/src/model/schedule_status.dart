//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

enum ScheduleStatus {
      @JsonValue(r'upcoming')
      upcoming(r'upcoming'),
      @JsonValue(r'ongoing')
      ongoing(r'ongoing'),
      @JsonValue(r'finished')
      finished(r'finished'),
      @JsonValue(r'cancelled')
      cancelled(r'cancelled');

  const ScheduleStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
