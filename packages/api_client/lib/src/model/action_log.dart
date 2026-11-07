//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/action_log_user.dart';
import 'package:maki_api_client/src/model/action_log_outlet.dart';
import 'package:maki_api_client/src/model/action_log_device.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_log.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionLog {
  /// Returns a new [ActionLog] instance.
  ActionLog({

    required  this.actionLogId,

    required  this.action,

    required  this.targetType,

    required  this.targetId,

    required  this.user,

    required  this.outlet,

    required  this.device,

    required  this.before,

    required  this.after,

    required  this.ip,

    required  this.occurredAt,

    required  this.createdAt,
  });

  @JsonKey(
    
    name: r'action_log_id',
    required: true,
    includeIfNull: false,
  )


  final String actionLogId;



      /// `<resource>.<what happened>`, such as `menu.updated`.
  @JsonKey(
    
    name: r'action',
    required: true,
    includeIfNull: false,
  )


  final String action;



  @JsonKey(
    
    name: r'target_type',
    required: true,
    includeIfNull: true,
  )


  final String? targetType;



  @JsonKey(
    
    name: r'target_id',
    required: true,
    includeIfNull: true,
  )


  final String? targetId;



  @JsonKey(
    
    name: r'user',
    required: true,
    includeIfNull: true,
  )


  final ActionLogUser? user;



  @JsonKey(
    
    name: r'outlet',
    required: true,
    includeIfNull: true,
  )


  final ActionLogOutlet? outlet;



  @JsonKey(
    
    name: r'device',
    required: true,
    includeIfNull: true,
  )


  final ActionLogDevice? device;



      /// The values before, as they were stored; null for none.
  @JsonKey(
    
    name: r'before',
    required: true,
    includeIfNull: true,
  )


  final Map<String, Object>? before;



      /// The values after, as they were stored; null for none.
  @JsonKey(
    
    name: r'after',
    required: true,
    includeIfNull: true,
  )


  final Map<String, Object>? after;



  @JsonKey(
    
    name: r'ip',
    required: true,
    includeIfNull: true,
  )


  final String? ip;



  @JsonKey(
    
    name: r'occurred_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime occurredAt;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionLog &&
      other.actionLogId == actionLogId &&
      other.action == action &&
      other.targetType == targetType &&
      other.targetId == targetId &&
      other.user == user &&
      other.outlet == outlet &&
      other.device == device &&
      other.before == before &&
      other.after == after &&
      other.ip == ip &&
      other.occurredAt == occurredAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        actionLogId.hashCode +
        action.hashCode +
        (targetType == null ? 0 : targetType.hashCode) +
        (targetId == null ? 0 : targetId.hashCode) +
        (user == null ? 0 : user.hashCode) +
        (outlet == null ? 0 : outlet.hashCode) +
        (device == null ? 0 : device.hashCode) +
        (before == null ? 0 : before.hashCode) +
        (after == null ? 0 : after.hashCode) +
        (ip == null ? 0 : ip.hashCode) +
        occurredAt.hashCode +
        createdAt.hashCode;

  factory ActionLog.fromJson(Map<String, dynamic> json) => _$ActionLogFromJson(json);

  Map<String, dynamic> toJson() => _$ActionLogToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

