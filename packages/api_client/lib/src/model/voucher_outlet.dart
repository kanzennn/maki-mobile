//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'voucher_outlet.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VoucherOutlet {
  /// Returns a new [VoucherOutlet] instance.
  VoucherOutlet({

    required  this.outletId,

    required  this.code,

    required  this.name,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is VoucherOutlet &&
      other.outletId == outletId &&
      other.code == code &&
      other.name == name;

    @override
    int get hashCode =>
        outletId.hashCode +
        code.hashCode +
        name.hashCode;

  factory VoucherOutlet.fromJson(Map<String, dynamic> json) => _$VoucherOutletFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherOutletToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

