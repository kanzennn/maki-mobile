//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `percent`: `value` is basis points of the subtotal (1000 is 10%), rounded to the nearest rupiah, half up, then held to `max_discount`; `amount`: `value` is rupiah. Either way the discount is never past the subtotal, and comes off it before the service charge and the tax. `api/test-vectors/voucher-discounts.json` holds worked cases. 
enum VoucherType {
      @JsonValue(r'percent')
      percent(r'percent'),
      @JsonValue(r'amount')
      amount(r'amount');

  const VoucherType(this.value);

  final String value;

  @override
  String toString() => value;
}
