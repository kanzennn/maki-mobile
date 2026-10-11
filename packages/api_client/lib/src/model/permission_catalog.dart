//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:maki_api_client/src/model/permission_group.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission_catalog.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PermissionCatalog {
  /// Returns a new [PermissionCatalog] instance.
  PermissionCatalog({

    required  this.groups,
  });

  @JsonKey(
    
    name: r'groups',
    required: true,
    includeIfNull: false,
  )


  final List<PermissionGroup> groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PermissionCatalog &&
      other.groups == groups;

    @override
    int get hashCode =>
        groups.hashCode;

  factory PermissionCatalog.fromJson(Map<String, dynamic> json) => _$PermissionCatalogFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionCatalogToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

