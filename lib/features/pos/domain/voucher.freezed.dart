// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Voucher {

 String get voucherId;/// As the vouchers keep it: capitals, whatever was typed.
 String get code; VoucherType get type;/// Basis points for a percentage (1000 is 10%), whole rupiah for an
/// amount.
 int get value; String? get name;/// A percentage's most, in rupiah; null for none.
 int? get maxDiscount;/// The subtotal the voucher needs; null for none.
 int? get minSpend;
/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherCopyWith<Voucher> get copyWith => _$VoucherCopyWithImpl<Voucher>(this as Voucher, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Voucher;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Voucher&&(identical(other.voucherId, _this.voucherId) || other.voucherId == _this.voucherId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.maxDiscount, _this.maxDiscount) || other.maxDiscount == _this.maxDiscount)&&(identical(other.minSpend, _this.minSpend) || other.minSpend == _this.minSpend));
}


@override
int get hashCode {
  final _this = this as Voucher;
  return Object.hash(runtimeType,_this.voucherId,_this.code,_this.type,_this.value,_this.name,_this.maxDiscount,_this.minSpend);
}

@override
String toString() {
  final _this = this as Voucher;
  return 'Voucher(voucherId: ${_this.voucherId}, code: ${_this.code}, type: ${_this.type}, value: ${_this.value}, name: ${_this.name}, maxDiscount: ${_this.maxDiscount}, minSpend: ${_this.minSpend})';
}


}

/// @nodoc
abstract mixin class $VoucherCopyWith<$Res>  {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) _then) = _$VoucherCopyWithImpl;
@useResult
$Res call({
 String voucherId, String code, VoucherType type, int value, String? name, int? maxDiscount, int? minSpend
});




}
/// @nodoc
class _$VoucherCopyWithImpl<$Res>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._self, this._then);

  final Voucher _self;
  final $Res Function(Voucher) _then;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherId = null,Object? code = null,Object? type = null,Object? value = null,Object? name = freezed,Object? maxDiscount = freezed,Object? minSpend = freezed,}) {
  return _then(Voucher(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VoucherType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,minSpend: freezed == minSpend ? _self.minSpend : minSpend // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Voucher].
extension VoucherPatterns on Voucher {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Voucher value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Voucher() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Voucher value)  $default,){
final _that = this;
switch (_that) {
case _Voucher():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Voucher value)?  $default,){
final _that = this;
switch (_that) {
case _Voucher() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voucherId,  String code,  VoucherType type,  int value,  String? name,  int? maxDiscount,  int? minSpend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Voucher() when $default != null:
return $default(_that.voucherId,_that.code,_that.type,_that.value,_that.name,_that.maxDiscount,_that.minSpend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voucherId,  String code,  VoucherType type,  int value,  String? name,  int? maxDiscount,  int? minSpend)  $default,) {final _that = this;
switch (_that) {
case _Voucher():
return $default(_that.voucherId,_that.code,_that.type,_that.value,_that.name,_that.maxDiscount,_that.minSpend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voucherId,  String code,  VoucherType type,  int value,  String? name,  int? maxDiscount,  int? minSpend)?  $default,) {final _that = this;
switch (_that) {
case _Voucher() when $default != null:
return $default(_that.voucherId,_that.code,_that.type,_that.value,_that.name,_that.maxDiscount,_that.minSpend);case _:
  return null;

}
}

}

/// @nodoc


class _Voucher implements Voucher {
  const _Voucher({required this.voucherId, required this.code, required this.type, required this.value, this.name, this.maxDiscount, this.minSpend});
  

@override final  String voucherId;
/// As the vouchers keep it: capitals, whatever was typed.
@override final  String code;
@override final  VoucherType type;
/// Basis points for a percentage (1000 is 10%), whole rupiah for an
/// amount.
@override final  int value;
@override final  String? name;
/// A percentage's most, in rupiah; null for none.
@override final  int? maxDiscount;
/// The subtotal the voucher needs; null for none.
@override final  int? minSpend;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherCopyWith<_Voucher> get copyWith => __$VoucherCopyWithImpl<_Voucher>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Voucher&&(identical(other.voucherId, voucherId) || other.voucherId == voucherId)&&(identical(other.code, code) || other.code == code)&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.name, name) || other.name == name)&&(identical(other.maxDiscount, maxDiscount) || other.maxDiscount == maxDiscount)&&(identical(other.minSpend, minSpend) || other.minSpend == minSpend));
}


@override
int get hashCode {
    return Object.hash(runtimeType,voucherId,code,type,value,name,maxDiscount,minSpend);
}

@override
String toString() {
    return 'Voucher(voucherId: $voucherId, code: $code, type: $type, value: $value, name: $name, maxDiscount: $maxDiscount, minSpend: $minSpend)';
}


}

/// @nodoc
abstract mixin class _$VoucherCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$VoucherCopyWith(_Voucher value, $Res Function(_Voucher) _then) = __$VoucherCopyWithImpl;
@override @useResult
$Res call({
 String voucherId, String code, VoucherType type, int value, String? name, int? maxDiscount, int? minSpend
});




}
/// @nodoc
class __$VoucherCopyWithImpl<$Res>
    implements _$VoucherCopyWith<$Res> {
  __$VoucherCopyWithImpl(this._self, this._then);

  final _Voucher _self;
  final $Res Function(_Voucher) _then;

/// Create a copy of Voucher
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherId = null,Object? code = null,Object? type = null,Object? value = null,Object? name = freezed,Object? maxDiscount = freezed,Object? minSpend = freezed,}) {
  return _then(_Voucher(
voucherId: null == voucherId ? _self.voucherId : voucherId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as VoucherType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,maxDiscount: freezed == maxDiscount ? _self.maxDiscount : maxDiscount // ignore: cast_nullable_to_non_nullable
as int?,minSpend: freezed == minSpend ? _self.minSpend : minSpend // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
