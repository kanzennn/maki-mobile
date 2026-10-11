// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartLine {

 String get menuId; String get name; int get qty; String get note;
/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineCopyWith<CartLine> get copyWith => _$CartLineCopyWithImpl<CartLine>(this as CartLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CartLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLine&&(identical(other.menuId, _this.menuId) || other.menuId == _this.menuId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as CartLine;
  return Object.hash(runtimeType,_this.menuId,_this.name,_this.qty,_this.note);
}

@override
String toString() {
  final _this = this as CartLine;
  return 'CartLine(menuId: ${_this.menuId}, name: ${_this.name}, qty: ${_this.qty}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $CartLineCopyWith<$Res>  {
  factory $CartLineCopyWith(CartLine value, $Res Function(CartLine) _then) = _$CartLineCopyWithImpl;
@useResult
$Res call({
 String menuId, String name, int qty, String note
});




}
/// @nodoc
class _$CartLineCopyWithImpl<$Res>
    implements $CartLineCopyWith<$Res> {
  _$CartLineCopyWithImpl(this._self, this._then);

  final CartLine _self;
  final $Res Function(CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuId = null,Object? name = null,Object? qty = null,Object? note = null,}) {
  return _then(CartLine(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CartLine].
extension CartLinePatterns on CartLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLine value)  $default,){
final _that = this;
switch (_that) {
case _CartLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLine value)?  $default,){
final _that = this;
switch (_that) {
case _CartLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuId,  String name,  int qty,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.menuId,_that.name,_that.qty,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuId,  String name,  int qty,  String note)  $default,) {final _that = this;
switch (_that) {
case _CartLine():
return $default(_that.menuId,_that.name,_that.qty,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuId,  String name,  int qty,  String note)?  $default,) {final _that = this;
switch (_that) {
case _CartLine() when $default != null:
return $default(_that.menuId,_that.name,_that.qty,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _CartLine implements CartLine {
  const _CartLine({required this.menuId, required this.name, required this.qty, this.note = ''});
  

@override final  String menuId;
@override final  String name;
@override final  int qty;
@override@JsonKey() final  String note;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineCopyWith<_CartLine> get copyWith => __$CartLineCopyWithImpl<_CartLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLine&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,menuId,name,qty,note);
}

@override
String toString() {
    return 'CartLine(menuId: $menuId, name: $name, qty: $qty, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CartLineCopyWith<$Res> implements $CartLineCopyWith<$Res> {
  factory _$CartLineCopyWith(_CartLine value, $Res Function(_CartLine) _then) = __$CartLineCopyWithImpl;
@override @useResult
$Res call({
 String menuId, String name, int qty, String note
});




}
/// @nodoc
class __$CartLineCopyWithImpl<$Res>
    implements _$CartLineCopyWith<$Res> {
  __$CartLineCopyWithImpl(this._self, this._then);

  final _CartLine _self;
  final $Res Function(_CartLine) _then;

/// Create a copy of CartLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuId = null,Object? name = null,Object? qty = null,Object? note = null,}) {
  return _then(_CartLine(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
