//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'box.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Box {
  /// Returns a new [Box] instance.
  Box({

    required  this.x,

    required  this.y,

    required  this.w,

    required  this.h,
  });

          // minimum: 0
  @JsonKey(
    
    name: r'x',
    required: true,
    includeIfNull: false,
  )


  final int x;



          // minimum: 0
  @JsonKey(
    
    name: r'y',
    required: true,
    includeIfNull: false,
  )


  final int y;



          // minimum: 1
  @JsonKey(
    
    name: r'w',
    required: true,
    includeIfNull: false,
  )


  final int w;



          // minimum: 1
  @JsonKey(
    
    name: r'h',
    required: true,
    includeIfNull: false,
  )


  final int h;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Box &&
      other.x == x &&
      other.y == y &&
      other.w == w &&
      other.h == h;

    @override
    int get hashCode =>
        x.hashCode +
        y.hashCode +
        w.hashCode +
        h.hashCode;

  factory Box.fromJson(Map<String, dynamic> json) => _$BoxFromJson(json);

  Map<String, dynamic> toJson() => _$BoxToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

