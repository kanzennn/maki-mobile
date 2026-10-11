//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission_group.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PermissionGroup {
  /// Returns a new [PermissionGroup] instance.
  PermissionGroup({

    required  this.module,

    required  this.permissions,
  });

  @JsonKey(
    
    name: r'module',
    required: true,
    includeIfNull: false,
  )


  final String module;



  @JsonKey(
    
    name: r'permissions',
    required: true,
    includeIfNull: false,
  )


  final List<String> permissions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PermissionGroup &&
      other.module == module &&
      other.permissions == permissions;

    @override
    int get hashCode =>
        module.hashCode +
        permissions.hashCode;

  factory PermissionGroup.fromJson(Map<String, dynamic> json) => _$PermissionGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

