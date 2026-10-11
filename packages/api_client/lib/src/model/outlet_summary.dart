//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'outlet_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OutletSummary {
  /// Returns a new [OutletSummary] instance.
  OutletSummary({

    required  this.outletId,

    required  this.code,

    required  this.name,

    required  this.timezone,

    required  this.locale,
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



      /// IANA name. Every time of the outlet shows in this zone.
  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;



      /// The outlet's default language.
  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final String locale;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OutletSummary &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name &&
      other.timezone == timezone &&
      other.locale == locale;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode +
        timezone.hashCode +
        locale.hashCode;

  factory OutletSummary.fromJson(Map<String, dynamic> json) => _$OutletSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$OutletSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

