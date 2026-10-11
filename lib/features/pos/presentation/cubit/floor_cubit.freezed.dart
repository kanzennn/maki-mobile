// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FloorState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FloorState()';
}


}

/// @nodoc
class $FloorStateCopyWith<$Res>  {
$FloorStateCopyWith(FloorState _, $Res Function(FloorState) __);
}


/// Adds pattern-matching-related methods to [FloorState].
extension FloorStatePatterns on FloorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FloorLoading value)?  loading,TResult Function( FloorReady value)?  ready,TResult Function( FloorFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FloorLoading() when loading != null:
return loading(_that);case FloorReady() when ready != null:
return ready(_that);case FloorFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FloorLoading value)  loading,required TResult Function( FloorReady value)  ready,required TResult Function( FloorFailed value)  failed,}){
final _that = this;
switch (_that) {
case FloorLoading():
return loading(_that);case FloorReady():
return ready(_that);case FloorFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FloorLoading value)?  loading,TResult? Function( FloorReady value)?  ready,TResult? Function( FloorFailed value)?  failed,}){
final _that = this;
switch (_that) {
case FloorLoading() when loading != null:
return loading(_that);case FloorReady() when ready != null:
return ready(_that);case FloorFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Floor floor)?  ready,TResult Function( ApiException error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FloorLoading() when loading != null:
return loading();case FloorReady() when ready != null:
return ready(_that.floor);case FloorFailed() when failed != null:
return failed(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Floor floor)  ready,required TResult Function( ApiException error)  failed,}) {final _that = this;
switch (_that) {
case FloorLoading():
return loading();case FloorReady():
return ready(_that.floor);case FloorFailed():
return failed(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Floor floor)?  ready,TResult? Function( ApiException error)?  failed,}) {final _that = this;
switch (_that) {
case FloorLoading() when loading != null:
return loading();case FloorReady() when ready != null:
return ready(_that.floor);case FloorFailed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class FloorLoading implements FloorState {
  const FloorLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FloorState.loading()';
}


}




/// @nodoc


class FloorReady implements FloorState {
  const FloorReady(this.floor);
  

 final  Floor floor;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorReadyCopyWith<FloorReady> get copyWith => _$FloorReadyCopyWithImpl<FloorReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorReady&&(identical(other.floor, floor) || other.floor == floor));
}


@override
int get hashCode {
    return Object.hash(runtimeType,floor);
}

@override
String toString() {
    return 'FloorState.ready(floor: $floor)';
}


}

/// @nodoc
abstract mixin class $FloorReadyCopyWith<$Res> implements $FloorStateCopyWith<$Res> {
  factory $FloorReadyCopyWith(FloorReady value, $Res Function(FloorReady) _then) = _$FloorReadyCopyWithImpl;
@useResult
$Res call({
 Floor floor
});


$FloorCopyWith<$Res> get floor;

}
/// @nodoc
class _$FloorReadyCopyWithImpl<$Res>
    implements $FloorReadyCopyWith<$Res> {
  _$FloorReadyCopyWithImpl(this._self, this._then);

  final FloorReady _self;
  final $Res Function(FloorReady) _then;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? floor = null,}) {
  return _then(FloorReady(
null == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as Floor,
  ));
}

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorCopyWith<$Res> get floor {
  
  return $FloorCopyWith<$Res>(_self.floor, (value) {
    return _then(_self.copyWith(floor: value));
  });
}
}

/// @nodoc


class FloorFailed implements FloorState {
  const FloorFailed(this.error);
  

 final  ApiException error;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorFailedCopyWith<FloorFailed> get copyWith => _$FloorFailedCopyWithImpl<FloorFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'FloorState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $FloorFailedCopyWith<$Res> implements $FloorStateCopyWith<$Res> {
  factory $FloorFailedCopyWith(FloorFailed value, $Res Function(FloorFailed) _then) = _$FloorFailedCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$FloorFailedCopyWithImpl<$Res>
    implements $FloorFailedCopyWith<$Res> {
  _$FloorFailedCopyWithImpl(this._self, this._then);

  final FloorFailed _self;
  final $Res Function(FloorFailed) _then;

/// Create a copy of FloorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(FloorFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
