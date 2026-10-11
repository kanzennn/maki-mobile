// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeviceState()';
}


}

/// @nodoc
class $DeviceStateCopyWith<$Res>  {
$DeviceStateCopyWith(DeviceState _, $Res Function(DeviceState) __);
}


/// Adds pattern-matching-related methods to [DeviceState].
extension DeviceStatePatterns on DeviceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeviceLoading value)?  loading,TResult Function( DeviceReady value)?  ready,TResult Function( DeviceUnregistered value)?  unregistered,TResult Function( DeviceFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeviceLoading() when loading != null:
return loading(_that);case DeviceReady() when ready != null:
return ready(_that);case DeviceUnregistered() when unregistered != null:
return unregistered(_that);case DeviceFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeviceLoading value)  loading,required TResult Function( DeviceReady value)  ready,required TResult Function( DeviceUnregistered value)  unregistered,required TResult Function( DeviceFailed value)  failed,}){
final _that = this;
switch (_that) {
case DeviceLoading():
return loading(_that);case DeviceReady():
return ready(_that);case DeviceUnregistered():
return unregistered(_that);case DeviceFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeviceLoading value)?  loading,TResult? Function( DeviceReady value)?  ready,TResult? Function( DeviceUnregistered value)?  unregistered,TResult? Function( DeviceFailed value)?  failed,}){
final _that = this;
switch (_that) {
case DeviceLoading() when loading != null:
return loading(_that);case DeviceReady() when ready != null:
return ready(_that);case DeviceUnregistered() when unregistered != null:
return unregistered(_that);case DeviceFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( TillDevice device)?  ready,TResult Function( bool activating,  ApiException? error)?  unregistered,TResult Function( ApiException error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeviceLoading() when loading != null:
return loading();case DeviceReady() when ready != null:
return ready(_that.device);case DeviceUnregistered() when unregistered != null:
return unregistered(_that.activating,_that.error);case DeviceFailed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( TillDevice device)  ready,required TResult Function( bool activating,  ApiException? error)  unregistered,required TResult Function( ApiException error)  failed,}) {final _that = this;
switch (_that) {
case DeviceLoading():
return loading();case DeviceReady():
return ready(_that.device);case DeviceUnregistered():
return unregistered(_that.activating,_that.error);case DeviceFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( TillDevice device)?  ready,TResult? Function( bool activating,  ApiException? error)?  unregistered,TResult? Function( ApiException error)?  failed,}) {final _that = this;
switch (_that) {
case DeviceLoading() when loading != null:
return loading();case DeviceReady() when ready != null:
return ready(_that.device);case DeviceUnregistered() when unregistered != null:
return unregistered(_that.activating,_that.error);case DeviceFailed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DeviceLoading implements DeviceState {
  const DeviceLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeviceState.loading()';
}


}




/// @nodoc


class DeviceReady implements DeviceState {
  const DeviceReady(this.device);
  

 final  TillDevice device;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceReadyCopyWith<DeviceReady> get copyWith => _$DeviceReadyCopyWithImpl<DeviceReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceReady&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode {
    return Object.hash(runtimeType,device);
}

@override
String toString() {
    return 'DeviceState.ready(device: $device)';
}


}

/// @nodoc
abstract mixin class $DeviceReadyCopyWith<$Res> implements $DeviceStateCopyWith<$Res> {
  factory $DeviceReadyCopyWith(DeviceReady value, $Res Function(DeviceReady) _then) = _$DeviceReadyCopyWithImpl;
@useResult
$Res call({
 TillDevice device
});


$TillDeviceCopyWith<$Res> get device;

}
/// @nodoc
class _$DeviceReadyCopyWithImpl<$Res>
    implements $DeviceReadyCopyWith<$Res> {
  _$DeviceReadyCopyWithImpl(this._self, this._then);

  final DeviceReady _self;
  final $Res Function(DeviceReady) _then;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(DeviceReady(
null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as TillDevice,
  ));
}

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TillDeviceCopyWith<$Res> get device {
  
  return $TillDeviceCopyWith<$Res>(_self.device, (value) {
    return _then(_self.copyWith(device: value));
  });
}
}

/// @nodoc


class DeviceUnregistered implements DeviceState {
  const DeviceUnregistered({this.activating = false, this.error});
  

@JsonKey() final  bool activating;
 final  ApiException? error;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceUnregisteredCopyWith<DeviceUnregistered> get copyWith => _$DeviceUnregisteredCopyWithImpl<DeviceUnregistered>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceUnregistered&&(identical(other.activating, activating) || other.activating == activating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,activating,error);
}

@override
String toString() {
    return 'DeviceState.unregistered(activating: $activating, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeviceUnregisteredCopyWith<$Res> implements $DeviceStateCopyWith<$Res> {
  factory $DeviceUnregisteredCopyWith(DeviceUnregistered value, $Res Function(DeviceUnregistered) _then) = _$DeviceUnregisteredCopyWithImpl;
@useResult
$Res call({
 bool activating, ApiException? error
});




}
/// @nodoc
class _$DeviceUnregisteredCopyWithImpl<$Res>
    implements $DeviceUnregisteredCopyWith<$Res> {
  _$DeviceUnregisteredCopyWithImpl(this._self, this._then);

  final DeviceUnregistered _self;
  final $Res Function(DeviceUnregistered) _then;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? activating = null,Object? error = freezed,}) {
  return _then(DeviceUnregistered(
activating: null == activating ? _self.activating : activating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException?,
  ));
}


}

/// @nodoc


class DeviceFailed implements DeviceState {
  const DeviceFailed(this.error);
  

 final  ApiException error;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceFailedCopyWith<DeviceFailed> get copyWith => _$DeviceFailedCopyWithImpl<DeviceFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'DeviceState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $DeviceFailedCopyWith<$Res> implements $DeviceStateCopyWith<$Res> {
  factory $DeviceFailedCopyWith(DeviceFailed value, $Res Function(DeviceFailed) _then) = _$DeviceFailedCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$DeviceFailedCopyWithImpl<$Res>
    implements $DeviceFailedCopyWith<$Res> {
  _$DeviceFailedCopyWithImpl(this._self, this._then);

  final DeviceFailed _self;
  final $Res Function(DeviceFailed) _then;

/// Create a copy of DeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DeviceFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
