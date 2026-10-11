// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Account {

 String get userId; String get username; String get name; bool get emailVerified;/// What the user sees: their own [locale], else their outlet's, else
/// Indonesian.
 String get language; bool get isOwner; bool get isManager; bool get mustChangePassword;/// What the user may do: in their outlet, or for the Owner in every
/// outlet. The app shows what these allow; the server checks them on
/// every request regardless.
 Set<String> get permissions; String? get email; String? get pendingEmail;/// Their own choice of language; null follows the outlet.
 String? get locale; String? get outletId;/// Where the user works; null for the Owner.
 AccountOutlet? get outlet;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Account;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.emailVerified, _this.emailVerified) || other.emailVerified == _this.emailVerified)&&(identical(other.language, _this.language) || other.language == _this.language)&&(identical(other.isOwner, _this.isOwner) || other.isOwner == _this.isOwner)&&(identical(other.isManager, _this.isManager) || other.isManager == _this.isManager)&&(identical(other.mustChangePassword, _this.mustChangePassword) || other.mustChangePassword == _this.mustChangePassword)&&const DeepCollectionEquality().equals(other.permissions, _this.permissions)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.pendingEmail, _this.pendingEmail) || other.pendingEmail == _this.pendingEmail)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.outletId, _this.outletId) || other.outletId == _this.outletId)&&(identical(other.outlet, _this.outlet) || other.outlet == _this.outlet));
}


@override
int get hashCode {
  final _this = this as Account;
  return Object.hash(runtimeType,_this.userId,_this.username,_this.name,_this.emailVerified,_this.language,_this.isOwner,_this.isManager,_this.mustChangePassword,const DeepCollectionEquality().hash(_this.permissions),_this.email,_this.pendingEmail,_this.locale,_this.outletId,_this.outlet);
}

@override
String toString() {
  final _this = this as Account;
  return 'Account(userId: ${_this.userId}, username: ${_this.username}, name: ${_this.name}, emailVerified: ${_this.emailVerified}, language: ${_this.language}, isOwner: ${_this.isOwner}, isManager: ${_this.isManager}, mustChangePassword: ${_this.mustChangePassword}, permissions: ${_this.permissions}, email: ${_this.email}, pendingEmail: ${_this.pendingEmail}, locale: ${_this.locale}, outletId: ${_this.outletId}, outlet: ${_this.outlet})';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String userId, String username, String name, bool emailVerified, String language, bool isOwner, bool isManager, bool mustChangePassword, Set<String> permissions, String? email, String? pendingEmail, String? locale, String? outletId, AccountOutlet? outlet
});


$AccountOutletCopyWith<$Res>? get outlet;

}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? username = null,Object? name = null,Object? emailVerified = null,Object? language = null,Object? isOwner = null,Object? isManager = null,Object? mustChangePassword = null,Object? permissions = null,Object? email = freezed,Object? pendingEmail = freezed,Object? locale = freezed,Object? outletId = freezed,Object? outlet = freezed,}) {
  return _then(Account(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Set<String>,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,outletId: freezed == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String?,outlet: freezed == outlet ? _self.outlet : outlet // ignore: cast_nullable_to_non_nullable
as AccountOutlet?,
  ));
}
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOutletCopyWith<$Res>? get outlet {
    if (_self.outlet == null) {
    return null;
  }

  return $AccountOutletCopyWith<$Res>(_self.outlet!, (value) {
    return _then(_self.copyWith(outlet: value));
  });
}
}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String username,  String name,  bool emailVerified,  String language,  bool isOwner,  bool isManager,  bool mustChangePassword,  Set<String> permissions,  String? email,  String? pendingEmail,  String? locale,  String? outletId,  AccountOutlet? outlet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.userId,_that.username,_that.name,_that.emailVerified,_that.language,_that.isOwner,_that.isManager,_that.mustChangePassword,_that.permissions,_that.email,_that.pendingEmail,_that.locale,_that.outletId,_that.outlet);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String username,  String name,  bool emailVerified,  String language,  bool isOwner,  bool isManager,  bool mustChangePassword,  Set<String> permissions,  String? email,  String? pendingEmail,  String? locale,  String? outletId,  AccountOutlet? outlet)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.userId,_that.username,_that.name,_that.emailVerified,_that.language,_that.isOwner,_that.isManager,_that.mustChangePassword,_that.permissions,_that.email,_that.pendingEmail,_that.locale,_that.outletId,_that.outlet);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String username,  String name,  bool emailVerified,  String language,  bool isOwner,  bool isManager,  bool mustChangePassword,  Set<String> permissions,  String? email,  String? pendingEmail,  String? locale,  String? outletId,  AccountOutlet? outlet)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.userId,_that.username,_that.name,_that.emailVerified,_that.language,_that.isOwner,_that.isManager,_that.mustChangePassword,_that.permissions,_that.email,_that.pendingEmail,_that.locale,_that.outletId,_that.outlet);case _:
  return null;

}
}

}

/// @nodoc


class _Account extends Account {
  const _Account({required this.userId, required this.username, required this.name, required this.emailVerified, required this.language, required this.isOwner, required this.isManager, required this.mustChangePassword, required  Set<String> permissions, this.email, this.pendingEmail, this.locale, this.outletId, this.outlet}): _permissions = permissions,super._();
  

@override final  String userId;
@override final  String username;
@override final  String name;
@override final  bool emailVerified;
/// What the user sees: their own [locale], else their outlet's, else
/// Indonesian.
@override final  String language;
@override final  bool isOwner;
@override final  bool isManager;
@override final  bool mustChangePassword;
/// What the user may do: in their outlet, or for the Owner in every
/// outlet. The app shows what these allow; the server checks them on
/// every request regardless.
 final  Set<String> _permissions;
/// What the user may do: in their outlet, or for the Owner in every
/// outlet. The app shows what these allow; the server checks them on
/// every request regardless.
@override Set<String> get permissions {
  if (_permissions is EqualUnmodifiableSetView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_permissions);
}

@override final  String? email;
@override final  String? pendingEmail;
/// Their own choice of language; null follows the outlet.
@override final  String? locale;
@override final  String? outletId;
/// Where the user works; null for the Owner.
@override final  AccountOutlet? outlet;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.language, language) || other.language == language)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.isManager, isManager) || other.isManager == isManager)&&(identical(other.mustChangePassword, mustChangePassword) || other.mustChangePassword == mustChangePassword)&&const DeepCollectionEquality().equals(other.permissions, _permissions)&&(identical(other.email, email) || other.email == email)&&(identical(other.pendingEmail, pendingEmail) || other.pendingEmail == pendingEmail)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.outlet, outlet) || other.outlet == outlet));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userId,username,name,emailVerified,language,isOwner,isManager,mustChangePassword,const DeepCollectionEquality().hash(_permissions),email,pendingEmail,locale,outletId,outlet);
}

@override
String toString() {
    return 'Account(userId: $userId, username: $username, name: $name, emailVerified: $emailVerified, language: $language, isOwner: $isOwner, isManager: $isManager, mustChangePassword: $mustChangePassword, permissions: $permissions, email: $email, pendingEmail: $pendingEmail, locale: $locale, outletId: $outletId, outlet: $outlet)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String userId, String username, String name, bool emailVerified, String language, bool isOwner, bool isManager, bool mustChangePassword, Set<String> permissions, String? email, String? pendingEmail, String? locale, String? outletId, AccountOutlet? outlet
});


@override $AccountOutletCopyWith<$Res>? get outlet;

}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? username = null,Object? name = null,Object? emailVerified = null,Object? language = null,Object? isOwner = null,Object? isManager = null,Object? mustChangePassword = null,Object? permissions = null,Object? email = freezed,Object? pendingEmail = freezed,Object? locale = freezed,Object? outletId = freezed,Object? outlet = freezed,}) {
  return _then(_Account(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,isManager: null == isManager ? _self.isManager : isManager // ignore: cast_nullable_to_non_nullable
as bool,mustChangePassword: null == mustChangePassword ? _self.mustChangePassword : mustChangePassword // ignore: cast_nullable_to_non_nullable
as bool,permissions: null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as Set<String>,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,pendingEmail: freezed == pendingEmail ? _self.pendingEmail : pendingEmail // ignore: cast_nullable_to_non_nullable
as String?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,outletId: freezed == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String?,outlet: freezed == outlet ? _self.outlet : outlet // ignore: cast_nullable_to_non_nullable
as AccountOutlet?,
  ));
}

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountOutletCopyWith<$Res>? get outlet {
    if (_self.outlet == null) {
    return null;
  }

  return $AccountOutletCopyWith<$Res>(_self.outlet!, (value) {
    return _then(_self.copyWith(outlet: value));
  });
}
}

/// @nodoc
mixin _$AccountOutlet {

 String get outletId; String get code; String get name;/// IANA name, such as Asia/Jakarta.
 String get timeZone;/// The outlet's default language.
 String get locale;
/// Create a copy of AccountOutlet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountOutletCopyWith<AccountOutlet> get copyWith => _$AccountOutletCopyWithImpl<AccountOutlet>(this as AccountOutlet, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AccountOutlet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountOutlet&&(identical(other.outletId, _this.outletId) || other.outletId == _this.outletId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.timeZone, _this.timeZone) || other.timeZone == _this.timeZone)&&(identical(other.locale, _this.locale) || other.locale == _this.locale));
}


@override
int get hashCode {
  final _this = this as AccountOutlet;
  return Object.hash(runtimeType,_this.outletId,_this.code,_this.name,_this.timeZone,_this.locale);
}

@override
String toString() {
  final _this = this as AccountOutlet;
  return 'AccountOutlet(outletId: ${_this.outletId}, code: ${_this.code}, name: ${_this.name}, timeZone: ${_this.timeZone}, locale: ${_this.locale})';
}


}

/// @nodoc
abstract mixin class $AccountOutletCopyWith<$Res>  {
  factory $AccountOutletCopyWith(AccountOutlet value, $Res Function(AccountOutlet) _then) = _$AccountOutletCopyWithImpl;
@useResult
$Res call({
 String outletId, String code, String name, String timeZone, String locale
});




}
/// @nodoc
class _$AccountOutletCopyWithImpl<$Res>
    implements $AccountOutletCopyWith<$Res> {
  _$AccountOutletCopyWithImpl(this._self, this._then);

  final AccountOutlet _self;
  final $Res Function(AccountOutlet) _then;

/// Create a copy of AccountOutlet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outletId = null,Object? code = null,Object? name = null,Object? timeZone = null,Object? locale = null,}) {
  return _then(AccountOutlet(
outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountOutlet].
extension AccountOutletPatterns on AccountOutlet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountOutlet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountOutlet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountOutlet value)  $default,){
final _that = this;
switch (_that) {
case _AccountOutlet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountOutlet value)?  $default,){
final _that = this;
switch (_that) {
case _AccountOutlet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String outletId,  String code,  String name,  String timeZone,  String locale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountOutlet() when $default != null:
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String outletId,  String code,  String name,  String timeZone,  String locale)  $default,) {final _that = this;
switch (_that) {
case _AccountOutlet():
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String outletId,  String code,  String name,  String timeZone,  String locale)?  $default,) {final _that = this;
switch (_that) {
case _AccountOutlet() when $default != null:
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _AccountOutlet implements AccountOutlet {
  const _AccountOutlet({required this.outletId, required this.code, required this.name, required this.timeZone, required this.locale});
  

@override final  String outletId;
@override final  String code;
@override final  String name;
/// IANA name, such as Asia/Jakarta.
@override final  String timeZone;
/// The outlet's default language.
@override final  String locale;

/// Create a copy of AccountOutlet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountOutletCopyWith<_AccountOutlet> get copyWith => __$AccountOutletCopyWithImpl<_AccountOutlet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountOutlet&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,outletId,code,name,timeZone,locale);
}

@override
String toString() {
    return 'AccountOutlet(outletId: $outletId, code: $code, name: $name, timeZone: $timeZone, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$AccountOutletCopyWith<$Res> implements $AccountOutletCopyWith<$Res> {
  factory _$AccountOutletCopyWith(_AccountOutlet value, $Res Function(_AccountOutlet) _then) = __$AccountOutletCopyWithImpl;
@override @useResult
$Res call({
 String outletId, String code, String name, String timeZone, String locale
});




}
/// @nodoc
class __$AccountOutletCopyWithImpl<$Res>
    implements _$AccountOutletCopyWith<$Res> {
  __$AccountOutletCopyWithImpl(this._self, this._then);

  final _AccountOutlet _self;
  final $Res Function(_AccountOutlet) _then;

/// Create a copy of AccountOutlet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outletId = null,Object? code = null,Object? name = null,Object? timeZone = null,Object? locale = null,}) {
  return _then(_AccountOutlet(
outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
