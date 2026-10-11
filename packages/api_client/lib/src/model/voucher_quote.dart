//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/voucher_terms.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_quote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoucherQuote {
  /// Returns a new [VoucherQuote] instance.
  VoucherQuote({

    required  this.voucher,

    required  this.discount,

    required  this.applies,
  });

  @JsonKey(
    
    name: r'voucher',
    required: true,
    includeIfNull: false,
  )


  final VoucherTerms voucher;



      /// The discount on `subtotal`; 0 while it doesn't apply.
  @JsonKey(
    
    name: r'discount',
    required: true,
    includeIfNull: false,
  )


  final int discount;



      /// False while `subtotal` is short of `min_spend`.
  @JsonKey(
    
    name: r'applies',
    required: true,
    includeIfNull: false,
  )


  final bool applies;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoucherQuote &&
      other.voucher == voucher &&
      other.discount == discount &&
      other.applies == applies;

    @override
    int get hashCode =>
        voucher.hashCode +
        discount.hashCode +
        applies.hashCode;

  factory VoucherQuote.fromJson(Map<String, dynamic> json) => _$VoucherQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherQuoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

