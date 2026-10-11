//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// At the moment the voucher is read, in this order: `inactive`, turned off; `expired`, at or past `expired_at`; `used_up`, every use taken; `scheduled`, before `start_at`; else `active`. 
enum VoucherStatus {
      @JsonValue(r'active')
      active(r'active'),
      @JsonValue(r'scheduled')
      scheduled(r'scheduled'),
      @JsonValue(r'used_up')
      usedUp(r'used_up'),
      @JsonValue(r'expired')
      expired(r'expired'),
      @JsonValue(r'inactive')
      inactive(r'inactive');

  const VoucherStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
