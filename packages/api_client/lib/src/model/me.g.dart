// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MeCWProxy {
  Me userId(String userId);

  Me username(String username);

  Me name(String name);

  Me email(String? email);

  Me emailVerified(bool emailVerified);

  Me pendingEmail(String? pendingEmail);

  Me locale(String? locale);

  Me language(String language);

  Me isOwner(bool isOwner);

  Me isManager(bool isManager);

  Me outletId(String? outletId);

  Me mustChangePassword(bool mustChangePassword);

  Me permissions(List<String> permissions);

  Me outlet(OutletSummary? outlet);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Me(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Me(...).copyWith(id: 12, name: "My name")
  /// ````
  Me call({
    String userId,
    String username,
    String name,
    String? email,
    bool emailVerified,
    String? pendingEmail,
    String? locale,
    String language,
    bool isOwner,
    bool isManager,
    String? outletId,
    bool mustChangePassword,
    List<String> permissions,
    OutletSummary? outlet,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMe.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMe.copyWith.fieldName(...)`
class _$MeCWProxyImpl implements _$MeCWProxy {
  const _$MeCWProxyImpl(this._value);

  final Me _value;

  @override
  Me userId(String userId) => this(userId: userId);

  @override
  Me username(String username) => this(username: username);

  @override
  Me name(String name) => this(name: name);

  @override
  Me email(String? email) => this(email: email);

  @override
  Me emailVerified(bool emailVerified) => this(emailVerified: emailVerified);

  @override
  Me pendingEmail(String? pendingEmail) => this(pendingEmail: pendingEmail);

  @override
  Me locale(String? locale) => this(locale: locale);

  @override
  Me language(String language) => this(language: language);

  @override
  Me isOwner(bool isOwner) => this(isOwner: isOwner);

  @override
  Me isManager(bool isManager) => this(isManager: isManager);

  @override
  Me outletId(String? outletId) => this(outletId: outletId);

  @override
  Me mustChangePassword(bool mustChangePassword) =>
      this(mustChangePassword: mustChangePassword);

  @override
  Me permissions(List<String> permissions) => this(permissions: permissions);

  @override
  Me outlet(OutletSummary? outlet) => this(outlet: outlet);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Me(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Me(...).copyWith(id: 12, name: "My name")
  /// ````
  Me call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? emailVerified = const $CopyWithPlaceholder(),
    Object? pendingEmail = const $CopyWithPlaceholder(),
    Object? locale = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
    Object? isOwner = const $CopyWithPlaceholder(),
    Object? isManager = const $CopyWithPlaceholder(),
    Object? outletId = const $CopyWithPlaceholder(),
    Object? mustChangePassword = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
    Object? outlet = const $CopyWithPlaceholder(),
  }) {
    return Me(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      emailVerified: emailVerified == const $CopyWithPlaceholder()
          ? _value.emailVerified
          // ignore: cast_nullable_to_non_nullable
          : emailVerified as bool,
      pendingEmail: pendingEmail == const $CopyWithPlaceholder()
          ? _value.pendingEmail
          // ignore: cast_nullable_to_non_nullable
          : pendingEmail as String?,
      locale: locale == const $CopyWithPlaceholder()
          ? _value.locale
          // ignore: cast_nullable_to_non_nullable
          : locale as String?,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String,
      isOwner: isOwner == const $CopyWithPlaceholder()
          ? _value.isOwner
          // ignore: cast_nullable_to_non_nullable
          : isOwner as bool,
      isManager: isManager == const $CopyWithPlaceholder()
          ? _value.isManager
          // ignore: cast_nullable_to_non_nullable
          : isManager as bool,
      outletId: outletId == const $CopyWithPlaceholder()
          ? _value.outletId
          // ignore: cast_nullable_to_non_nullable
          : outletId as String?,
      mustChangePassword: mustChangePassword == const $CopyWithPlaceholder()
          ? _value.mustChangePassword
          // ignore: cast_nullable_to_non_nullable
          : mustChangePassword as bool,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as List<String>,
      outlet: outlet == const $CopyWithPlaceholder()
          ? _value.outlet
          // ignore: cast_nullable_to_non_nullable
          : outlet as OutletSummary?,
    );
  }
}

extension $MeCopyWith on Me {
  /// Returns a callable class that can be used as follows: `instanceOfMe.copyWith(...)` or like so:`instanceOfMe.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MeCWProxy get copyWith => _$MeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Me _$MeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Me',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'user_id',
        'username',
        'name',
        'email',
        'email_verified',
        'pending_email',
        'locale',
        'language',
        'is_owner',
        'is_manager',
        'outlet_id',
        'must_change_password',
        'permissions',
        'outlet',
      ],
    );
    final val = Me(
      userId: $checkedConvert('user_id', (v) => v as String),
      username: $checkedConvert('username', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      emailVerified: $checkedConvert('email_verified', (v) => v as bool),
      pendingEmail: $checkedConvert('pending_email', (v) => v as String?),
      locale: $checkedConvert('locale', (v) => v as String?),
      language: $checkedConvert('language', (v) => v as String),
      isOwner: $checkedConvert('is_owner', (v) => v as bool),
      isManager: $checkedConvert('is_manager', (v) => v as bool),
      outletId: $checkedConvert('outlet_id', (v) => v as String?),
      mustChangePassword: $checkedConvert(
        'must_change_password',
        (v) => v as bool,
      ),
      permissions: $checkedConvert(
        'permissions',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      outlet: $checkedConvert(
        'outlet',
        (v) => v == null
            ? null
            : OutletSummary.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'emailVerified': 'email_verified',
    'pendingEmail': 'pending_email',
    'isOwner': 'is_owner',
    'isManager': 'is_manager',
    'outletId': 'outlet_id',
    'mustChangePassword': 'must_change_password',
  },
);

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
  'user_id': instance.userId,
  'username': instance.username,
  'name': instance.name,
  'email': instance.email,
  'email_verified': instance.emailVerified,
  'pending_email': instance.pendingEmail,
  'locale': instance.locale,
  'language': instance.language,
  'is_owner': instance.isOwner,
  'is_manager': instance.isManager,
  'outlet_id': instance.outletId,
  'must_change_password': instance.mustChangePassword,
  'permissions': instance.permissions,
  'outlet': instance.outlet?.toJson(),
};
