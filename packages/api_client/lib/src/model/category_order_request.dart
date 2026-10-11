//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_order_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CategoryOrderRequest {
  /// Returns a new [CategoryOrderRequest] instance.
  CategoryOrderRequest({

    required  this.categoryIds,
  });

      /// Every category of the outlet, each once, in the new order.
  @JsonKey(
    
    name: r'category_ids',
    required: true,
    includeIfNull: false,
  )


  final List<String> categoryIds;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CategoryOrderRequest &&
      other.categoryIds == categoryIds;

    @override
    int get hashCode =>
        categoryIds.hashCode;

  factory CategoryOrderRequest.fromJson(Map<String, dynamic> json) => _$CategoryOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOrderRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

