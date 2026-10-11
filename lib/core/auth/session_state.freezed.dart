// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SessionState()';
}


}

/// @nodoc
class $SessionStateCopyWith<$Res>  {
$SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}


/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionSignedOut value)?  signedOut,TResult Function( SessionSignedIn value)?  signedIn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionSignedOut() when signedOut != null:
return signedOut(_that);case SessionSignedIn() when signedIn != null:
return signedIn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionSignedOut value)  signedOut,required TResult Function( SessionSignedIn value)  signedIn,}){
final _that = this;
switch (_that) {
case SessionSignedOut():
return signedOut(_that);case SessionSignedIn():
return signedIn(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionSignedOut value)?  signedOut,TResult? Function( SessionSignedIn value)?  signedIn,}){
final _that = this;
switch (_that) {
case SessionSignedOut() when signedOut != null:
return signedOut(_that);case SessionSignedIn() when signedIn != null:
return signedIn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SignOutReason? reason)?  signedOut,TResult Function( String accessToken,  Account user)?  signedIn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionSignedOut() when signedOut != null:
return signedOut(_that.reason);case SessionSignedIn() when signedIn != null:
return signedIn(_that.accessToken,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SignOutReason? reason)  signedOut,required TResult Function( String accessToken,  Account user)  signedIn,}) {final _that = this;
switch (_that) {
case SessionSignedOut():
return signedOut(_that.reason);case SessionSignedIn():
return signedIn(_that.accessToken,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SignOutReason? reason)?  signedOut,TResult? Function( String accessToken,  Account user)?  signedIn,}) {final _that = this;
switch (_that) {
case SessionSignedOut() when signedOut != null:
return signedOut(_that.reason);case SessionSignedIn() when signedIn != null:
return signedIn(_that.accessToken,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class SessionSignedOut implements SessionState {
  const SessionSignedOut({this.reason});
  

 final  SignOutReason? reason;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSignedOutCopyWith<SessionSignedOut> get copyWith => _$SessionSignedOutCopyWithImpl<SessionSignedOut>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSignedOut&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'SessionState.signedOut(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SessionSignedOutCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionSignedOutCopyWith(SessionSignedOut value, $Res Function(SessionSignedOut) _then) = _$SessionSignedOutCopyWithImpl;
@useResult
$Res call({
 SignOutReason? reason
});




}
/// @nodoc
class _$SessionSignedOutCopyWithImpl<$Res>
    implements $SessionSignedOutCopyWith<$Res> {
  _$SessionSignedOutCopyWithImpl(this._self, this._then);

  final SessionSignedOut _self;
  final $Res Function(SessionSignedOut) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = freezed,}) {
  return _then(SessionSignedOut(
reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as SignOutReason?,
  ));
}


}

/// @nodoc


class SessionSignedIn implements SessionState {
  const SessionSignedIn({required this.accessToken, required this.user});
  

 final  String accessToken;
 final  Account user;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSignedInCopyWith<SessionSignedIn> get copyWith => _$SessionSignedInCopyWithImpl<SessionSignedIn>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSignedIn&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode {
    return Object.hash(runtimeType,accessToken,user);
}

@override
String toString() {
    return 'SessionState.signedIn(accessToken: $accessToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $SessionSignedInCopyWith<$Res> implements $SessionStateCopyWith<$Res> {
  factory $SessionSignedInCopyWith(SessionSignedIn value, $Res Function(SessionSignedIn) _then) = _$SessionSignedInCopyWithImpl;
@useResult
$Res call({
 String accessToken, Account user
});


$AccountCopyWith<$Res> get user;

}
/// @nodoc
class _$SessionSignedInCopyWithImpl<$Res>
    implements $SessionSignedInCopyWith<$Res> {
  _$SessionSignedInCopyWithImpl(this._self, this._then);

  final SessionSignedIn _self;
  final $Res Function(SessionSignedIn) _then;

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? user = null,}) {
  return _then(SessionSignedIn(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as Account,
  ));
}

/// Create a copy of SessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res> get user {
  
  return $AccountCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
