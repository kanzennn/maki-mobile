// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OrderLoading value)?  loading,TResult Function( OrderReady value)?  ready,TResult Function( OrderFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OrderLoading() when loading != null:
return loading(_that);case OrderReady() when ready != null:
return ready(_that);case OrderFailed() when failed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OrderLoading value)  loading,required TResult Function( OrderReady value)  ready,required TResult Function( OrderFailed value)  failed,}){
final _that = this;
switch (_that) {
case OrderLoading():
return loading(_that);case OrderReady():
return ready(_that);case OrderFailed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OrderLoading value)?  loading,TResult? Function( OrderReady value)?  ready,TResult? Function( OrderFailed value)?  failed,}){
final _that = this;
switch (_that) {
case OrderLoading() when loading != null:
return loading(_that);case OrderReady() when ready != null:
return ready(_that);case OrderFailed() when failed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Order order,  bool voiding,  ApiException? voidError)?  ready,TResult Function( ApiException error)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OrderLoading() when loading != null:
return loading();case OrderReady() when ready != null:
return ready(_that.order,_that.voiding,_that.voidError);case OrderFailed() when failed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Order order,  bool voiding,  ApiException? voidError)  ready,required TResult Function( ApiException error)  failed,}) {final _that = this;
switch (_that) {
case OrderLoading():
return loading();case OrderReady():
return ready(_that.order,_that.voiding,_that.voidError);case OrderFailed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Order order,  bool voiding,  ApiException? voidError)?  ready,TResult? Function( ApiException error)?  failed,}) {final _that = this;
switch (_that) {
case OrderLoading() when loading != null:
return loading();case OrderReady() when ready != null:
return ready(_that.order,_that.voiding,_that.voidError);case OrderFailed() when failed != null:
return failed(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class OrderLoading implements OrderState {
  const OrderLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OrderState.loading()';
}


}




/// @nodoc


class OrderReady implements OrderState {
  const OrderReady(this.order, {this.voiding = false, this.voidError});
  

 final  Order order;
@JsonKey() final  bool voiding;
 final  ApiException? voidError;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderReadyCopyWith<OrderReady> get copyWith => _$OrderReadyCopyWithImpl<OrderReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderReady&&(identical(other.order, order) || other.order == order)&&(identical(other.voiding, voiding) || other.voiding == voiding)&&(identical(other.voidError, voidError) || other.voidError == voidError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,order,voiding,voidError);
}

@override
String toString() {
    return 'OrderState.ready(order: $order, voiding: $voiding, voidError: $voidError)';
}


}

/// @nodoc
abstract mixin class $OrderReadyCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderReadyCopyWith(OrderReady value, $Res Function(OrderReady) _then) = _$OrderReadyCopyWithImpl;
@useResult
$Res call({
 Order order, bool voiding, ApiException? voidError
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class _$OrderReadyCopyWithImpl<$Res>
    implements $OrderReadyCopyWith<$Res> {
  _$OrderReadyCopyWithImpl(this._self, this._then);

  final OrderReady _self;
  final $Res Function(OrderReady) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,Object? voiding = null,Object? voidError = freezed,}) {
  return _then(OrderReady(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,voiding: null == voiding ? _self.voiding : voiding // ignore: cast_nullable_to_non_nullable
as bool,voidError: freezed == voidError ? _self.voidError : voidError // ignore: cast_nullable_to_non_nullable
as ApiException?,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class OrderFailed implements OrderState {
  const OrderFailed(this.error);
  

 final  ApiException error;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderFailedCopyWith<OrderFailed> get copyWith => _$OrderFailedCopyWithImpl<OrderFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'OrderState.failed(error: $error)';
}


}

/// @nodoc
abstract mixin class $OrderFailedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory $OrderFailedCopyWith(OrderFailed value, $Res Function(OrderFailed) _then) = _$OrderFailedCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$OrderFailedCopyWithImpl<$Res>
    implements $OrderFailedCopyWith<$Res> {
  _$OrderFailedCopyWithImpl(this._self, this._then);

  final OrderFailed _self;
  final $Res Function(OrderFailed) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(OrderFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
