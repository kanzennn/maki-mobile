//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_me_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateMeRequest {
  /// Returns a new [UpdateMeRequest] instance.
  UpdateMeRequest({

    required  this.locale,
  });

  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: true,
  )


  final UpdateMeRequestLocaleEnum? locale;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateMeRequest &&
      other.locale == locale;

    @override
    int get hashCode =>
        (locale == null ? 0 : locale.hashCode);

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) => _$UpdateMeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMeRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

enum UpdateMeRequestLocaleEnum {
@JsonValue(r'id')
id(r'id'),
@JsonValue(r'en')
en(r'en');

const UpdateMeRequestLocaleEnum(this.value);

final String value;

@override
String toString() => value;
}


