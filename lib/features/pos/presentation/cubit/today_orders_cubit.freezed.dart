// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_orders_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayOrdersState {

 String get search;
/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayOrdersStateCopyWith<TodayOrdersState> get copyWith => _$TodayOrdersStateCopyWithImpl<TodayOrdersState>(this as TodayOrdersState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TodayOrdersState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayOrdersState&&(identical(other.search, _this.search) || other.search == _this.search));
}


@override
int get hashCode {
  final _this = this as TodayOrdersState;
  return Object.hash(runtimeType,_this.search);
}

@override
String toString() {
  final _this = this as TodayOrdersState;
  return 'TodayOrdersState(search: ${_this.search})';
}


}

/// @nodoc
abstract mixin class $TodayOrdersStateCopyWith<$Res>  {
  factory $TodayOrdersStateCopyWith(TodayOrdersState value, $Res Function(TodayOrdersState) _then) = _$TodayOrdersStateCopyWithImpl;
@useResult
$Res call({
 String search
});




}
/// @nodoc
class _$TodayOrdersStateCopyWithImpl<$Res>
    implements $TodayOrdersStateCopyWith<$Res> {
  _$TodayOrdersStateCopyWithImpl(this._self, this._then);

  final TodayOrdersState _self;
  final $Res Function(TodayOrdersState) _then;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayOrdersState].
extension TodayOrdersStatePatterns on TodayOrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodayOrdersLoading value)?  loading,TResult Function( TodayOrdersReady value)?  ready,TResult Function( TodayOrdersFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodayOrdersLoading() when loading != null:
return loading(_that);case TodayOrdersReady() when ready != null:
return ready(_that);case TodayOrdersFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodayOrdersLoading value)  loading,required TResult Function( TodayOrdersReady value)  ready,required TResult Function( TodayOrdersFailed value)  failed,}){
final _that = this;
switch (_that) {
case TodayOrdersLoading():
return loading(_that);case TodayOrdersReady():
return ready(_that);case TodayOrdersFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodayOrdersLoading value)?  loading,TResult? Function( TodayOrdersReady value)?  ready,TResult? Function( TodayOrdersFailed value)?  failed,}){
final _that = this;
switch (_that) {
case TodayOrdersLoading() when loading != null:
return loading(_that);case TodayOrdersReady() when ready != null:
return ready(_that);case TodayOrdersFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String search)?  loading,TResult Function( String search,  List<OrderSummary> orders,  int total,  int pages,  bool loadingMore,  ApiException? moreError)?  ready,TResult Function( String search,  ApiException error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodayOrdersLoading() when loading != null:
return loading(_that.search);case TodayOrdersReady() when ready != null:
return ready(_that.search,_that.orders,_that.total,_that.pages,_that.loadingMore,_that.moreError);case TodayOrdersFailed() when failed != null:
return failed(_that.search,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String search)  loading,required TResult Function( String search,  List<OrderSummary> orders,  int total,  int pages,  bool loadingMore,  ApiException? moreError)  ready,required TResult Function( String search,  ApiException error)  failed,}) {final _that = this;
switch (_that) {
case TodayOrdersLoading():
return loading(_that.search);case TodayOrdersReady():
return ready(_that.search,_that.orders,_that.total,_that.pages,_that.loadingMore,_that.moreError);case TodayOrdersFailed():
return failed(_that.search,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String search)?  loading,TResult? Function( String search,  List<OrderSummary> orders,  int total,  int pages,  bool loadingMore,  ApiException? moreError)?  ready,TResult? Function( String search,  ApiException error)?  failed,}) {final _that = this;
switch (_that) {
case TodayOrdersLoading() when loading != null:
return loading(_that.search);case TodayOrdersReady() when ready != null:
return ready(_that.search,_that.orders,_that.total,_that.pages,_that.loadingMore,_that.moreError);case TodayOrdersFailed() when failed != null:
return failed(_that.search,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class TodayOrdersLoading implements TodayOrdersState {
  const TodayOrdersLoading({this.search = ''});
  

@override@JsonKey() final  String search;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayOrdersLoadingCopyWith<TodayOrdersLoading> get copyWith => _$TodayOrdersLoadingCopyWithImpl<TodayOrdersLoading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayOrdersLoading&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode {
    return Object.hash(runtimeType,search);
}

@override
String toString() {
    return 'TodayOrdersState.loading(search: $search)';
}


}

/// @nodoc
abstract mixin class $TodayOrdersLoadingCopyWith<$Res> implements $TodayOrdersStateCopyWith<$Res> {
  factory $TodayOrdersLoadingCopyWith(TodayOrdersLoading value, $Res Function(TodayOrdersLoading) _then) = _$TodayOrdersLoadingCopyWithImpl;
@override @useResult
$Res call({
 String search
});




}
/// @nodoc
class _$TodayOrdersLoadingCopyWithImpl<$Res>
    implements $TodayOrdersLoadingCopyWith<$Res> {
  _$TodayOrdersLoadingCopyWithImpl(this._self, this._then);

  final TodayOrdersLoading _self;
  final $Res Function(TodayOrdersLoading) _then;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,}) {
  return _then(TodayOrdersLoading(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TodayOrdersReady implements TodayOrdersState {
  const TodayOrdersReady({required this.search, required  List<OrderSummary> orders, required this.total, this.pages = 1, this.loadingMore = false, this.moreError}): _orders = orders;
  

@override final  String search;
 final  List<OrderSummary> _orders;
 List<OrderSummary> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

 final  int total;
@JsonKey() final  int pages;
@JsonKey() final  bool loadingMore;
/// Why the next page didn't load.
 final  ApiException? moreError;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayOrdersReadyCopyWith<TodayOrdersReady> get copyWith => _$TodayOrdersReadyCopyWithImpl<TodayOrdersReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayOrdersReady&&(identical(other.search, search) || other.search == search)&&const DeepCollectionEquality().equals(other.orders, _orders)&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.loadingMore, loadingMore) || other.loadingMore == loadingMore)&&(identical(other.moreError, moreError) || other.moreError == moreError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,search,const DeepCollectionEquality().hash(_orders),total,pages,loadingMore,moreError);
}

@override
String toString() {
    return 'TodayOrdersState.ready(search: $search, orders: $orders, total: $total, pages: $pages, loadingMore: $loadingMore, moreError: $moreError)';
}


}

/// @nodoc
abstract mixin class $TodayOrdersReadyCopyWith<$Res> implements $TodayOrdersStateCopyWith<$Res> {
  factory $TodayOrdersReadyCopyWith(TodayOrdersReady value, $Res Function(TodayOrdersReady) _then) = _$TodayOrdersReadyCopyWithImpl;
@override @useResult
$Res call({
 String search, List<OrderSummary> orders, int total, int pages, bool loadingMore, ApiException? moreError
});




}
/// @nodoc
class _$TodayOrdersReadyCopyWithImpl<$Res>
    implements $TodayOrdersReadyCopyWith<$Res> {
  _$TodayOrdersReadyCopyWithImpl(this._self, this._then);

  final TodayOrdersReady _self;
  final $Res Function(TodayOrdersReady) _then;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? orders = null,Object? total = null,Object? pages = null,Object? loadingMore = null,Object? moreError = freezed,}) {
  return _then(TodayOrdersReady(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderSummary>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,loadingMore: null == loadingMore ? _self.loadingMore : loadingMore // ignore: cast_nullable_to_non_nullable
as bool,moreError: freezed == moreError ? _self.moreError : moreError // ignore: cast_nullable_to_non_nullable
as ApiException?,
  ));
}


}

/// @nodoc


class TodayOrdersFailed implements TodayOrdersState {
  const TodayOrdersFailed({required this.search, required this.error});
  

@override final  String search;
 final  ApiException error;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayOrdersFailedCopyWith<TodayOrdersFailed> get copyWith => _$TodayOrdersFailedCopyWithImpl<TodayOrdersFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayOrdersFailed&&(identical(other.search, search) || other.search == search)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,search,error);
}

@override
String toString() {
    return 'TodayOrdersState.failed(search: $search, error: $error)';
}


}

/// @nodoc
abstract mixin class $TodayOrdersFailedCopyWith<$Res> implements $TodayOrdersStateCopyWith<$Res> {
  factory $TodayOrdersFailedCopyWith(TodayOrdersFailed value, $Res Function(TodayOrdersFailed) _then) = _$TodayOrdersFailedCopyWithImpl;
@override @useResult
$Res call({
 String search, ApiException error
});




}
/// @nodoc
class _$TodayOrdersFailedCopyWithImpl<$Res>
    implements $TodayOrdersFailedCopyWith<$Res> {
  _$TodayOrdersFailedCopyWithImpl(this._self, this._then);

  final TodayOrdersFailed _self;
  final $Res Function(TodayOrdersFailed) _then;

/// Create a copy of TodayOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? error = null,}) {
  return _then(TodayOrdersFailed(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
