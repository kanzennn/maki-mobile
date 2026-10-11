// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Catalog {

 CatalogOutlet get outlet; List<PaymentMethod> get paymentMethods; List<CatalogCategory> get categories;/// In the cashier's order: in stock first, sold out last, then by
/// category and name.
 List<CatalogMenu> get menus;/// At a table the cashier may pick, or by the number on the stand the
/// customer took, which a dine-in sale then needs.
 DineInMode get dineInMode;
/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCopyWith<Catalog> get copyWith => _$CatalogCopyWithImpl<Catalog>(this as Catalog, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Catalog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Catalog&&(identical(other.outlet, _this.outlet) || other.outlet == _this.outlet)&&const DeepCollectionEquality().equals(other.paymentMethods, _this.paymentMethods)&&const DeepCollectionEquality().equals(other.categories, _this.categories)&&const DeepCollectionEquality().equals(other.menus, _this.menus)&&(identical(other.dineInMode, _this.dineInMode) || other.dineInMode == _this.dineInMode));
}


@override
int get hashCode {
  final _this = this as Catalog;
  return Object.hash(runtimeType,_this.outlet,const DeepCollectionEquality().hash(_this.paymentMethods),const DeepCollectionEquality().hash(_this.categories),const DeepCollectionEquality().hash(_this.menus),_this.dineInMode);
}

@override
String toString() {
  final _this = this as Catalog;
  return 'Catalog(outlet: ${_this.outlet}, paymentMethods: ${_this.paymentMethods}, categories: ${_this.categories}, menus: ${_this.menus}, dineInMode: ${_this.dineInMode})';
}


}

/// @nodoc
abstract mixin class $CatalogCopyWith<$Res>  {
  factory $CatalogCopyWith(Catalog value, $Res Function(Catalog) _then) = _$CatalogCopyWithImpl;
@useResult
$Res call({
 CatalogOutlet outlet, List<PaymentMethod> paymentMethods, List<CatalogCategory> categories, List<CatalogMenu> menus, DineInMode dineInMode
});


$CatalogOutletCopyWith<$Res> get outlet;

}
/// @nodoc
class _$CatalogCopyWithImpl<$Res>
    implements $CatalogCopyWith<$Res> {
  _$CatalogCopyWithImpl(this._self, this._then);

  final Catalog _self;
  final $Res Function(Catalog) _then;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outlet = null,Object? paymentMethods = null,Object? categories = null,Object? menus = null,Object? dineInMode = null,}) {
  return _then(Catalog(
outlet: null == outlet ? _self.outlet : outlet // ignore: cast_nullable_to_non_nullable
as CatalogOutlet,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CatalogCategory>,menus: null == menus ? _self.menus : menus // ignore: cast_nullable_to_non_nullable
as List<CatalogMenu>,dineInMode: null == dineInMode ? _self.dineInMode : dineInMode // ignore: cast_nullable_to_non_nullable
as DineInMode,
  ));
}
/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogOutletCopyWith<$Res> get outlet {
  
  return $CatalogOutletCopyWith<$Res>(_self.outlet, (value) {
    return _then(_self.copyWith(outlet: value));
  });
}
}


/// Adds pattern-matching-related methods to [Catalog].
extension CatalogPatterns on Catalog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Catalog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Catalog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Catalog value)  $default,){
final _that = this;
switch (_that) {
case _Catalog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Catalog value)?  $default,){
final _that = this;
switch (_that) {
case _Catalog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CatalogOutlet outlet,  List<PaymentMethod> paymentMethods,  List<CatalogCategory> categories,  List<CatalogMenu> menus,  DineInMode dineInMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that.outlet,_that.paymentMethods,_that.categories,_that.menus,_that.dineInMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CatalogOutlet outlet,  List<PaymentMethod> paymentMethods,  List<CatalogCategory> categories,  List<CatalogMenu> menus,  DineInMode dineInMode)  $default,) {final _that = this;
switch (_that) {
case _Catalog():
return $default(_that.outlet,_that.paymentMethods,_that.categories,_that.menus,_that.dineInMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CatalogOutlet outlet,  List<PaymentMethod> paymentMethods,  List<CatalogCategory> categories,  List<CatalogMenu> menus,  DineInMode dineInMode)?  $default,) {final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that.outlet,_that.paymentMethods,_that.categories,_that.menus,_that.dineInMode);case _:
  return null;

}
}

}

/// @nodoc


class _Catalog extends Catalog {
  const _Catalog({required this.outlet, required  List<PaymentMethod> paymentMethods, required  List<CatalogCategory> categories, required  List<CatalogMenu> menus, this.dineInMode = DineInMode.table}): _paymentMethods = paymentMethods,_categories = categories,_menus = menus,super._();
  

@override final  CatalogOutlet outlet;
 final  List<PaymentMethod> _paymentMethods;
@override List<PaymentMethod> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}

 final  List<CatalogCategory> _categories;
@override List<CatalogCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// In the cashier's order: in stock first, sold out last, then by
/// category and name.
 final  List<CatalogMenu> _menus;
/// In the cashier's order: in stock first, sold out last, then by
/// category and name.
@override List<CatalogMenu> get menus {
  if (_menus is EqualUnmodifiableListView) return _menus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menus);
}

/// At a table the cashier may pick, or by the number on the stand the
/// customer took, which a dine-in sale then needs.
@override@JsonKey() final  DineInMode dineInMode;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCopyWith<_Catalog> get copyWith => __$CatalogCopyWithImpl<_Catalog>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Catalog&&(identical(other.outlet, outlet) || other.outlet == outlet)&&const DeepCollectionEquality().equals(other.paymentMethods, _paymentMethods)&&const DeepCollectionEquality().equals(other.categories, _categories)&&const DeepCollectionEquality().equals(other.menus, _menus)&&(identical(other.dineInMode, dineInMode) || other.dineInMode == dineInMode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,outlet,const DeepCollectionEquality().hash(_paymentMethods),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_menus),dineInMode);
}

@override
String toString() {
    return 'Catalog(outlet: $outlet, paymentMethods: $paymentMethods, categories: $categories, menus: $menus, dineInMode: $dineInMode)';
}


}

/// @nodoc
abstract mixin class _$CatalogCopyWith<$Res> implements $CatalogCopyWith<$Res> {
  factory _$CatalogCopyWith(_Catalog value, $Res Function(_Catalog) _then) = __$CatalogCopyWithImpl;
@override @useResult
$Res call({
 CatalogOutlet outlet, List<PaymentMethod> paymentMethods, List<CatalogCategory> categories, List<CatalogMenu> menus, DineInMode dineInMode
});


@override $CatalogOutletCopyWith<$Res> get outlet;

}
/// @nodoc
class __$CatalogCopyWithImpl<$Res>
    implements _$CatalogCopyWith<$Res> {
  __$CatalogCopyWithImpl(this._self, this._then);

  final _Catalog _self;
  final $Res Function(_Catalog) _then;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outlet = null,Object? paymentMethods = null,Object? categories = null,Object? menus = null,Object? dineInMode = null,}) {
  return _then(_Catalog(
outlet: null == outlet ? _self.outlet : outlet // ignore: cast_nullable_to_non_nullable
as CatalogOutlet,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CatalogCategory>,menus: null == menus ? _self._menus : menus // ignore: cast_nullable_to_non_nullable
as List<CatalogMenu>,dineInMode: null == dineInMode ? _self.dineInMode : dineInMode // ignore: cast_nullable_to_non_nullable
as DineInMode,
  ));
}

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogOutletCopyWith<$Res> get outlet {
  
  return $CatalogOutletCopyWith<$Res>(_self.outlet, (value) {
    return _then(_self.copyWith(outlet: value));
  });
}
}

/// @nodoc
mixin _$CatalogOutlet {

 String get outletId; String get code; String get name;/// IANA name, such as Asia/Jakarta: the outlet's day, and the times on
/// its receipts.
 String get timeZone;/// The receipts' language, `id` or `en`, whatever the screen's is.
 String get locale;/// Basis points: 1000 is 10%.
 int get taxBps; int get serviceBps; String? get address; String? get phone;
/// Create a copy of CatalogOutlet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogOutletCopyWith<CatalogOutlet> get copyWith => _$CatalogOutletCopyWithImpl<CatalogOutlet>(this as CatalogOutlet, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatalogOutlet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogOutlet&&(identical(other.outletId, _this.outletId) || other.outletId == _this.outletId)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.timeZone, _this.timeZone) || other.timeZone == _this.timeZone)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.taxBps, _this.taxBps) || other.taxBps == _this.taxBps)&&(identical(other.serviceBps, _this.serviceBps) || other.serviceBps == _this.serviceBps)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}


@override
int get hashCode {
  final _this = this as CatalogOutlet;
  return Object.hash(runtimeType,_this.outletId,_this.code,_this.name,_this.timeZone,_this.locale,_this.taxBps,_this.serviceBps,_this.address,_this.phone);
}

@override
String toString() {
  final _this = this as CatalogOutlet;
  return 'CatalogOutlet(outletId: ${_this.outletId}, code: ${_this.code}, name: ${_this.name}, timeZone: ${_this.timeZone}, locale: ${_this.locale}, taxBps: ${_this.taxBps}, serviceBps: ${_this.serviceBps}, address: ${_this.address}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $CatalogOutletCopyWith<$Res>  {
  factory $CatalogOutletCopyWith(CatalogOutlet value, $Res Function(CatalogOutlet) _then) = _$CatalogOutletCopyWithImpl;
@useResult
$Res call({
 String outletId, String code, String name, String timeZone, String locale, int taxBps, int serviceBps, String? address, String? phone
});




}
/// @nodoc
class _$CatalogOutletCopyWithImpl<$Res>
    implements $CatalogOutletCopyWith<$Res> {
  _$CatalogOutletCopyWithImpl(this._self, this._then);

  final CatalogOutlet _self;
  final $Res Function(CatalogOutlet) _then;

/// Create a copy of CatalogOutlet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outletId = null,Object? code = null,Object? name = null,Object? timeZone = null,Object? locale = null,Object? taxBps = null,Object? serviceBps = null,Object? address = freezed,Object? phone = freezed,}) {
  return _then(CatalogOutlet(
outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,taxBps: null == taxBps ? _self.taxBps : taxBps // ignore: cast_nullable_to_non_nullable
as int,serviceBps: null == serviceBps ? _self.serviceBps : serviceBps // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogOutlet].
extension CatalogOutletPatterns on CatalogOutlet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogOutlet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogOutlet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogOutlet value)  $default,){
final _that = this;
switch (_that) {
case _CatalogOutlet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogOutlet value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogOutlet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String outletId,  String code,  String name,  String timeZone,  String locale,  int taxBps,  int serviceBps,  String? address,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogOutlet() when $default != null:
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale,_that.taxBps,_that.serviceBps,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String outletId,  String code,  String name,  String timeZone,  String locale,  int taxBps,  int serviceBps,  String? address,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _CatalogOutlet():
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale,_that.taxBps,_that.serviceBps,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String outletId,  String code,  String name,  String timeZone,  String locale,  int taxBps,  int serviceBps,  String? address,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _CatalogOutlet() when $default != null:
return $default(_that.outletId,_that.code,_that.name,_that.timeZone,_that.locale,_that.taxBps,_that.serviceBps,_that.address,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogOutlet implements CatalogOutlet {
  const _CatalogOutlet({required this.outletId, required this.code, required this.name, required this.timeZone, required this.locale, required this.taxBps, required this.serviceBps, this.address, this.phone});
  

@override final  String outletId;
@override final  String code;
@override final  String name;
/// IANA name, such as Asia/Jakarta: the outlet's day, and the times on
/// its receipts.
@override final  String timeZone;
/// The receipts' language, `id` or `en`, whatever the screen's is.
@override final  String locale;
/// Basis points: 1000 is 10%.
@override final  int taxBps;
@override final  int serviceBps;
@override final  String? address;
@override final  String? phone;

/// Create a copy of CatalogOutlet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogOutletCopyWith<_CatalogOutlet> get copyWith => __$CatalogOutletCopyWithImpl<_CatalogOutlet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogOutlet&&(identical(other.outletId, outletId) || other.outletId == outletId)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.taxBps, taxBps) || other.taxBps == taxBps)&&(identical(other.serviceBps, serviceBps) || other.serviceBps == serviceBps)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,outletId,code,name,timeZone,locale,taxBps,serviceBps,address,phone);
}

@override
String toString() {
    return 'CatalogOutlet(outletId: $outletId, code: $code, name: $name, timeZone: $timeZone, locale: $locale, taxBps: $taxBps, serviceBps: $serviceBps, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$CatalogOutletCopyWith<$Res> implements $CatalogOutletCopyWith<$Res> {
  factory _$CatalogOutletCopyWith(_CatalogOutlet value, $Res Function(_CatalogOutlet) _then) = __$CatalogOutletCopyWithImpl;
@override @useResult
$Res call({
 String outletId, String code, String name, String timeZone, String locale, int taxBps, int serviceBps, String? address, String? phone
});




}
/// @nodoc
class __$CatalogOutletCopyWithImpl<$Res>
    implements _$CatalogOutletCopyWith<$Res> {
  __$CatalogOutletCopyWithImpl(this._self, this._then);

  final _CatalogOutlet _self;
  final $Res Function(_CatalogOutlet) _then;

/// Create a copy of CatalogOutlet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outletId = null,Object? code = null,Object? name = null,Object? timeZone = null,Object? locale = null,Object? taxBps = null,Object? serviceBps = null,Object? address = freezed,Object? phone = freezed,}) {
  return _then(_CatalogOutlet(
outletId: null == outletId ? _self.outletId : outletId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,taxBps: null == taxBps ? _self.taxBps : taxBps // ignore: cast_nullable_to_non_nullable
as int,serviceBps: null == serviceBps ? _self.serviceBps : serviceBps // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CatalogCategory {

 String get categoryId; String get name;/// How many of its menus are on sale.
 int get itemCount;/// An emoji, or null for the default one.
 String? get icon;
/// Create a copy of CatalogCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCategoryCopyWith<CatalogCategory> get copyWith => _$CatalogCategoryCopyWithImpl<CatalogCategory>(this as CatalogCategory, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatalogCategory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogCategory&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}


@override
int get hashCode {
  final _this = this as CatalogCategory;
  return Object.hash(runtimeType,_this.categoryId,_this.name,_this.itemCount,_this.icon);
}

@override
String toString() {
  final _this = this as CatalogCategory;
  return 'CatalogCategory(categoryId: ${_this.categoryId}, name: ${_this.name}, itemCount: ${_this.itemCount}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $CatalogCategoryCopyWith<$Res>  {
  factory $CatalogCategoryCopyWith(CatalogCategory value, $Res Function(CatalogCategory) _then) = _$CatalogCategoryCopyWithImpl;
@useResult
$Res call({
 String categoryId, String name, int itemCount, String? icon
});




}
/// @nodoc
class _$CatalogCategoryCopyWithImpl<$Res>
    implements $CatalogCategoryCopyWith<$Res> {
  _$CatalogCategoryCopyWithImpl(this._self, this._then);

  final CatalogCategory _self;
  final $Res Function(CatalogCategory) _then;

/// Create a copy of CatalogCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? name = null,Object? itemCount = null,Object? icon = freezed,}) {
  return _then(CatalogCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogCategory].
extension CatalogCategoryPatterns on CatalogCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogCategory value)  $default,){
final _that = this;
switch (_that) {
case _CatalogCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogCategory value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String categoryId,  String name,  int itemCount,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogCategory() when $default != null:
return $default(_that.categoryId,_that.name,_that.itemCount,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String categoryId,  String name,  int itemCount,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _CatalogCategory():
return $default(_that.categoryId,_that.name,_that.itemCount,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String categoryId,  String name,  int itemCount,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _CatalogCategory() when $default != null:
return $default(_that.categoryId,_that.name,_that.itemCount,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogCategory implements CatalogCategory {
  const _CatalogCategory({required this.categoryId, required this.name, required this.itemCount, this.icon});
  

@override final  String categoryId;
@override final  String name;
/// How many of its menus are on sale.
@override final  int itemCount;
/// An emoji, or null for the default one.
@override final  String? icon;

/// Create a copy of CatalogCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCategoryCopyWith<_CatalogCategory> get copyWith => __$CatalogCategoryCopyWithImpl<_CatalogCategory>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode {
    return Object.hash(runtimeType,categoryId,name,itemCount,icon);
}

@override
String toString() {
    return 'CatalogCategory(categoryId: $categoryId, name: $name, itemCount: $itemCount, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CatalogCategoryCopyWith<$Res> implements $CatalogCategoryCopyWith<$Res> {
  factory _$CatalogCategoryCopyWith(_CatalogCategory value, $Res Function(_CatalogCategory) _then) = __$CatalogCategoryCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String name, int itemCount, String? icon
});




}
/// @nodoc
class __$CatalogCategoryCopyWithImpl<$Res>
    implements _$CatalogCategoryCopyWith<$Res> {
  __$CatalogCategoryCopyWithImpl(this._self, this._then);

  final _CatalogCategory _self;
  final $Res Function(_CatalogCategory) _then;

/// Create a copy of CatalogCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? name = null,Object? itemCount = null,Object? icon = freezed,}) {
  return _then(_CatalogCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CatalogMenu {

 String get menuId; String get categoryId; String get name;/// Whole rupiah.
 int get price; bool get trackStock; StockLevel get stock; String? get sku;/// What is left, when the stock is tracked.
 int? get stockQty;
/// Create a copy of CatalogMenu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogMenuCopyWith<CatalogMenu> get copyWith => _$CatalogMenuCopyWithImpl<CatalogMenu>(this as CatalogMenu, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatalogMenu;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogMenu&&(identical(other.menuId, _this.menuId) || other.menuId == _this.menuId)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.trackStock, _this.trackStock) || other.trackStock == _this.trackStock)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.stockQty, _this.stockQty) || other.stockQty == _this.stockQty));
}


@override
int get hashCode {
  final _this = this as CatalogMenu;
  return Object.hash(runtimeType,_this.menuId,_this.categoryId,_this.name,_this.price,_this.trackStock,_this.stock,_this.sku,_this.stockQty);
}

@override
String toString() {
  final _this = this as CatalogMenu;
  return 'CatalogMenu(menuId: ${_this.menuId}, categoryId: ${_this.categoryId}, name: ${_this.name}, price: ${_this.price}, trackStock: ${_this.trackStock}, stock: ${_this.stock}, sku: ${_this.sku}, stockQty: ${_this.stockQty})';
}


}

/// @nodoc
abstract mixin class $CatalogMenuCopyWith<$Res>  {
  factory $CatalogMenuCopyWith(CatalogMenu value, $Res Function(CatalogMenu) _then) = _$CatalogMenuCopyWithImpl;
@useResult
$Res call({
 String menuId, String categoryId, String name, int price, bool trackStock, StockLevel stock, String? sku, int? stockQty
});




}
/// @nodoc
class _$CatalogMenuCopyWithImpl<$Res>
    implements $CatalogMenuCopyWith<$Res> {
  _$CatalogMenuCopyWithImpl(this._self, this._then);

  final CatalogMenu _self;
  final $Res Function(CatalogMenu) _then;

/// Create a copy of CatalogMenu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuId = null,Object? categoryId = null,Object? name = null,Object? price = null,Object? trackStock = null,Object? stock = null,Object? sku = freezed,Object? stockQty = freezed,}) {
  return _then(CatalogMenu(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,trackStock: null == trackStock ? _self.trackStock : trackStock // ignore: cast_nullable_to_non_nullable
as bool,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockLevel,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,stockQty: freezed == stockQty ? _self.stockQty : stockQty // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogMenu].
extension CatalogMenuPatterns on CatalogMenu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogMenu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogMenu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogMenu value)  $default,){
final _that = this;
switch (_that) {
case _CatalogMenu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogMenu value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogMenu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuId,  String categoryId,  String name,  int price,  bool trackStock,  StockLevel stock,  String? sku,  int? stockQty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogMenu() when $default != null:
return $default(_that.menuId,_that.categoryId,_that.name,_that.price,_that.trackStock,_that.stock,_that.sku,_that.stockQty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuId,  String categoryId,  String name,  int price,  bool trackStock,  StockLevel stock,  String? sku,  int? stockQty)  $default,) {final _that = this;
switch (_that) {
case _CatalogMenu():
return $default(_that.menuId,_that.categoryId,_that.name,_that.price,_that.trackStock,_that.stock,_that.sku,_that.stockQty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuId,  String categoryId,  String name,  int price,  bool trackStock,  StockLevel stock,  String? sku,  int? stockQty)?  $default,) {final _that = this;
switch (_that) {
case _CatalogMenu() when $default != null:
return $default(_that.menuId,_that.categoryId,_that.name,_that.price,_that.trackStock,_that.stock,_that.sku,_that.stockQty);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogMenu implements CatalogMenu {
  const _CatalogMenu({required this.menuId, required this.categoryId, required this.name, required this.price, required this.trackStock, required this.stock, this.sku, this.stockQty});
  

@override final  String menuId;
@override final  String categoryId;
@override final  String name;
/// Whole rupiah.
@override final  int price;
@override final  bool trackStock;
@override final  StockLevel stock;
@override final  String? sku;
/// What is left, when the stock is tracked.
@override final  int? stockQty;

/// Create a copy of CatalogMenu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogMenuCopyWith<_CatalogMenu> get copyWith => __$CatalogMenuCopyWithImpl<_CatalogMenu>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogMenu&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.trackStock, trackStock) || other.trackStock == trackStock)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.stockQty, stockQty) || other.stockQty == stockQty));
}


@override
int get hashCode {
    return Object.hash(runtimeType,menuId,categoryId,name,price,trackStock,stock,sku,stockQty);
}

@override
String toString() {
    return 'CatalogMenu(menuId: $menuId, categoryId: $categoryId, name: $name, price: $price, trackStock: $trackStock, stock: $stock, sku: $sku, stockQty: $stockQty)';
}


}

/// @nodoc
abstract mixin class _$CatalogMenuCopyWith<$Res> implements $CatalogMenuCopyWith<$Res> {
  factory _$CatalogMenuCopyWith(_CatalogMenu value, $Res Function(_CatalogMenu) _then) = __$CatalogMenuCopyWithImpl;
@override @useResult
$Res call({
 String menuId, String categoryId, String name, int price, bool trackStock, StockLevel stock, String? sku, int? stockQty
});




}
/// @nodoc
class __$CatalogMenuCopyWithImpl<$Res>
    implements _$CatalogMenuCopyWith<$Res> {
  __$CatalogMenuCopyWithImpl(this._self, this._then);

  final _CatalogMenu _self;
  final $Res Function(_CatalogMenu) _then;

/// Create a copy of CatalogMenu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuId = null,Object? categoryId = null,Object? name = null,Object? price = null,Object? trackStock = null,Object? stock = null,Object? sku = freezed,Object? stockQty = freezed,}) {
  return _then(_CatalogMenu(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,trackStock: null == trackStock ? _self.trackStock : trackStock // ignore: cast_nullable_to_non_nullable
as bool,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as StockLevel,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,stockQty: freezed == stockQty ? _self.stockQty : stockQty // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
