//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_meta.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListMeta {
  /// Returns a new [ListMeta] instance.
  ListMeta({

    required  this.page,

    required  this.pageSize,

    required  this.total,
  });

  @JsonKey(
    
    name: r'page',
    required: true,
    includeIfNull: false,
  )


  final int page;



  @JsonKey(
    
    name: r'page_size',
    required: true,
    includeIfNull: false,
  )


  final int pageSize;



      /// Items across every page.
  @JsonKey(
    
    name: r'total',
    required: true,
    includeIfNull: false,
  )


  final int total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListMeta &&
      other.page == page &&
      other.pageSize == pageSize &&
      other.total == total;

    @override
    int get hashCode =>
        page.hashCode +
        pageSize.hashCode +
        total.hashCode;

  factory ListMeta.fromJson(Map<String, dynamic> json) => _$ListMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ListMetaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

