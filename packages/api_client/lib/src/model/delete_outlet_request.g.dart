// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_outlet_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeleteOutletRequestCWProxy {
  DeleteOutletRequest confirmName(String confirmName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeleteOutletRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeleteOutletRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DeleteOutletRequest call({String confirmName});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeleteOutletRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeleteOutletRequest.copyWith.fieldName(...)`
class _$DeleteOutletRequestCWProxyImpl implements _$DeleteOutletRequestCWProxy {
  const _$DeleteOutletRequestCWProxyImpl(this._value);

  final DeleteOutletRequest _value;

  @override
  DeleteOutletRequest confirmName(String confirmName) =>
      this(confirmName: confirmName);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeleteOutletRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeleteOutletRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DeleteOutletRequest call({
    Object? confirmName = const $CopyWithPlaceholder(),
  }) {
    return DeleteOutletRequest(
      confirmName: confirmName == const $CopyWithPlaceholder()
          ? _value.confirmName
          // ignore: cast_nullable_to_non_nullable
          : confirmName as String,
    );
  }
}

extension $DeleteOutletRequestCopyWith on DeleteOutletRequest {
  /// Returns a callable class that can be used as follows: `instanceOfDeleteOutletRequest.copyWith(...)` or like so:`instanceOfDeleteOutletRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeleteOutletRequestCWProxy get copyWith =>
      _$DeleteOutletRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteOutletRequest _$DeleteOutletRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeleteOutletRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['confirm_name']);
      final val = DeleteOutletRequest(
        confirmName: $checkedConvert('confirm_name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'confirmName': 'confirm_name'});

Map<String, dynamic> _$DeleteOutletRequestToJson(
  DeleteOutletRequest instance,
) => <String, dynamic>{'confirm_name': instance.confirmName};
