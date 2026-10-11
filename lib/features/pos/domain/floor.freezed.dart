// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GridBox {

 int get x; int get y; int get w; int get h;
/// Create a copy of GridBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GridBoxCopyWith<GridBox> get copyWith => _$GridBoxCopyWithImpl<GridBox>(this as GridBox, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GridBox;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GridBox&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.w, _this.w) || other.w == _this.w)&&(identical(other.h, _this.h) || other.h == _this.h));
}


@override
int get hashCode {
  final _this = this as GridBox;
  return Object.hash(runtimeType,_this.x,_this.y,_this.w,_this.h);
}

@override
String toString() {
  final _this = this as GridBox;
  return 'GridBox(x: ${_this.x}, y: ${_this.y}, w: ${_this.w}, h: ${_this.h})';
}


}

/// @nodoc
abstract mixin class $GridBoxCopyWith<$Res>  {
  factory $GridBoxCopyWith(GridBox value, $Res Function(GridBox) _then) = _$GridBoxCopyWithImpl;
@useResult
$Res call({
 int x, int y, int w, int h
});




}
/// @nodoc
class _$GridBoxCopyWithImpl<$Res>
    implements $GridBoxCopyWith<$Res> {
  _$GridBoxCopyWithImpl(this._self, this._then);

  final GridBox _self;
  final $Res Function(GridBox) _then;

/// Create a copy of GridBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? w = null,Object? h = null,}) {
  return _then(GridBox(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as int,h: null == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GridBox].
extension GridBoxPatterns on GridBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GridBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GridBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GridBox value)  $default,){
final _that = this;
switch (_that) {
case _GridBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GridBox value)?  $default,){
final _that = this;
switch (_that) {
case _GridBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int x,  int y,  int w,  int h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GridBox() when $default != null:
return $default(_that.x,_that.y,_that.w,_that.h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int x,  int y,  int w,  int h)  $default,) {final _that = this;
switch (_that) {
case _GridBox():
return $default(_that.x,_that.y,_that.w,_that.h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int x,  int y,  int w,  int h)?  $default,) {final _that = this;
switch (_that) {
case _GridBox() when $default != null:
return $default(_that.x,_that.y,_that.w,_that.h);case _:
  return null;

}
}

}

/// @nodoc


class _GridBox implements GridBox {
  const _GridBox({required this.x, required this.y, required this.w, required this.h});
  

@override final  int x;
@override final  int y;
@override final  int w;
@override final  int h;

/// Create a copy of GridBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GridBoxCopyWith<_GridBox> get copyWith => __$GridBoxCopyWithImpl<_GridBox>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GridBox&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.w, w) || other.w == w)&&(identical(other.h, h) || other.h == h));
}


@override
int get hashCode {
    return Object.hash(runtimeType,x,y,w,h);
}

@override
String toString() {
    return 'GridBox(x: $x, y: $y, w: $w, h: $h)';
}


}

/// @nodoc
abstract mixin class _$GridBoxCopyWith<$Res> implements $GridBoxCopyWith<$Res> {
  factory _$GridBoxCopyWith(_GridBox value, $Res Function(_GridBox) _then) = __$GridBoxCopyWithImpl;
@override @useResult
$Res call({
 int x, int y, int w, int h
});




}
/// @nodoc
class __$GridBoxCopyWithImpl<$Res>
    implements _$GridBoxCopyWith<$Res> {
  __$GridBoxCopyWithImpl(this._self, this._then);

  final _GridBox _self;
  final $Res Function(_GridBox) _then;

/// Create a copy of GridBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? w = null,Object? h = null,}) {
  return _then(_GridBox(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as int,h: null == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$Seated {

 DateTime get since; int get orders;
/// Create a copy of Seated
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatedCopyWith<Seated> get copyWith => _$SeatedCopyWithImpl<Seated>(this as Seated, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Seated;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seated&&(identical(other.since, _this.since) || other.since == _this.since)&&(identical(other.orders, _this.orders) || other.orders == _this.orders));
}


@override
int get hashCode {
  final _this = this as Seated;
  return Object.hash(runtimeType,_this.since,_this.orders);
}

@override
String toString() {
  final _this = this as Seated;
  return 'Seated(since: ${_this.since}, orders: ${_this.orders})';
}


}

/// @nodoc
abstract mixin class $SeatedCopyWith<$Res>  {
  factory $SeatedCopyWith(Seated value, $Res Function(Seated) _then) = _$SeatedCopyWithImpl;
@useResult
$Res call({
 DateTime since, int orders
});




}
/// @nodoc
class _$SeatedCopyWithImpl<$Res>
    implements $SeatedCopyWith<$Res> {
  _$SeatedCopyWithImpl(this._self, this._then);

  final Seated _self;
  final $Res Function(Seated) _then;

/// Create a copy of Seated
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? since = null,Object? orders = null,}) {
  return _then(Seated(
since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Seated].
extension SeatedPatterns on Seated {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seated value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seated() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seated value)  $default,){
final _that = this;
switch (_that) {
case _Seated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seated value)?  $default,){
final _that = this;
switch (_that) {
case _Seated() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime since,  int orders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seated() when $default != null:
return $default(_that.since,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime since,  int orders)  $default,) {final _that = this;
switch (_that) {
case _Seated():
return $default(_that.since,_that.orders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime since,  int orders)?  $default,) {final _that = this;
switch (_that) {
case _Seated() when $default != null:
return $default(_that.since,_that.orders);case _:
  return null;

}
}

}

/// @nodoc


class _Seated implements Seated {
  const _Seated({required this.since, required this.orders});
  

@override final  DateTime since;
@override final  int orders;

/// Create a copy of Seated
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatedCopyWith<_Seated> get copyWith => __$SeatedCopyWithImpl<_Seated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seated&&(identical(other.since, since) || other.since == since)&&(identical(other.orders, orders) || other.orders == orders));
}


@override
int get hashCode {
    return Object.hash(runtimeType,since,orders);
}

@override
String toString() {
    return 'Seated(since: $since, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$SeatedCopyWith<$Res> implements $SeatedCopyWith<$Res> {
  factory _$SeatedCopyWith(_Seated value, $Res Function(_Seated) _then) = __$SeatedCopyWithImpl;
@override @useResult
$Res call({
 DateTime since, int orders
});




}
/// @nodoc
class __$SeatedCopyWithImpl<$Res>
    implements _$SeatedCopyWith<$Res> {
  __$SeatedCopyWithImpl(this._self, this._then);

  final _Seated _self;
  final $Res Function(_Seated) _then;

/// Create a copy of Seated
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? since = null,Object? orders = null,}) {
  return _then(_Seated(
since: null == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$FloorTable {

 String get tableId; String get name; TableShape get shape; TableStatus get status;/// Seats; null when not given.
 int? get capacity;/// Its place on its area's layout; null while it isn't placed.
 GridBox? get box;/// While customers are seated there.
 Seated? get seated;
/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorTableCopyWith<FloorTable> get copyWith => _$FloorTableCopyWithImpl<FloorTable>(this as FloorTable, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FloorTable;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorTable&&(identical(other.tableId, _this.tableId) || other.tableId == _this.tableId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.shape, _this.shape) || other.shape == _this.shape)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.box, _this.box) || other.box == _this.box)&&(identical(other.seated, _this.seated) || other.seated == _this.seated));
}


@override
int get hashCode {
  final _this = this as FloorTable;
  return Object.hash(runtimeType,_this.tableId,_this.name,_this.shape,_this.status,_this.capacity,_this.box,_this.seated);
}

@override
String toString() {
  final _this = this as FloorTable;
  return 'FloorTable(tableId: ${_this.tableId}, name: ${_this.name}, shape: ${_this.shape}, status: ${_this.status}, capacity: ${_this.capacity}, box: ${_this.box}, seated: ${_this.seated})';
}


}

/// @nodoc
abstract mixin class $FloorTableCopyWith<$Res>  {
  factory $FloorTableCopyWith(FloorTable value, $Res Function(FloorTable) _then) = _$FloorTableCopyWithImpl;
@useResult
$Res call({
 String tableId, String name, TableShape shape, TableStatus status, int? capacity, GridBox? box, Seated? seated
});


$GridBoxCopyWith<$Res>? get box;$SeatedCopyWith<$Res>? get seated;

}
/// @nodoc
class _$FloorTableCopyWithImpl<$Res>
    implements $FloorTableCopyWith<$Res> {
  _$FloorTableCopyWithImpl(this._self, this._then);

  final FloorTable _self;
  final $Res Function(FloorTable) _then;

/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableId = null,Object? name = null,Object? shape = null,Object? status = null,Object? capacity = freezed,Object? box = freezed,Object? seated = freezed,}) {
  return _then(FloorTable(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as TableShape,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,box: freezed == box ? _self.box : box // ignore: cast_nullable_to_non_nullable
as GridBox?,seated: freezed == seated ? _self.seated : seated // ignore: cast_nullable_to_non_nullable
as Seated?,
  ));
}
/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridBoxCopyWith<$Res>? get box {
    if (_self.box == null) {
    return null;
  }

  return $GridBoxCopyWith<$Res>(_self.box!, (value) {
    return _then(_self.copyWith(box: value));
  });
}/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeatedCopyWith<$Res>? get seated {
    if (_self.seated == null) {
    return null;
  }

  return $SeatedCopyWith<$Res>(_self.seated!, (value) {
    return _then(_self.copyWith(seated: value));
  });
}
}


/// Adds pattern-matching-related methods to [FloorTable].
extension FloorTablePatterns on FloorTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorTable value)  $default,){
final _that = this;
switch (_that) {
case _FloorTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorTable value)?  $default,){
final _that = this;
switch (_that) {
case _FloorTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tableId,  String name,  TableShape shape,  TableStatus status,  int? capacity,  GridBox? box,  Seated? seated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorTable() when $default != null:
return $default(_that.tableId,_that.name,_that.shape,_that.status,_that.capacity,_that.box,_that.seated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tableId,  String name,  TableShape shape,  TableStatus status,  int? capacity,  GridBox? box,  Seated? seated)  $default,) {final _that = this;
switch (_that) {
case _FloorTable():
return $default(_that.tableId,_that.name,_that.shape,_that.status,_that.capacity,_that.box,_that.seated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tableId,  String name,  TableShape shape,  TableStatus status,  int? capacity,  GridBox? box,  Seated? seated)?  $default,) {final _that = this;
switch (_that) {
case _FloorTable() when $default != null:
return $default(_that.tableId,_that.name,_that.shape,_that.status,_that.capacity,_that.box,_that.seated);case _:
  return null;

}
}

}

/// @nodoc


class _FloorTable extends FloorTable {
  const _FloorTable({required this.tableId, required this.name, required this.shape, required this.status, this.capacity, this.box, this.seated}): super._();
  

@override final  String tableId;
@override final  String name;
@override final  TableShape shape;
@override final  TableStatus status;
/// Seats; null when not given.
@override final  int? capacity;
/// Its place on its area's layout; null while it isn't placed.
@override final  GridBox? box;
/// While customers are seated there.
@override final  Seated? seated;

/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorTableCopyWith<_FloorTable> get copyWith => __$FloorTableCopyWithImpl<_FloorTable>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorTable&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.name, name) || other.name == name)&&(identical(other.shape, shape) || other.shape == shape)&&(identical(other.status, status) || other.status == status)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.box, box) || other.box == box)&&(identical(other.seated, seated) || other.seated == seated));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tableId,name,shape,status,capacity,box,seated);
}

@override
String toString() {
    return 'FloorTable(tableId: $tableId, name: $name, shape: $shape, status: $status, capacity: $capacity, box: $box, seated: $seated)';
}


}

/// @nodoc
abstract mixin class _$FloorTableCopyWith<$Res> implements $FloorTableCopyWith<$Res> {
  factory _$FloorTableCopyWith(_FloorTable value, $Res Function(_FloorTable) _then) = __$FloorTableCopyWithImpl;
@override @useResult
$Res call({
 String tableId, String name, TableShape shape, TableStatus status, int? capacity, GridBox? box, Seated? seated
});


@override $GridBoxCopyWith<$Res>? get box;@override $SeatedCopyWith<$Res>? get seated;

}
/// @nodoc
class __$FloorTableCopyWithImpl<$Res>
    implements _$FloorTableCopyWith<$Res> {
  __$FloorTableCopyWithImpl(this._self, this._then);

  final _FloorTable _self;
  final $Res Function(_FloorTable) _then;

/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableId = null,Object? name = null,Object? shape = null,Object? status = null,Object? capacity = freezed,Object? box = freezed,Object? seated = freezed,}) {
  return _then(_FloorTable(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,shape: null == shape ? _self.shape : shape // ignore: cast_nullable_to_non_nullable
as TableShape,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TableStatus,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,box: freezed == box ? _self.box : box // ignore: cast_nullable_to_non_nullable
as GridBox?,seated: freezed == seated ? _self.seated : seated // ignore: cast_nullable_to_non_nullable
as Seated?,
  ));
}

/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridBoxCopyWith<$Res>? get box {
    if (_self.box == null) {
    return null;
  }

  return $GridBoxCopyWith<$Res>(_self.box!, (value) {
    return _then(_self.copyWith(box: value));
  });
}/// Create a copy of FloorTable
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeatedCopyWith<$Res>? get seated {
    if (_self.seated == null) {
    return null;
  }

  return $SeatedCopyWith<$Res>(_self.seated!, (value) {
    return _then(_self.copyWith(seated: value));
  });
}
}

/// @nodoc
mixin _$FloorDecoration {

 DecorationKind get kind; GridBox get box;
/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorDecorationCopyWith<FloorDecoration> get copyWith => _$FloorDecorationCopyWithImpl<FloorDecoration>(this as FloorDecoration, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FloorDecoration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorDecoration&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.box, _this.box) || other.box == _this.box));
}


@override
int get hashCode {
  final _this = this as FloorDecoration;
  return Object.hash(runtimeType,_this.kind,_this.box);
}

@override
String toString() {
  final _this = this as FloorDecoration;
  return 'FloorDecoration(kind: ${_this.kind}, box: ${_this.box})';
}


}

/// @nodoc
abstract mixin class $FloorDecorationCopyWith<$Res>  {
  factory $FloorDecorationCopyWith(FloorDecoration value, $Res Function(FloorDecoration) _then) = _$FloorDecorationCopyWithImpl;
@useResult
$Res call({
 DecorationKind kind, GridBox box
});


$GridBoxCopyWith<$Res> get box;

}
/// @nodoc
class _$FloorDecorationCopyWithImpl<$Res>
    implements $FloorDecorationCopyWith<$Res> {
  _$FloorDecorationCopyWithImpl(this._self, this._then);

  final FloorDecoration _self;
  final $Res Function(FloorDecoration) _then;

/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? box = null,}) {
  return _then(FloorDecoration(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DecorationKind,box: null == box ? _self.box : box // ignore: cast_nullable_to_non_nullable
as GridBox,
  ));
}
/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridBoxCopyWith<$Res> get box {
  
  return $GridBoxCopyWith<$Res>(_self.box, (value) {
    return _then(_self.copyWith(box: value));
  });
}
}


/// Adds pattern-matching-related methods to [FloorDecoration].
extension FloorDecorationPatterns on FloorDecoration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorDecoration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorDecoration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorDecoration value)  $default,){
final _that = this;
switch (_that) {
case _FloorDecoration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorDecoration value)?  $default,){
final _that = this;
switch (_that) {
case _FloorDecoration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DecorationKind kind,  GridBox box)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorDecoration() when $default != null:
return $default(_that.kind,_that.box);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DecorationKind kind,  GridBox box)  $default,) {final _that = this;
switch (_that) {
case _FloorDecoration():
return $default(_that.kind,_that.box);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DecorationKind kind,  GridBox box)?  $default,) {final _that = this;
switch (_that) {
case _FloorDecoration() when $default != null:
return $default(_that.kind,_that.box);case _:
  return null;

}
}

}

/// @nodoc


class _FloorDecoration implements FloorDecoration {
  const _FloorDecoration({required this.kind, required this.box});
  

@override final  DecorationKind kind;
@override final  GridBox box;

/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorDecorationCopyWith<_FloorDecoration> get copyWith => __$FloorDecorationCopyWithImpl<_FloorDecoration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorDecoration&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.box, box) || other.box == box));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kind,box);
}

@override
String toString() {
    return 'FloorDecoration(kind: $kind, box: $box)';
}


}

/// @nodoc
abstract mixin class _$FloorDecorationCopyWith<$Res> implements $FloorDecorationCopyWith<$Res> {
  factory _$FloorDecorationCopyWith(_FloorDecoration value, $Res Function(_FloorDecoration) _then) = __$FloorDecorationCopyWithImpl;
@override @useResult
$Res call({
 DecorationKind kind, GridBox box
});


@override $GridBoxCopyWith<$Res> get box;

}
/// @nodoc
class __$FloorDecorationCopyWithImpl<$Res>
    implements _$FloorDecorationCopyWith<$Res> {
  __$FloorDecorationCopyWithImpl(this._self, this._then);

  final _FloorDecoration _self;
  final $Res Function(_FloorDecoration) _then;

/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? box = null,}) {
  return _then(_FloorDecoration(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as DecorationKind,box: null == box ? _self.box : box // ignore: cast_nullable_to_non_nullable
as GridBox,
  ));
}

/// Create a copy of FloorDecoration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GridBoxCopyWith<$Res> get box {
  
  return $GridBoxCopyWith<$Res>(_self.box, (value) {
    return _then(_self.copyWith(box: value));
  });
}
}

/// @nodoc
mixin _$FloorArea {

 String get areaId; String get name; List<FloorDecoration> get decorations;/// By name, placed or not.
 List<FloorTable> get tables;
/// Create a copy of FloorArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorAreaCopyWith<FloorArea> get copyWith => _$FloorAreaCopyWithImpl<FloorArea>(this as FloorArea, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FloorArea;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorArea&&(identical(other.areaId, _this.areaId) || other.areaId == _this.areaId)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.decorations, _this.decorations)&&const DeepCollectionEquality().equals(other.tables, _this.tables));
}


@override
int get hashCode {
  final _this = this as FloorArea;
  return Object.hash(runtimeType,_this.areaId,_this.name,const DeepCollectionEquality().hash(_this.decorations),const DeepCollectionEquality().hash(_this.tables));
}

@override
String toString() {
  final _this = this as FloorArea;
  return 'FloorArea(areaId: ${_this.areaId}, name: ${_this.name}, decorations: ${_this.decorations}, tables: ${_this.tables})';
}


}

/// @nodoc
abstract mixin class $FloorAreaCopyWith<$Res>  {
  factory $FloorAreaCopyWith(FloorArea value, $Res Function(FloorArea) _then) = _$FloorAreaCopyWithImpl;
@useResult
$Res call({
 String areaId, String name, List<FloorDecoration> decorations, List<FloorTable> tables
});




}
/// @nodoc
class _$FloorAreaCopyWithImpl<$Res>
    implements $FloorAreaCopyWith<$Res> {
  _$FloorAreaCopyWithImpl(this._self, this._then);

  final FloorArea _self;
  final $Res Function(FloorArea) _then;

/// Create a copy of FloorArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areaId = null,Object? name = null,Object? decorations = null,Object? tables = null,}) {
  return _then(FloorArea(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,decorations: null == decorations ? _self.decorations : decorations // ignore: cast_nullable_to_non_nullable
as List<FloorDecoration>,tables: null == tables ? _self.tables : tables // ignore: cast_nullable_to_non_nullable
as List<FloorTable>,
  ));
}

}


/// Adds pattern-matching-related methods to [FloorArea].
extension FloorAreaPatterns on FloorArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorArea() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorArea value)  $default,){
final _that = this;
switch (_that) {
case _FloorArea():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorArea value)?  $default,){
final _that = this;
switch (_that) {
case _FloorArea() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String areaId,  String name,  List<FloorDecoration> decorations,  List<FloorTable> tables)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorArea() when $default != null:
return $default(_that.areaId,_that.name,_that.decorations,_that.tables);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String areaId,  String name,  List<FloorDecoration> decorations,  List<FloorTable> tables)  $default,) {final _that = this;
switch (_that) {
case _FloorArea():
return $default(_that.areaId,_that.name,_that.decorations,_that.tables);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String areaId,  String name,  List<FloorDecoration> decorations,  List<FloorTable> tables)?  $default,) {final _that = this;
switch (_that) {
case _FloorArea() when $default != null:
return $default(_that.areaId,_that.name,_that.decorations,_that.tables);case _:
  return null;

}
}

}

/// @nodoc


class _FloorArea implements FloorArea {
  const _FloorArea({required this.areaId, required this.name, required  List<FloorDecoration> decorations, required  List<FloorTable> tables}): _decorations = decorations,_tables = tables;
  

@override final  String areaId;
@override final  String name;
 final  List<FloorDecoration> _decorations;
@override List<FloorDecoration> get decorations {
  if (_decorations is EqualUnmodifiableListView) return _decorations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_decorations);
}

/// By name, placed or not.
 final  List<FloorTable> _tables;
/// By name, placed or not.
@override List<FloorTable> get tables {
  if (_tables is EqualUnmodifiableListView) return _tables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tables);
}


/// Create a copy of FloorArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorAreaCopyWith<_FloorArea> get copyWith => __$FloorAreaCopyWithImpl<_FloorArea>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorArea&&(identical(other.areaId, areaId) || other.areaId == areaId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.decorations, _decorations)&&const DeepCollectionEquality().equals(other.tables, _tables));
}


@override
int get hashCode {
    return Object.hash(runtimeType,areaId,name,const DeepCollectionEquality().hash(_decorations),const DeepCollectionEquality().hash(_tables));
}

@override
String toString() {
    return 'FloorArea(areaId: $areaId, name: $name, decorations: $decorations, tables: $tables)';
}


}

/// @nodoc
abstract mixin class _$FloorAreaCopyWith<$Res> implements $FloorAreaCopyWith<$Res> {
  factory _$FloorAreaCopyWith(_FloorArea value, $Res Function(_FloorArea) _then) = __$FloorAreaCopyWithImpl;
@override @useResult
$Res call({
 String areaId, String name, List<FloorDecoration> decorations, List<FloorTable> tables
});




}
/// @nodoc
class __$FloorAreaCopyWithImpl<$Res>
    implements _$FloorAreaCopyWith<$Res> {
  __$FloorAreaCopyWithImpl(this._self, this._then);

  final _FloorArea _self;
  final $Res Function(_FloorArea) _then;

/// Create a copy of FloorArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areaId = null,Object? name = null,Object? decorations = null,Object? tables = null,}) {
  return _then(_FloorArea(
areaId: null == areaId ? _self.areaId : areaId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,decorations: null == decorations ? _self._decorations : decorations // ignore: cast_nullable_to_non_nullable
as List<FloorDecoration>,tables: null == tables ? _self._tables : tables // ignore: cast_nullable_to_non_nullable
as List<FloorTable>,
  ));
}


}

/// @nodoc
mixin _$Floor {

 List<FloorArea> get areas;
/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorCopyWith<Floor> get copyWith => _$FloorCopyWithImpl<Floor>(this as Floor, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Floor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Floor&&const DeepCollectionEquality().equals(other.areas, _this.areas));
}


@override
int get hashCode {
  final _this = this as Floor;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.areas));
}

@override
String toString() {
  final _this = this as Floor;
  return 'Floor(areas: ${_this.areas})';
}


}

/// @nodoc
abstract mixin class $FloorCopyWith<$Res>  {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) _then) = _$FloorCopyWithImpl;
@useResult
$Res call({
 List<FloorArea> areas
});




}
/// @nodoc
class _$FloorCopyWithImpl<$Res>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._self, this._then);

  final Floor _self;
  final $Res Function(Floor) _then;

/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? areas = null,}) {
  return _then(Floor(
areas: null == areas ? _self.areas : areas // ignore: cast_nullable_to_non_nullable
as List<FloorArea>,
  ));
}

}


/// Adds pattern-matching-related methods to [Floor].
extension FloorPatterns on Floor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Floor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Floor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Floor value)  $default,){
final _that = this;
switch (_that) {
case _Floor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Floor value)?  $default,){
final _that = this;
switch (_that) {
case _Floor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FloorArea> areas)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Floor() when $default != null:
return $default(_that.areas);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FloorArea> areas)  $default,) {final _that = this;
switch (_that) {
case _Floor():
return $default(_that.areas);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FloorArea> areas)?  $default,) {final _that = this;
switch (_that) {
case _Floor() when $default != null:
return $default(_that.areas);case _:
  return null;

}
}

}

/// @nodoc


class _Floor extends Floor {
  const _Floor({required  List<FloorArea> areas}): _areas = areas,super._();
  

 final  List<FloorArea> _areas;
@override List<FloorArea> get areas {
  if (_areas is EqualUnmodifiableListView) return _areas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_areas);
}


/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorCopyWith<_Floor> get copyWith => __$FloorCopyWithImpl<_Floor>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Floor&&const DeepCollectionEquality().equals(other.areas, _areas));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_areas));
}

@override
String toString() {
    return 'Floor(areas: $areas)';
}


}

/// @nodoc
abstract mixin class _$FloorCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$FloorCopyWith(_Floor value, $Res Function(_Floor) _then) = __$FloorCopyWithImpl;
@override @useResult
$Res call({
 List<FloorArea> areas
});




}
/// @nodoc
class __$FloorCopyWithImpl<$Res>
    implements _$FloorCopyWith<$Res> {
  __$FloorCopyWithImpl(this._self, this._then);

  final _Floor _self;
  final $Res Function(_Floor) _then;

/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? areas = null,}) {
  return _then(_Floor(
areas: null == areas ? _self._areas : areas // ignore: cast_nullable_to_non_nullable
as List<FloorArea>,
  ));
}


}

/// @nodoc
mixin _$OrderTable {

 String get tableId; String get name;
/// Create a copy of OrderTable
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTableCopyWith<OrderTable> get copyWith => _$OrderTableCopyWithImpl<OrderTable>(this as OrderTable, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderTable;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTable&&(identical(other.tableId, _this.tableId) || other.tableId == _this.tableId)&&(identical(other.name, _this.name) || other.name == _this.name));
}


@override
int get hashCode {
  final _this = this as OrderTable;
  return Object.hash(runtimeType,_this.tableId,_this.name);
}

@override
String toString() {
  final _this = this as OrderTable;
  return 'OrderTable(tableId: ${_this.tableId}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $OrderTableCopyWith<$Res>  {
  factory $OrderTableCopyWith(OrderTable value, $Res Function(OrderTable) _then) = _$OrderTableCopyWithImpl;
@useResult
$Res call({
 String tableId, String name
});




}
/// @nodoc
class _$OrderTableCopyWithImpl<$Res>
    implements $OrderTableCopyWith<$Res> {
  _$OrderTableCopyWithImpl(this._self, this._then);

  final OrderTable _self;
  final $Res Function(OrderTable) _then;

/// Create a copy of OrderTable
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableId = null,Object? name = null,}) {
  return _then(OrderTable(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTable].
extension OrderTablePatterns on OrderTable {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTable value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTable() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTable value)  $default,){
final _that = this;
switch (_that) {
case _OrderTable():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTable value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTable() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tableId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTable() when $default != null:
return $default(_that.tableId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tableId,  String name)  $default,) {final _that = this;
switch (_that) {
case _OrderTable():
return $default(_that.tableId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tableId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _OrderTable() when $default != null:
return $default(_that.tableId,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _OrderTable implements OrderTable {
  const _OrderTable({required this.tableId, required this.name});
  

@override final  String tableId;
@override final  String name;

/// Create a copy of OrderTable
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTableCopyWith<_OrderTable> get copyWith => __$OrderTableCopyWithImpl<_OrderTable>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTable&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,tableId,name);
}

@override
String toString() {
    return 'OrderTable(tableId: $tableId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrderTableCopyWith<$Res> implements $OrderTableCopyWith<$Res> {
  factory _$OrderTableCopyWith(_OrderTable value, $Res Function(_OrderTable) _then) = __$OrderTableCopyWithImpl;
@override @useResult
$Res call({
 String tableId, String name
});




}
/// @nodoc
class __$OrderTableCopyWithImpl<$Res>
    implements _$OrderTableCopyWith<$Res> {
  __$OrderTableCopyWithImpl(this._self, this._then);

  final _OrderTable _self;
  final $Res Function(_OrderTable) _then;

/// Create a copy of OrderTable
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableId = null,Object? name = null,}) {
  return _then(_OrderTable(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
