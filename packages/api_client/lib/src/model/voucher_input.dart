//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/voucher_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_input.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoucherInput {
  /// Returns a new [VoucherInput] instance.
  VoucherInput({

    required  this.code,

     this.name,

    required  this.type,

    required  this.value,

     this.maxDiscount,

     this.minSpend,

    required  this.quota,

     this.startAt,

    required  this.expiredAt,

    required  this.allOutlets,

     this.outletIds,

     this.isActive,
  });

      /// 3–20 letters and digits, kept in capitals; unique among the vouchers not deleted.
  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final VoucherType type;



      /// Basis points for a percentage (1–10000), rupiah for an amount (1–1,000,000,000).
  @JsonKey(
    
    name: r'value',
    required: true,
    includeIfNull: false,
  )


  final int value;



      /// A percentage's most, in rupiah; dropped for an amount.
  @JsonKey(
    
    name: r'max_discount',
    required: false,
    includeIfNull: false,
  )


  final int? maxDiscount;



      /// The subtotal the voucher needs, in rupiah.
  @JsonKey(
    
    name: r'min_spend',
    required: false,
    includeIfNull: false,
  )


  final int? minSpend;



      /// How many sales may use it, in every outlet together.
          // minimum: 1
          // maximum: 1000000
  @JsonKey(
    
    name: r'quota',
    required: true,
    includeIfNull: false,
  )


  final int quota;



      /// When it starts, to the second; null starts at once.
  @JsonKey(
    
    name: r'start_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? startAt;



      /// When it stops, to the second; after `start_at`.
  @JsonKey(
    
    name: r'expired_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiredAt;



      /// Every outlet, those still to come too; else the ones in `outlet_ids`.
  @JsonKey(
    
    name: r'all_outlets',
    required: true,
    includeIfNull: false,
  )


  final bool allOutlets;



      /// The outlets it is for when it isn't for all of them; ignored when it is.
  @JsonKey(
    
    name: r'outlet_ids',
    required: false,
    includeIfNull: false,
  )


  final List<String>? outletIds;



      /// A new voucher's status, active when left out; ignored by PUT.
  @JsonKey(
    
    name: r'is_active',
    required: false,
    includeIfNull: false,
  )


  final bool? isActive;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoucherInput &&
      other.code == code &&
      other.name == name &&
      other.type == type &&
      other.value == value &&
      other.maxDiscount == maxDiscount &&
      other.minSpend == minSpend &&
      other.quota == quota &&
      other.startAt == startAt &&
      other.expiredAt == expiredAt &&
      other.allOutlets == allOutlets &&
      other.outletIds == outletIds &&
      other.isActive == isActive;

    @override
    int get hashCode =>
        code.hashCode +
        (name == null ? 0 : name.hashCode) +
        type.hashCode +
        value.hashCode +
        (maxDiscount == null ? 0 : maxDiscount.hashCode) +
        (minSpend == null ? 0 : minSpend.hashCode) +
        quota.hashCode +
        (startAt == null ? 0 : startAt.hashCode) +
        expiredAt.hashCode +
        allOutlets.hashCode +
        outletIds.hashCode +
        (isActive == null ? 0 : isActive.hashCode);

  factory VoucherInput.fromJson(Map<String, dynamic> json) => _$VoucherInputFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherInputToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

