//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_alert_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StockAlertRequest {
  /// Returns a new [StockAlertRequest] instance.
  StockAlertRequest({

     this.stockAlert,
  });

      /// At or below it, stock is low; null or 0 turns the alert off.
          // minimum: 0
          // maximum: 1000000
  @JsonKey(
    
    name: r'stock_alert',
    required: false,
    includeIfNull: false,
  )


  final int? stockAlert;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StockAlertRequest &&
      other.stockAlert == stockAlert;

    @override
    int get hashCode =>
        (stockAlert == null ? 0 : stockAlert.hashCode);

  factory StockAlertRequest.fromJson(Map<String, dynamic> json) => _$StockAlertRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StockAlertRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

