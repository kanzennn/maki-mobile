//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/voucher_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_terms.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoucherTerms {
  /// Returns a new [VoucherTerms] instance.
  VoucherTerms({

    required  this.voucherId,

    required  this.code,

    required  this.name,

    required  this.type,

    required  this.value,

    required  this.maxDiscount,

    required  this.minSpend,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoucherTerms &&
      other.voucherId == voucherId &&
      other.code == code &&
      other.name == name &&
      other.type == type &&
      other.value == value &&
      other.maxDiscount == maxDiscount &&
      other.minSpend == minSpend;

    @override
    int get hashCode =>
        voucherId.hashCode +
        code.hashCode +
        (name == null ? 0 : name.hashCode) +
        type.hashCode +
        value.hashCode +
        (maxDiscount == null ? 0 : maxDiscount.hashCode) +
        (minSpend == null ? 0 : minSpend.hashCode);

  factory VoucherTerms.fromJson(Map<String, dynamic> json) => _$VoucherTermsFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherTermsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

