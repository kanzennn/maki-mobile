//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/schedule_status.dart';
import 'package:maki_api_client/src/model/schedule_table.dart';
import 'package:maki_api_client/src/model/user_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Schedule {
  /// Returns a new [Schedule] instance.
  Schedule({

    required  this.scheduleId,

    required  this.title,

    required  this.startAt,

    required  this.endAt,

    required  this.status,

    required  this.tables,

    required  this.createdBy,

    required  this.cancelledAt,

    required  this.cancelledBy,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'schedule_id',
    required: true,
    includeIfNull: false,
  )


  final String scheduleId;



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
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final ScheduleStatus status;



      /// By area, then by name.
  @JsonKey(
    
    name: r'tables',
    required: true,
    includeIfNull: false,
  )


  final List<ScheduleTable> tables;



  @JsonKey(
    
    name: r'created_by',
    required: true,
    includeIfNull: false,
  )


  final UserRef createdBy;



  @JsonKey(
    
    name: r'cancelled_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? cancelledAt;



  @JsonKey(
    
    name: r'cancelled_by',
    required: true,
    includeIfNull: true,
  )


  final UserRef? cancelledBy;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Schedule &&
      other.scheduleId == scheduleId &&
      other.title == title &&
      other.startAt == startAt &&
      other.endAt == endAt &&
      other.status == status &&
      other.tables == tables &&
      other.createdBy == createdBy &&
      other.cancelledAt == cancelledAt &&
      other.cancelledBy == cancelledBy &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        scheduleId.hashCode +
        title.hashCode +
        startAt.hashCode +
        endAt.hashCode +
        status.hashCode +
        tables.hashCode +
        createdBy.hashCode +
        (cancelledAt == null ? 0 : cancelledAt.hashCode) +
        (cancelledBy == null ? 0 : cancelledBy.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

