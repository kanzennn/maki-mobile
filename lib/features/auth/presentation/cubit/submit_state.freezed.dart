// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubmitState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitState()';
}


}

/// @nodoc
class $SubmitStateCopyWith<$Res>  {
$SubmitStateCopyWith(SubmitState _, $Res Function(SubmitState) __);
}


/// Adds pattern-matching-related methods to [SubmitState].
extension SubmitStatePatterns on SubmitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SubmitIdle value)?  idle,TResult Function( SubmitSubmitting value)?  submitting,TResult Function( SubmitFailed value)?  failed,TResult Function( SubmitDone value)?  done,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SubmitIdle() when idle != null:
return idle(_that);case SubmitSubmitting() when submitting != null:
return submitting(_that);case SubmitFailed() when failed != null:
return failed(_that);case SubmitDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SubmitIdle value)  idle,required TResult Function( SubmitSubmitting value)  submitting,required TResult Function( SubmitFailed value)  failed,required TResult Function( SubmitDone value)  done,}){
final _that = this;
switch (_that) {
case SubmitIdle():
return idle(_that);case SubmitSubmitting():
return submitting(_that);case SubmitFailed():
return failed(_that);case SubmitDone():
return done(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SubmitIdle value)?  idle,TResult? Function( SubmitSubmitting value)?  submitting,TResult? Function( SubmitFailed value)?  failed,TResult? Function( SubmitDone value)?  done,}){
final _that = this;
switch (_that) {
case SubmitIdle() when idle != null:
return idle(_that);case SubmitSubmitting() when submitting != null:
return submitting(_that);case SubmitFailed() when failed != null:
return failed(_that);case SubmitDone() when done != null:
return done(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  submitting,TResult Function( ApiException error)?  failed,TResult Function()?  done,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SubmitIdle() when idle != null:
return idle();case SubmitSubmitting() when submitting != null:
return submitting();case SubmitFailed() when failed != null:
return failed(_that.error);case SubmitDone() when done != null:
return done();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  submitting,required TResult Function( ApiException error)  failed,required TResult Function()  done,}) {final _that = this;
switch (_that) {
case SubmitIdle():
return idle();case SubmitSubmitting():
return submitting();case SubmitFailed():
return failed(_that.error);case SubmitDone():
return done();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  submitting,TResult? Function( ApiException error)?  failed,TResult? Function()?  done,}) {final _that = this;
switch (_that) {
case SubmitIdle() when idle != null:
return idle();case SubmitSubmitting() when submitting != null:
return submitting();case SubmitFailed() when failed != null:
return failed(_that.error);case SubmitDone() when done != null:
return done();case _:
  return null;

}
}

}

/// @nodoc


class SubmitIdle implements SubmitState {
  const SubmitIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitState.idle()';
}


}




/// @nodoc


class SubmitSubmitting implements SubmitState {
  const SubmitSubmitting();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitState.submitting()';
}


}




/// @nodoc


class SubmitFailed implements SubmitState {
  const SubmitFailed(this.error);
  

 final  ApiException error;

/// Create a copy of SubmitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitFailedCopyWith<SubmitFailed> get copyWith => _$SubmitFailedCopyWithImpl<SubmitFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'SubmitState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $SubmitFailedCopyWith<$Res> implements $SubmitStateCopyWith<$Res> {
  factory $SubmitFailedCopyWith(SubmitFailed value, $Res Function(SubmitFailed) _then) = _$SubmitFailedCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$SubmitFailedCopyWithImpl<$Res>
    implements $SubmitFailedCopyWith<$Res> {
  _$SubmitFailedCopyWithImpl(this._self, this._then);

  final SubmitFailed _self;
  final $Res Function(SubmitFailed) _then;

/// Create a copy of SubmitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SubmitFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

/// @nodoc


class SubmitDone implements SubmitState {
  const SubmitDone();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitDone);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SubmitState.done()';
}


}




// dart format on
