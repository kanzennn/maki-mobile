//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/rotation.dart';
import 'package:maki_api_client/src/model/decoration_kind.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'decoration.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Decoration {
  /// Returns a new [Decoration] instance.
  Decoration({

    required  this.kind,

    required  this.x,

    required  this.y,

    required  this.w,

    required  this.h,

    required  this.rotation,
  });

  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final DecorationKind kind;



  @JsonKey(
    
    name: r'x',
    required: true,
    includeIfNull: false,
  )


  final int x;



  @JsonKey(
    
    name: r'y',
    required: true,
    includeIfNull: false,
  )


  final int y;



  @JsonKey(
    
    name: r'w',
    required: true,
    includeIfNull: false,
  )


  final int w;



  @JsonKey(
    
    name: r'h',
    required: true,
    includeIfNull: false,
  )


  final int h;



  @JsonKey(
    
    name: r'rotation',
    required: true,
    includeIfNull: false,
  )


  final Rotation rotation;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Decoration &&
      other.kind == kind &&
      other.x == x &&
      other.y == y &&
      other.w == w &&
      other.h == h &&
      other.rotation == rotation;

    @override
    int get hashCode =>
        kind.hashCode +
        x.hashCode +
        y.hashCode +
        w.hashCode +
        h.hashCode +
        rotation.hashCode;

  factory Decoration.fromJson(Map<String, dynamic> json) => _$DecorationFromJson(json);

  Map<String, dynamic> toJson() => _$DecorationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

