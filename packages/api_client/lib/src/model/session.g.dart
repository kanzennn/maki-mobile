// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionCWProxy {
  Session accessToken(String accessToken);

  Session tokenType(SessionTokenTypeEnum tokenType);

  Session expiresIn(int expiresIn);

  Session refreshToken(String? refreshToken);

  Session refreshExpiresIn(int? refreshExpiresIn);

  Session user(Me user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    String accessToken,
    SessionTokenTypeEnum tokenType,
    int expiresIn,
    String? refreshToken,
    int? refreshExpiresIn,
    Me user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSession.copyWith.fieldName(...)`
class _$SessionCWProxyImpl implements _$SessionCWProxy {
  const _$SessionCWProxyImpl(this._value);

  final Session _value;

  @override
  Session accessToken(String accessToken) => this(accessToken: accessToken);

  @override
  Session tokenType(SessionTokenTypeEnum tokenType) =>
      this(tokenType: tokenType);

  @override
  Session expiresIn(int expiresIn) => this(expiresIn: expiresIn);

  @override
  Session refreshToken(String? refreshToken) =>
      this(refreshToken: refreshToken);

  @override
  Session refreshExpiresIn(int? refreshExpiresIn) =>
      this(refreshExpiresIn: refreshExpiresIn);

  @override
  Session user(Me user) => this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Session(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Session(...).copyWith(id: 12, name: "My name")
  /// ````
  Session call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? tokenType = const $CopyWithPlaceholder(),
    Object? expiresIn = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
    Object? refreshExpiresIn = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return Session(
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String,
      tokenType: tokenType == const $CopyWithPlaceholder()
          ? _value.tokenType
          // ignore: cast_nullable_to_non_nullable
          : tokenType as SessionTokenTypeEnum,
      expiresIn: expiresIn == const $CopyWithPlaceholder()
          ? _value.expiresIn
          // ignore: cast_nullable_to_non_nullable
          : expiresIn as int,
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String?,
      refreshExpiresIn: refreshExpiresIn == const $CopyWithPlaceholder()
          ? _value.refreshExpiresIn
          // ignore: cast_nullable_to_non_nullable
          : refreshExpiresIn as int?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as Me,
    );
  }
}

extension $SessionCopyWith on Session {
  /// Returns a callable class that can be used as follows: `instanceOfSession.copyWith(...)` or like so:`instanceOfSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionCWProxy get copyWith => _$SessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Session',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['access_token', 'token_type', 'expires_in', 'user'],
    );
    final val = Session(
      accessToken: $checkedConvert('access_token', (v) => v as String),
      tokenType: $checkedConvert(
        'token_type',
        (v) => $enumDecode(_$SessionTokenTypeEnumEnumMap, v),
      ),
      expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
      refreshToken: $checkedConvert('refresh_token', (v) => v as String?),
      refreshExpiresIn: $checkedConvert(
        'refresh_expires_in',
        (v) => (v as num?)?.toInt(),
      ),
      user: $checkedConvert(
        'user',
        (v) => Me.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'accessToken': 'access_token',
    'tokenType': 'token_type',
    'expiresIn': 'expires_in',
    'refreshToken': 'refresh_token',
    'refreshExpiresIn': 'refresh_expires_in',
  },
);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': _$SessionTokenTypeEnumEnumMap[instance.tokenType]!,
  'expires_in': instance.expiresIn,
  'refresh_token': ?instance.refreshToken,
  'refresh_expires_in': ?instance.refreshExpiresIn,
  'user': instance.user.toJson(),
};

const _$SessionTokenTypeEnumEnumMap = {SessionTokenTypeEnum.bearer: 'Bearer'};
