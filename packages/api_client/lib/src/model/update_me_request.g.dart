// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_me_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateMeRequestCWProxy {
  UpdateMeRequest locale(UpdateMeRequestLocaleEnum? locale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateMeRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateMeRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateMeRequest call({UpdateMeRequestLocaleEnum? locale});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpdateMeRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpdateMeRequest.copyWith.fieldName(...)`
class _$UpdateMeRequestCWProxyImpl implements _$UpdateMeRequestCWProxy {
  const _$UpdateMeRequestCWProxyImpl(this._value);

  final UpdateMeRequest _value;

  @override
  UpdateMeRequest locale(UpdateMeRequestLocaleEnum? locale) =>
      this(locale: locale);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UpdateMeRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UpdateMeRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UpdateMeRequest call({Object? locale = const $CopyWithPlaceholder()}) {
    return UpdateMeRequest(
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as UpdateMeRequestLocaleEnum?,
    );
  }
}

extension $UpdateMeRequestCopyWith on UpdateMeRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUpdateMeRequest.copyWith(...)` or like so:`instanceOfUpdateMeRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateMeRequestCWProxy get copyWith => _$UpdateMeRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMeRequest _$UpdateMeRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateMeRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['locale']);
      final val = UpdateMeRequest(
        locale: $checkedConvert(
          'locale',
          (v) => $enumDecodeNullable(_$UpdateMeRequestLocaleEnumEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UpdateMeRequestToJson(UpdateMeRequest instance) =>
    <String, dynamic>{
      'locale': _$UpdateMeRequestLocaleEnumEnumMap[instance.locale],
    };

const _$UpdateMeRequestLocaleEnumEnumMap = {
  UpdateMeRequestLocaleEnum.id: 'id',
  UpdateMeRequestLocaleEnum.en: 'en',
};
