//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/manager_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Outlet {
  /// Returns a new [Outlet] instance.
  Outlet({

    required  this.outletId,

    required  this.code,

    required  this.name,

    required  this.address,

    required  this.phone,

    required  this.timezone,

    required  this.locale,

    required  this.openTime,

    required  this.closeTime,

    required  this.taxPct,

    required  this.servicePct,

    required  this.status,

    required  this.managers,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'outlet_id',
    required: true,
    includeIfNull: false,
  )


  final String outletId;



      /// Upper-case letters and digits, printed in receipt numbers.
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



      /// IANA name. Every time of the outlet shows in this zone.
  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;



      /// The default language, for receipts and users who haven't chosen one.
  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final OutletLocaleEnum locale;



      /// `HH:MM`; `null` together with `close_time` when no hours are set.
  @JsonKey(
    
    name: r'open_time',
    required: true,
    includeIfNull: true,
  )


  final String? openTime;



      /// `HH:MM`. Before `open_time` means past midnight.
  @JsonKey(
    
    name: r'close_time',
    required: true,
    includeIfNull: true,
  )


  final String? closeTime;



      /// Percentage, at most two decimals.
  @JsonKey(
    
    name: r'tax_pct',
    required: true,
    includeIfNull: false,
  )


  final num taxPct;



  @JsonKey(
    
    name: r'service_pct',
    required: true,
    includeIfNull: false,
  )


  final num servicePct;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final OutletStatusEnum status;



  @JsonKey(
    
    name: r'managers',
    required: true,
    includeIfNull: false,
  )


  final List<ManagerRef> managers;



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
    bool operator ==(Object other) => identical(this, other) || other is Outlet &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name &&
      other.address == address &&
      other.phone == phone &&
      other.timezone == timezone &&
      other.locale == locale &&
      other.openTime == openTime &&
      other.closeTime == closeTime &&
      other.taxPct == taxPct &&
      other.servicePct == servicePct &&
      other.status == status &&
      other.managers == managers &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode +
        (address == null ? 0 : address.hashCode) +
        (phone == null ? 0 : phone.hashCode) +
        timezone.hashCode +
        locale.hashCode +
        (openTime == null ? 0 : openTime.hashCode) +
        (closeTime == null ? 0 : closeTime.hashCode) +
        taxPct.hashCode +
        servicePct.hashCode +
        status.hashCode +
        managers.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Outlet.fromJson(Map<String, dynamic> json) => _$OutletFromJson(json);

  Map<String, dynamic> toJson() => _$OutletToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// The default language, for receipts and users who haven't chosen one.
enum OutletLocaleEnum {
@JsonValue(r'id')
id(r'id'),
@JsonValue(r'en')
en(r'en');

const OutletLocaleEnum(this.value);

final String value;

@override
String toString() => value;
}


enum OutletStatusEnum {
@JsonValue(r'active')
active(r'active'),
@JsonValue(r'inactive')
inactive(r'inactive');

const OutletStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


