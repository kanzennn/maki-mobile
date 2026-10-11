//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pos_outlet.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PosOutlet {
  /// Returns a new [PosOutlet] instance.
  PosOutlet({

    required  this.outletId,

    required  this.code,

    required  this.name,

    required  this.address,

    required  this.phone,

    required  this.timezone,

    required  this.locale,

    required  this.taxBps,

    required  this.serviceBps,
  });

  @JsonKey(
    
    name: r'outlet_id',
    required: true,
    includeIfNull: false,
  )


  final String outletId;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'address',
    required: true,
    includeIfNull: true,
  )


  final String? address;



  @JsonKey(
    
    name: r'phone',
    required: true,
    includeIfNull: true,
  )


  final String? phone;



      /// Every time the cashier shows, and its receipt numbers' day, is in this zone.
  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;



      /// The receipt's language.
  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final PosOutletLocaleEnum locale;



      /// Basis points, so the cashier's totals are exact integers, as the server's are; 1000 is 10%.
          // minimum: 0
          // maximum: 10000
  @JsonKey(
    
    name: r'tax_bps',
    required: true,
    includeIfNull: false,
  )


  final int taxBps;



          // minimum: 0
          // maximum: 10000
  @JsonKey(
    
    name: r'service_bps',
    required: true,
    includeIfNull: false,
  )


  final int serviceBps;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PosOutlet &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name &&
      other.address == address &&
      other.phone == phone &&
      other.timezone == timezone &&
      other.locale == locale &&
      other.taxBps == taxBps &&
      other.serviceBps == serviceBps;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode +
        (address == null ? 0 : address.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        timezone.hashCode +
        locale.hashCode +
        taxBps.hashCode +
        serviceBps.hashCode;

  factory PosOutlet.fromJson(Map<String, dynamic> json) => _$PosOutletFromJson(json);

  Map<String, dynamic> toJson() => _$PosOutletToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The receipt's language.
enum PosOutletLocaleEnum {
@JsonValue(r'id')
id(r'id'),
@JsonValue(r'en')
en(r'en');

const PosOutletLocaleEnum(this.value);

final String value;

@override
String toString() => value;
}


