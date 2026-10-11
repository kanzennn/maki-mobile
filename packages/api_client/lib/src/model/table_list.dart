//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/list_meta.dart';
import 'package:maki_api_client/src/model/table.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TableList {
  /// Returns a new [TableList] instance.
  TableList({

    required  this.data,

    required  this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Table> data;



  @JsonKey(
    
    name: r'meta',
    required: true,
    includeIfNull: false,
  )


  final ListMeta meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TableList &&
      other.data == data &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        meta.hashCode;

  factory TableList.fromJson(Map<String, dynamic> json) => _$TableListFromJson(json);

  Map<String, dynamic> toJson() => _$TableListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

