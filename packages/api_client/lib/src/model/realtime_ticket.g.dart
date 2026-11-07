// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_ticket.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RealtimeTicketCWProxy {
  RealtimeTicket ticket(String ticket);

  RealtimeTicket expiresIn(int expiresIn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RealtimeTicket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RealtimeTicket(...).copyWith(id: 12, name: "My name")
  /// ````
  RealtimeTicket call({String ticket, int expiresIn});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRealtimeTicket.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRealtimeTicket.copyWith.fieldName(...)`
class _$RealtimeTicketCWProxyImpl implements _$RealtimeTicketCWProxy {
  const _$RealtimeTicketCWProxyImpl(this._value);

  final RealtimeTicket _value;

  @override
  RealtimeTicket ticket(String ticket) => this(ticket: ticket);

  @override
  RealtimeTicket expiresIn(int expiresIn) => this(expiresIn: expiresIn);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RealtimeTicket(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RealtimeTicket(...).copyWith(id: 12, name: "My name")
  /// ````
  RealtimeTicket call({
    Object? ticket = const $CopyWithPlaceholder(),
    Object? expiresIn = const $CopyWithPlaceholder(),
  }) {
    return RealtimeTicket(
      ticket: ticket == const $CopyWithPlaceholder()
          ? _value.ticket
          // ignore: cast_nullable_to_non_nullable
          : ticket as String,
      expiresIn: expiresIn == const $CopyWithPlaceholder()
          ? _value.expiresIn
          // ignore: cast_nullable_to_non_nullable
          : expiresIn as int,
    );
  }
}

extension $RealtimeTicketCopyWith on RealtimeTicket {
  /// Returns a callable class that can be used as follows: `instanceOfRealtimeTicket.copyWith(...)` or like so:`instanceOfRealtimeTicket.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RealtimeTicketCWProxy get copyWith => _$RealtimeTicketCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeTicket _$RealtimeTicketFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RealtimeTicket', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['ticket', 'expires_in']);
      final val = RealtimeTicket(
        ticket: $checkedConvert('ticket', (v) => v as String),
        expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'expiresIn': 'expires_in'});

Map<String, dynamic> _$RealtimeTicketToJson(RealtimeTicket instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
      'expires_in': instance.expiresIn,
    };
