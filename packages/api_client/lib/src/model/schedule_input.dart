//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ScheduleInput {
  /// Returns a new [ScheduleInput] instance.
  ScheduleInput({

    required  this.title,

    required  this.startAt,

    required  this.endAt,

    required  this.tableIds,

     this.confirmOverlap,
  });

  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;



  @JsonKey(
    
    name: r'start_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime startAt;



  @JsonKey(
    
    name: r'end_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime endAt;



  @JsonKey(
    
    name: r'table_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> tableIds;



      /// Saves the schedule though another has some of its tables out at the same time.
  @JsonKey(
    
    name: r'confirm_overlap',
    required: false,
    includeIfNull: false,
  )


  final bool? confirmOverlap;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ScheduleInput &&
      other.title == title &&
      other.startAt == startAt &&
      other.endAt == endAt &&
      other.tableIds == tableIds &&
      other.confirmOverlap == confirmOverlap;

    @override
    int get hashCode =>
        title.hashCode +
        startAt.hashCode +
        endAt.hashCode +
        tableIds.hashCode +
        confirmOverlap.hashCode;

  factory ScheduleInput.fromJson(Map<String, dynamic> json) => _$ScheduleInputFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

