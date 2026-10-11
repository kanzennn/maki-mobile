// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CatalogState()';
}


}

/// @nodoc
class $CatalogStateCopyWith<$Res>  {
$CatalogStateCopyWith(CatalogState _, $Res Function(CatalogState) __);
}


/// Adds pattern-matching-related methods to [CatalogState].
extension CatalogStatePatterns on CatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CatalogLoading value)?  loading,TResult Function( CatalogReady value)?  ready,TResult Function( CatalogFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading(_that);case CatalogReady() when ready != null:
return ready(_that);case CatalogFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CatalogLoading value)  loading,required TResult Function( CatalogReady value)  ready,required TResult Function( CatalogFailed value)  failed,}){
final _that = this;
switch (_that) {
case CatalogLoading():
return loading(_that);case CatalogReady():
return ready(_that);case CatalogFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CatalogLoading value)?  loading,TResult? Function( CatalogReady value)?  ready,TResult? Function( CatalogFailed value)?  failed,}){
final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading(_that);case CatalogReady() when ready != null:
return ready(_that);case CatalogFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Catalog catalog)?  ready,TResult Function( ApiException error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading();case CatalogReady() when ready != null:
return ready(_that.catalog);case CatalogFailed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Catalog catalog)  ready,required TResult Function( ApiException error)  failed,}) {final _that = this;
switch (_that) {
case CatalogLoading():
return loading();case CatalogReady():
return ready(_that.catalog);case CatalogFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Catalog catalog)?  ready,TResult? Function( ApiException error)?  failed,}) {final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading();case CatalogReady() when ready != null:
return ready(_that.catalog);case CatalogFailed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CatalogLoading implements CatalogState {
  const CatalogLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CatalogState.loading()';
}


}




/// @nodoc


class CatalogReady implements CatalogState {
  const CatalogReady(this.catalog);
  

 final  Catalog catalog;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogReadyCopyWith<CatalogReady> get copyWith => _$CatalogReadyCopyWithImpl<CatalogReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogReady&&(identical(other.catalog, catalog) || other.catalog == catalog));
}


@override
int get hashCode {
    return Object.hash(runtimeType,catalog);
}

@override
String toString() {
    return 'CatalogState.ready(catalog: $catalog)';
}


}

/// @nodoc
abstract mixin class $CatalogReadyCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogReadyCopyWith(CatalogReady value, $Res Function(CatalogReady) _then) = _$CatalogReadyCopyWithImpl;
@useResult
$Res call({
 Catalog catalog
});


$CatalogCopyWith<$Res> get catalog;

}
/// @nodoc
class _$CatalogReadyCopyWithImpl<$Res>
    implements $CatalogReadyCopyWith<$Res> {
  _$CatalogReadyCopyWithImpl(this._self, this._then);

  final CatalogReady _self;
  final $Res Function(CatalogReady) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? catalog = null,}) {
  return _then(CatalogReady(
null == catalog ? _self.catalog : catalog // ignore: cast_nullable_to_non_nullable
as Catalog,
  ));
}

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCopyWith<$Res> get catalog {
  
  return $CatalogCopyWith<$Res>(_self.catalog, (value) {
    return _then(_self.copyWith(catalog: value));
  });
}
}

/// @nodoc


class CatalogFailed implements CatalogState {
  const CatalogFailed(this.error);
  

 final  ApiException error;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogFailedCopyWith<CatalogFailed> get copyWith => _$CatalogFailedCopyWithImpl<CatalogFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'CatalogState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $CatalogFailedCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogFailedCopyWith(CatalogFailed value, $Res Function(CatalogFailed) _then) = _$CatalogFailedCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$CatalogFailedCopyWithImpl<$Res>
    implements $CatalogFailedCopyWith<$Res> {
  _$CatalogFailedCopyWithImpl(this._self, this._then);

  final CatalogFailed _self;
  final $Res Function(CatalogFailed) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CatalogFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
