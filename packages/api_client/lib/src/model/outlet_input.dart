//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OutletInput {
  /// Returns a new [OutletInput] instance.
  OutletInput({

    required  this.code,

    required  this.name,

     this.address,

     this.phone,

     this.timezone,

     this.locale,

     this.openTime,

     this.closeTime,

     this.taxPct = 0,

     this.servicePct = 0,
  });

      /// 2 to 10 letters and digits; stored in upper case.
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
    required: false,
    includeIfNull: false,
  )


  final String? address;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



      /// IANA name; `Asia/Jakarta` when left out.
  @JsonKey(
    
    name: r'timezone',
    required: false,
    includeIfNull: false,
  )


  final String? timezone;



      /// `id` when left out.
  @JsonKey(
    
    name: r'locale',
    required: false,
    includeIfNull: false,
  )


  final OutletInputLocaleEnum? locale;



      /// `HH:MM`, with `close_time`, or both left out.
  @JsonKey(
    
    name: r'open_time',
    required: false,
    includeIfNull: false,
  )


  final String? openTime;



  @JsonKey(
    
    name: r'close_time',
    required: false,
    includeIfNull: false,
  )


  final String? closeTime;



          // minimum: 0
          // maximum: 100
  @JsonKey(
    defaultValue: 0,
    name: r'tax_pct',
    required: false,
    includeIfNull: false,
  )


  final num? taxPct;



          // minimum: 0
          // maximum: 100
  @JsonKey(
    defaultValue: 0,
    name: r'service_pct',
    required: false,
    includeIfNull: false,
  )


  final num? servicePct;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OutletInput &&
      other.code == code &&
      other.name == name &&
      other.address == address &&
      other.phone == phone &&
      other.timezone == timezone &&
      other.locale == locale &&
      other.openTime == openTime &&
      other.closeTime == closeTime &&
      other.taxPct == taxPct &&
      other.servicePct == servicePct;

    @override
    int get hashCode =>
        code.hashCode +
        name.hashCode +
        (address == null ? 0 : address.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        timezone.hashCode +
        locale.hashCode +
        (openTime == null ? 0 : openTime.hashCode) +
        (closeTime == null ? 0 : closeTime.hashCode) +
        taxPct.hashCode +
        servicePct.hashCode;

  factory OutletInput.fromJson(Map<String, dynamic> json) => _$OutletInputFromJson(json);

  Map<String, dynamic> toJson() => _$OutletInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// `id` when left out.
enum OutletInputLocaleEnum {
@JsonValue(r'id')
id(r'id'),
@JsonValue(r'en')
en(r'en');

const OutletInputLocaleEnum(this.value);

final String value;

@override
String toString() => value;
}


