//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'realtime_ticket.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RealtimeTicket {
  /// Returns a new [RealtimeTicket] instance.
  RealtimeTicket({

    required  this.ticket,

    required  this.expiresIn,
  });

  @JsonKey(
    
    name: r'ticket',
    required: true,
    includeIfNull: false,
  )


  final String ticket;



      /// How many seconds it is good for.
  @JsonKey(
    
    name: r'expires_in',
    required: true,
    includeIfNull: false,
  )


  final int expiresIn;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RealtimeTicket &&
      other.ticket == ticket &&
      other.expiresIn == expiresIn;

    @override
    int get hashCode =>
        ticket.hashCode +
        expiresIn.hashCode;

  factory RealtimeTicket.fromJson(Map<String, dynamic> json) => _$RealtimeTicketFromJson(json);

  Map<String, dynamic> toJson() => _$RealtimeTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

