//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/voucher_outlet.dart';
import 'package:maki_api_client/src/model/voucher_status.dart';
import 'package:maki_api_client/src/model/voucher_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Voucher {
  /// Returns a new [Voucher] instance.
  Voucher({

    required  this.voucherId,

    required  this.code,

    required  this.name,

    required  this.type,

    required  this.value,

    required  this.maxDiscount,

    required  this.minSpend,

    required  this.quota,

    required  this.usedCount,

    required  this.startAt,

    required  this.expiredAt,

    required  this.allOutlets,

    required  this.outlets,

    required  this.isActive,

    required  this.status,

    required  this.firstUsedAt,

    required  this.createdAt,

    required  this.updatedAt,
  });

  @JsonKey(
    
    name: r'voucher_id',
    required: true,
    includeIfNull: false,
  )


  final String voucherId;



  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: true,
  )


  final String? name;



  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final VoucherType type;



  @JsonKey(
    
    name: r'value',
    required: true,
    includeIfNull: false,
  )


  final int value;



  @JsonKey(
    
    name: r'max_discount',
    required: true,
    includeIfNull: true,
  )


  final int? maxDiscount;



  @JsonKey(
    
    name: r'min_spend',
    required: true,
    includeIfNull: true,
  )


  final int? minSpend;



  @JsonKey(
    
    name: r'quota',
    required: true,
    includeIfNull: false,
  )


  final int quota;



      /// The uses taken; a void gives its sale's back.
  @JsonKey(
    
    name: r'used_count',
    required: true,
    includeIfNull: false,
  )


  final int usedCount;



  @JsonKey(
    
    name: r'start_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? startAt;



  @JsonKey(
    
    name: r'expired_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiredAt;



  @JsonKey(
    
    name: r'all_outlets',
    required: true,
    includeIfNull: false,
  )


  final bool allOutlets;



      /// The outlets it is for, by name, none when it is for all of them. Deleted outlets sell nothing and don't show; an outlet's Manager sees only theirs. 
  @JsonKey(
    
    name: r'outlets',
    required: true,
    includeIfNull: false,
  )


  final List<VoucherOutlet> outlets;



  @JsonKey(
    
    name: r'is_active',
    required: true,
    includeIfNull: false,
  )


  final bool isActive;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final VoucherStatus status;



      /// When a sale first used it, voided since or not; from then on PUT keeps its code and type, and it can't be deleted.
  @JsonKey(
    
    name: r'first_used_at',
    required: true,
    includeIfNull: true,
  )


  final DateTime? firstUsedAt;



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
    bool operator ==(Object other) => identical(this, other) || other is Voucher &&
      other.voucherId == voucherId &&
      other.code == code &&
      other.name == name &&
      other.type == type &&
      other.value == value &&
      other.maxDiscount == maxDiscount &&
      other.minSpend == minSpend &&
      other.quota == quota &&
      other.usedCount == usedCount &&
      other.startAt == startAt &&
      other.expiredAt == expiredAt &&
      other.allOutlets == allOutlets &&
      other.outlets == outlets &&
      other.isActive == isActive &&
      other.status == status &&
      other.firstUsedAt == firstUsedAt &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        voucherId.hashCode +
        code.hashCode +
        (name == null ? 0 : name.hashCode) +
        type.hashCode +
        value.hashCode +
        (maxDiscount == null ? 0 : maxDiscount.hashCode) +
        (minSpend == null ? 0 : minSpend.hashCode) +
        quota.hashCode +
        usedCount.hashCode +
        (startAt == null ? 0 : startAt.hashCode) +
        expiredAt.hashCode +
        allOutlets.hashCode +
        outlets.hashCode +
        isActive.hashCode +
        status.hashCode +
        (firstUsedAt == null ? 0 : firstUsedAt.hashCode) +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

