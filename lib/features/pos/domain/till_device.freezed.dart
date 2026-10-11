// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'till_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TillDevice {

 String get deviceId;/// K01: part of every receipt number the device makes.
 String get code;/// What its Manager called it, such as Kasir depan.
 String get name;/// The outlet's code and the device's, such as BDG01-K01.
 String get orderNoPrefix;/// The outlet's day the count is of, as YYYY-MM-DD.
 String get day;/// The count the device's next receipt number of [day] takes.
 int get nextNumber;
/// Create a copy of TillDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TillDeviceCopyWith<TillDevice> get copyWith => _$TillDeviceCopyWithImpl<TillDevice>(this as TillDevice, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TillDevice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TillDevice&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.orderNoPrefix, _this.orderNoPrefix) || other.orderNoPrefix == _this.orderNoPrefix)&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.nextNumber, _this.nextNumber) || other.nextNumber == _this.nextNumber));
}


@override
int get hashCode {
  final _this = this as TillDevice;
  return Object.hash(runtimeType,_this.deviceId,_this.code,_this.name,_this.orderNoPrefix,_this.day,_this.nextNumber);
}

@override
String toString() {
  final _this = this as TillDevice;
  return 'TillDevice(deviceId: ${_this.deviceId}, code: ${_this.code}, name: ${_this.name}, orderNoPrefix: ${_this.orderNoPrefix}, day: ${_this.day}, nextNumber: ${_this.nextNumber})';
}


}

/// @nodoc
abstract mixin class $TillDeviceCopyWith<$Res>  {
  factory $TillDeviceCopyWith(TillDevice value, $Res Function(TillDevice) _then) = _$TillDeviceCopyWithImpl;
@useResult
$Res call({
 String deviceId, String code, String name, String orderNoPrefix, String day, int nextNumber
});




}
/// @nodoc
class _$TillDeviceCopyWithImpl<$Res>
    implements $TillDeviceCopyWith<$Res> {
  _$TillDeviceCopyWithImpl(this._self, this._then);

  final TillDevice _self;
  final $Res Function(TillDevice) _then;

/// Create a copy of TillDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? code = null,Object? name = null,Object? orderNoPrefix = null,Object? day = null,Object? nextNumber = null,}) {
  return _then(TillDevice(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,orderNoPrefix: null == orderNoPrefix ? _self.orderNoPrefix : orderNoPrefix // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,nextNumber: null == nextNumber ? _self.nextNumber : nextNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TillDevice].
extension TillDevicePatterns on TillDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TillDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TillDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TillDevice value)  $default,){
final _that = this;
switch (_that) {
case _TillDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TillDevice value)?  $default,){
final _that = this;
switch (_that) {
case _TillDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String code,  String name,  String orderNoPrefix,  String day,  int nextNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TillDevice() when $default != null:
return $default(_that.deviceId,_that.code,_that.name,_that.orderNoPrefix,_that.day,_that.nextNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String code,  String name,  String orderNoPrefix,  String day,  int nextNumber)  $default,) {final _that = this;
switch (_that) {
case _TillDevice():
return $default(_that.deviceId,_that.code,_that.name,_that.orderNoPrefix,_that.day,_that.nextNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String code,  String name,  String orderNoPrefix,  String day,  int nextNumber)?  $default,) {final _that = this;
switch (_that) {
case _TillDevice() when $default != null:
return $default(_that.deviceId,_that.code,_that.name,_that.orderNoPrefix,_that.day,_that.nextNumber);case _:
  return null;

}
}

}

/// @nodoc


class _TillDevice implements TillDevice {
  const _TillDevice({required this.deviceId, required this.code, required this.name, required this.orderNoPrefix, required this.day, required this.nextNumber});
  

@override final  String deviceId;
/// K01: part of every receipt number the device makes.
@override final  String code;
/// What its Manager called it, such as Kasir depan.
@override final  String name;
/// The outlet's code and the device's, such as BDG01-K01.
@override final  String orderNoPrefix;
/// The outlet's day the count is of, as YYYY-MM-DD.
@override final  String day;
/// The count the device's next receipt number of [day] takes.
@override final  int nextNumber;

/// Create a copy of TillDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TillDeviceCopyWith<_TillDevice> get copyWith => __$TillDeviceCopyWithImpl<_TillDevice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TillDevice&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.orderNoPrefix, orderNoPrefix) || other.orderNoPrefix == orderNoPrefix)&&(identical(other.day, day) || other.day == day)&&(identical(other.nextNumber, nextNumber) || other.nextNumber == nextNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,deviceId,code,name,orderNoPrefix,day,nextNumber);
}

@override
String toString() {
    return 'TillDevice(deviceId: $deviceId, code: $code, name: $name, orderNoPrefix: $orderNoPrefix, day: $day, nextNumber: $nextNumber)';
}


}

/// @nodoc
abstract mixin class _$TillDeviceCopyWith<$Res> implements $TillDeviceCopyWith<$Res> {
  factory _$TillDeviceCopyWith(_TillDevice value, $Res Function(_TillDevice) _then) = __$TillDeviceCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String code, String name, String orderNoPrefix, String day, int nextNumber
});




}
/// @nodoc
class __$TillDeviceCopyWithImpl<$Res>
    implements _$TillDeviceCopyWith<$Res> {
  __$TillDeviceCopyWithImpl(this._self, this._then);

  final _TillDevice _self;
  final $Res Function(_TillDevice) _then;

/// Create a copy of TillDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? code = null,Object? name = null,Object? orderNoPrefix = null,Object? day = null,Object? nextNumber = null,}) {
  return _then(_TillDevice(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,orderNoPrefix: null == orderNoPrefix ? _self.orderNoPrefix : orderNoPrefix // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,nextNumber: null == nextNumber ? _self.nextNumber : nextNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
