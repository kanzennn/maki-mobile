// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaleState {

 OrderType get type; List<cart.CartLine> get lines;/// The voucher the customer gave, one per order, as the server checked
/// it: its discount is worked out again from its terms as the cart
/// changes.
 Voucher? get voucher;/// A code is being checked.
 bool get checkingVoucher;/// Why the code just typed was refused, until the next try.
 ApiException? get voucherError;/// The table a dine-in order is for, if the cashier picked one: always
/// optional, and never a takeaway's.
 OrderTable? get table;/// The number on the stand a dine-in customer took, as the cashier
/// types it, where the outlet seats its customers by number stands;
/// empty for none, and always a takeaway's.
 String get standNumber;/// The order on its way, or sent without an answer: it may have been
/// taken, so it is sent again exactly as it was, and the cart can't
/// change until it is settled.
 NewOrder? get pending;/// The order is on its way.
 bool get sending;/// What the cashier is told: what following the catalog changed in the
/// order, or why a sale was refused. Kept until dismissed.
 List<SaleNotice> get notices;/// The sale just taken, until the cashier turns to the next customer:
/// its receipt and its change.
 Order? get sold;/// The last refusal: what it names loads again.
 ApiException? get refused;
/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleStateCopyWith<SaleState> get copyWith => _$SaleStateCopyWithImpl<SaleState>(this as SaleState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SaleState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleState&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.voucher, _this.voucher) || other.voucher == _this.voucher)&&(identical(other.checkingVoucher, _this.checkingVoucher) || other.checkingVoucher == _this.checkingVoucher)&&(identical(other.voucherError, _this.voucherError) || other.voucherError == _this.voucherError)&&(identical(other.table, _this.table) || other.table == _this.table)&&(identical(other.standNumber, _this.standNumber) || other.standNumber == _this.standNumber)&&(identical(other.pending, _this.pending) || other.pending == _this.pending)&&(identical(other.sending, _this.sending) || other.sending == _this.sending)&&const DeepCollectionEquality().equals(other.notices, _this.notices)&&(identical(other.sold, _this.sold) || other.sold == _this.sold)&&(identical(other.refused, _this.refused) || other.refused == _this.refused));
}


@override
int get hashCode {
  final _this = this as SaleState;
  return Object.hash(runtimeType,_this.type,const DeepCollectionEquality().hash(_this.lines),_this.voucher,_this.checkingVoucher,_this.voucherError,_this.table,_this.standNumber,_this.pending,_this.sending,const DeepCollectionEquality().hash(_this.notices),_this.sold,_this.refused);
}

@override
String toString() {
  final _this = this as SaleState;
  return 'SaleState(type: ${_this.type}, lines: ${_this.lines}, voucher: ${_this.voucher}, checkingVoucher: ${_this.checkingVoucher}, voucherError: ${_this.voucherError}, table: ${_this.table}, standNumber: ${_this.standNumber}, pending: ${_this.pending}, sending: ${_this.sending}, notices: ${_this.notices}, sold: ${_this.sold}, refused: ${_this.refused})';
}


}

/// @nodoc
abstract mixin class $SaleStateCopyWith<$Res>  {
  factory $SaleStateCopyWith(SaleState value, $Res Function(SaleState) _then) = _$SaleStateCopyWithImpl;
@useResult
$Res call({
 OrderType type, List<cart.CartLine> lines, Voucher? voucher, bool checkingVoucher, ApiException? voucherError, OrderTable? table, String standNumber, NewOrder? pending, bool sending, List<SaleNotice> notices, Order? sold, ApiException? refused
});


$VoucherCopyWith<$Res>? get voucher;$OrderTableCopyWith<$Res>? get table;$NewOrderCopyWith<$Res>? get pending;$OrderCopyWith<$Res>? get sold;

}
/// @nodoc
class _$SaleStateCopyWithImpl<$Res>
    implements $SaleStateCopyWith<$Res> {
  _$SaleStateCopyWithImpl(this._self, this._then);

  final SaleState _self;
  final $Res Function(SaleState) _then;

/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? lines = null,Object? voucher = freezed,Object? checkingVoucher = null,Object? voucherError = freezed,Object? table = freezed,Object? standNumber = null,Object? pending = freezed,Object? sending = null,Object? notices = null,Object? sold = freezed,Object? refused = freezed,}) {
  return _then(SaleState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<cart.CartLine>,voucher: freezed == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as Voucher?,checkingVoucher: null == checkingVoucher ? _self.checkingVoucher : checkingVoucher // ignore: cast_nullable_to_non_nullable
as bool,voucherError: freezed == voucherError ? _self.voucherError : voucherError // ignore: cast_nullable_to_non_nullable
as ApiException?,table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as OrderTable?,standNumber: null == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as NewOrder?,sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as bool,notices: null == notices ? _self.notices : notices // ignore: cast_nullable_to_non_nullable
as List<SaleNotice>,sold: freezed == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as Order?,refused: freezed == refused ? _self.refused : refused // ignore: cast_nullable_to_non_nullable
as ApiException?,
  ));
}
/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherCopyWith<$Res>? get voucher {
    if (_self.voucher == null) {
    return null;
  }

  return $VoucherCopyWith<$Res>(_self.voucher!, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTableCopyWith<$Res>? get table {
    if (_self.table == null) {
    return null;
  }

  return $OrderTableCopyWith<$Res>(_self.table!, (value) {
    return _then(_self.copyWith(table: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewOrderCopyWith<$Res>? get pending {
    if (_self.pending == null) {
    return null;
  }

  return $NewOrderCopyWith<$Res>(_self.pending!, (value) {
    return _then(_self.copyWith(pending: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get sold {
    if (_self.sold == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.sold!, (value) {
    return _then(_self.copyWith(sold: value));
  });
}
}


/// Adds pattern-matching-related methods to [SaleState].
extension SaleStatePatterns on SaleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleState value)  $default,){
final _that = this;
switch (_that) {
case _SaleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleState value)?  $default,){
final _that = this;
switch (_that) {
case _SaleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderType type,  List<cart.CartLine> lines,  Voucher? voucher,  bool checkingVoucher,  ApiException? voucherError,  OrderTable? table,  String standNumber,  NewOrder? pending,  bool sending,  List<SaleNotice> notices,  Order? sold,  ApiException? refused)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleState() when $default != null:
return $default(_that.type,_that.lines,_that.voucher,_that.checkingVoucher,_that.voucherError,_that.table,_that.standNumber,_that.pending,_that.sending,_that.notices,_that.sold,_that.refused);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderType type,  List<cart.CartLine> lines,  Voucher? voucher,  bool checkingVoucher,  ApiException? voucherError,  OrderTable? table,  String standNumber,  NewOrder? pending,  bool sending,  List<SaleNotice> notices,  Order? sold,  ApiException? refused)  $default,) {final _that = this;
switch (_that) {
case _SaleState():
return $default(_that.type,_that.lines,_that.voucher,_that.checkingVoucher,_that.voucherError,_that.table,_that.standNumber,_that.pending,_that.sending,_that.notices,_that.sold,_that.refused);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderType type,  List<cart.CartLine> lines,  Voucher? voucher,  bool checkingVoucher,  ApiException? voucherError,  OrderTable? table,  String standNumber,  NewOrder? pending,  bool sending,  List<SaleNotice> notices,  Order? sold,  ApiException? refused)?  $default,) {final _that = this;
switch (_that) {
case _SaleState() when $default != null:
return $default(_that.type,_that.lines,_that.voucher,_that.checkingVoucher,_that.voucherError,_that.table,_that.standNumber,_that.pending,_that.sending,_that.notices,_that.sold,_that.refused);case _:
  return null;

}
}

}

/// @nodoc


class _SaleState extends SaleState {
  const _SaleState({this.type = OrderType.dineIn,  List<cart.CartLine> lines = const <CartLine>[], this.voucher, this.checkingVoucher = false, this.voucherError, this.table, this.standNumber = '', this.pending, this.sending = false,  List<SaleNotice> notices = const <SaleNotice>[], this.sold, this.refused}): _lines = lines,_notices = notices,super._();
  

@override@JsonKey() final  OrderType type;
 final  List<cart.CartLine> _lines;
@override@JsonKey() List<cart.CartLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

/// The voucher the customer gave, one per order, as the server checked
/// it: its discount is worked out again from its terms as the cart
/// changes.
@override final  Voucher? voucher;
/// A code is being checked.
@override@JsonKey() final  bool checkingVoucher;
/// Why the code just typed was refused, until the next try.
@override final  ApiException? voucherError;
/// The table a dine-in order is for, if the cashier picked one: always
/// optional, and never a takeaway's.
@override final  OrderTable? table;
/// The number on the stand a dine-in customer took, as the cashier
/// types it, where the outlet seats its customers by number stands;
/// empty for none, and always a takeaway's.
@override@JsonKey() final  String standNumber;
/// The order on its way, or sent without an answer: it may have been
/// taken, so it is sent again exactly as it was, and the cart can't
/// change until it is settled.
@override final  NewOrder? pending;
/// The order is on its way.
@override@JsonKey() final  bool sending;
/// What the cashier is told: what following the catalog changed in the
/// order, or why a sale was refused. Kept until dismissed.
 final  List<SaleNotice> _notices;
/// What the cashier is told: what following the catalog changed in the
/// order, or why a sale was refused. Kept until dismissed.
@override@JsonKey() List<SaleNotice> get notices {
  if (_notices is EqualUnmodifiableListView) return _notices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notices);
}

/// The sale just taken, until the cashier turns to the next customer:
/// its receipt and its change.
@override final  Order? sold;
/// The last refusal: what it names loads again.
@override final  ApiException? refused;

/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleStateCopyWith<_SaleState> get copyWith => __$SaleStateCopyWithImpl<_SaleState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleState&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.voucher, voucher) || other.voucher == voucher)&&(identical(other.checkingVoucher, checkingVoucher) || other.checkingVoucher == checkingVoucher)&&(identical(other.voucherError, voucherError) || other.voucherError == voucherError)&&(identical(other.table, table) || other.table == table)&&(identical(other.standNumber, standNumber) || other.standNumber == standNumber)&&(identical(other.pending, pending) || other.pending == pending)&&(identical(other.sending, sending) || other.sending == sending)&&const DeepCollectionEquality().equals(other.notices, _notices)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.refused, refused) || other.refused == refused));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_lines),voucher,checkingVoucher,voucherError,table,standNumber,pending,sending,const DeepCollectionEquality().hash(_notices),sold,refused);
}

@override
String toString() {
    return 'SaleState(type: $type, lines: $lines, voucher: $voucher, checkingVoucher: $checkingVoucher, voucherError: $voucherError, table: $table, standNumber: $standNumber, pending: $pending, sending: $sending, notices: $notices, sold: $sold, refused: $refused)';
}


}

/// @nodoc
abstract mixin class _$SaleStateCopyWith<$Res> implements $SaleStateCopyWith<$Res> {
  factory _$SaleStateCopyWith(_SaleState value, $Res Function(_SaleState) _then) = __$SaleStateCopyWithImpl;
@override @useResult
$Res call({
 OrderType type, List<cart.CartLine> lines, Voucher? voucher, bool checkingVoucher, ApiException? voucherError, OrderTable? table, String standNumber, NewOrder? pending, bool sending, List<SaleNotice> notices, Order? sold, ApiException? refused
});


@override $VoucherCopyWith<$Res>? get voucher;@override $OrderTableCopyWith<$Res>? get table;@override $NewOrderCopyWith<$Res>? get pending;@override $OrderCopyWith<$Res>? get sold;

}
/// @nodoc
class __$SaleStateCopyWithImpl<$Res>
    implements _$SaleStateCopyWith<$Res> {
  __$SaleStateCopyWithImpl(this._self, this._then);

  final _SaleState _self;
  final $Res Function(_SaleState) _then;

/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? lines = null,Object? voucher = freezed,Object? checkingVoucher = null,Object? voucherError = freezed,Object? table = freezed,Object? standNumber = null,Object? pending = freezed,Object? sending = null,Object? notices = null,Object? sold = freezed,Object? refused = freezed,}) {
  return _then(_SaleState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<cart.CartLine>,voucher: freezed == voucher ? _self.voucher : voucher // ignore: cast_nullable_to_non_nullable
as Voucher?,checkingVoucher: null == checkingVoucher ? _self.checkingVoucher : checkingVoucher // ignore: cast_nullable_to_non_nullable
as bool,voucherError: freezed == voucherError ? _self.voucherError : voucherError // ignore: cast_nullable_to_non_nullable
as ApiException?,table: freezed == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as OrderTable?,standNumber: null == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String,pending: freezed == pending ? _self.pending : pending // ignore: cast_nullable_to_non_nullable
as NewOrder?,sending: null == sending ? _self.sending : sending // ignore: cast_nullable_to_non_nullable
as bool,notices: null == notices ? _self._notices : notices // ignore: cast_nullable_to_non_nullable
as List<SaleNotice>,sold: freezed == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as Order?,refused: freezed == refused ? _self.refused : refused // ignore: cast_nullable_to_non_nullable
as ApiException?,
  ));
}

/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoucherCopyWith<$Res>? get voucher {
    if (_self.voucher == null) {
    return null;
  }

  return $VoucherCopyWith<$Res>(_self.voucher!, (value) {
    return _then(_self.copyWith(voucher: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTableCopyWith<$Res>? get table {
    if (_self.table == null) {
    return null;
  }

  return $OrderTableCopyWith<$Res>(_self.table!, (value) {
    return _then(_self.copyWith(table: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewOrderCopyWith<$Res>? get pending {
    if (_self.pending == null) {
    return null;
  }

  return $NewOrderCopyWith<$Res>(_self.pending!, (value) {
    return _then(_self.copyWith(pending: value));
  });
}/// Create a copy of SaleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get sold {
    if (_self.sold == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.sold!, (value) {
    return _then(_self.copyWith(sold: value));
  });
}
}

/// @nodoc
mixin _$SaleNotice {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice()';
}


}

/// @nodoc
class $SaleNoticeCopyWith<$Res>  {
$SaleNoticeCopyWith(SaleNotice _, $Res Function(SaleNotice) __);
}


/// Adds pattern-matching-related methods to [SaleNotice].
extension SaleNoticePatterns on SaleNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnavailableNotice value)?  unavailable,TResult Function( StockCutNotice value)?  stockCut,TResult Function( PricesChangedNotice value)?  pricesChanged,TResult Function( TotalChangedNotice value)?  totalChanged,TResult Function( MethodUnavailableNotice value)?  methodUnavailable,TResult Function( CheckNotice value)?  check,TResult Function( ClockNotice value)?  clock,TResult Function( AbandonedNotice value)?  abandoned,TResult Function( VoucherRemovedNotice value)?  voucherRemoved,TResult Function( TableRemovedNotice value)?  tableRemoved,TResult Function( TableDroppedNotice value)?  tableDropped,TResult Function( StandDroppedNotice value)?  standDropped,TResult Function( NowNumberNotice value)?  nowNumber,TResult Function( ErrorNotice value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnavailableNotice() when unavailable != null:
return unavailable(_that);case StockCutNotice() when stockCut != null:
return stockCut(_that);case PricesChangedNotice() when pricesChanged != null:
return pricesChanged(_that);case TotalChangedNotice() when totalChanged != null:
return totalChanged(_that);case MethodUnavailableNotice() when methodUnavailable != null:
return methodUnavailable(_that);case CheckNotice() when check != null:
return check(_that);case ClockNotice() when clock != null:
return clock(_that);case AbandonedNotice() when abandoned != null:
return abandoned(_that);case VoucherRemovedNotice() when voucherRemoved != null:
return voucherRemoved(_that);case TableRemovedNotice() when tableRemoved != null:
return tableRemoved(_that);case TableDroppedNotice() when tableDropped != null:
return tableDropped(_that);case StandDroppedNotice() when standDropped != null:
return standDropped(_that);case NowNumberNotice() when nowNumber != null:
return nowNumber(_that);case ErrorNotice() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnavailableNotice value)  unavailable,required TResult Function( StockCutNotice value)  stockCut,required TResult Function( PricesChangedNotice value)  pricesChanged,required TResult Function( TotalChangedNotice value)  totalChanged,required TResult Function( MethodUnavailableNotice value)  methodUnavailable,required TResult Function( CheckNotice value)  check,required TResult Function( ClockNotice value)  clock,required TResult Function( AbandonedNotice value)  abandoned,required TResult Function( VoucherRemovedNotice value)  voucherRemoved,required TResult Function( TableRemovedNotice value)  tableRemoved,required TResult Function( TableDroppedNotice value)  tableDropped,required TResult Function( StandDroppedNotice value)  standDropped,required TResult Function( NowNumberNotice value)  nowNumber,required TResult Function( ErrorNotice value)  error,}){
final _that = this;
switch (_that) {
case UnavailableNotice():
return unavailable(_that);case StockCutNotice():
return stockCut(_that);case PricesChangedNotice():
return pricesChanged(_that);case TotalChangedNotice():
return totalChanged(_that);case MethodUnavailableNotice():
return methodUnavailable(_that);case CheckNotice():
return check(_that);case ClockNotice():
return clock(_that);case AbandonedNotice():
return abandoned(_that);case VoucherRemovedNotice():
return voucherRemoved(_that);case TableRemovedNotice():
return tableRemoved(_that);case TableDroppedNotice():
return tableDropped(_that);case StandDroppedNotice():
return standDropped(_that);case NowNumberNotice():
return nowNumber(_that);case ErrorNotice():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnavailableNotice value)?  unavailable,TResult? Function( StockCutNotice value)?  stockCut,TResult? Function( PricesChangedNotice value)?  pricesChanged,TResult? Function( TotalChangedNotice value)?  totalChanged,TResult? Function( MethodUnavailableNotice value)?  methodUnavailable,TResult? Function( CheckNotice value)?  check,TResult? Function( ClockNotice value)?  clock,TResult? Function( AbandonedNotice value)?  abandoned,TResult? Function( VoucherRemovedNotice value)?  voucherRemoved,TResult? Function( TableRemovedNotice value)?  tableRemoved,TResult? Function( TableDroppedNotice value)?  tableDropped,TResult? Function( StandDroppedNotice value)?  standDropped,TResult? Function( NowNumberNotice value)?  nowNumber,TResult? Function( ErrorNotice value)?  error,}){
final _that = this;
switch (_that) {
case UnavailableNotice() when unavailable != null:
return unavailable(_that);case StockCutNotice() when stockCut != null:
return stockCut(_that);case PricesChangedNotice() when pricesChanged != null:
return pricesChanged(_that);case TotalChangedNotice() when totalChanged != null:
return totalChanged(_that);case MethodUnavailableNotice() when methodUnavailable != null:
return methodUnavailable(_that);case CheckNotice() when check != null:
return check(_that);case ClockNotice() when clock != null:
return clock(_that);case AbandonedNotice() when abandoned != null:
return abandoned(_that);case VoucherRemovedNotice() when voucherRemoved != null:
return voucherRemoved(_that);case TableRemovedNotice() when tableRemoved != null:
return tableRemoved(_that);case TableDroppedNotice() when tableDropped != null:
return tableDropped(_that);case StandDroppedNotice() when standDropped != null:
return standDropped(_that);case NowNumberNotice() when nowNumber != null:
return nowNumber(_that);case ErrorNotice() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> names)?  unavailable,TResult Function( List<String> names)?  stockCut,TResult Function( List<String> names)?  pricesChanged,TResult Function()?  totalChanged,TResult Function()?  methodUnavailable,TResult Function()?  check,TResult Function()?  clock,TResult Function()?  abandoned,TResult Function( String code,  ApiException error)?  voucherRemoved,TResult Function( String name,  ApiException error)?  tableRemoved,TResult Function( String name)?  tableDropped,TResult Function( String number)?  standDropped,TResult Function()?  nowNumber,TResult Function( ApiException error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnavailableNotice() when unavailable != null:
return unavailable(_that.names);case StockCutNotice() when stockCut != null:
return stockCut(_that.names);case PricesChangedNotice() when pricesChanged != null:
return pricesChanged(_that.names);case TotalChangedNotice() when totalChanged != null:
return totalChanged();case MethodUnavailableNotice() when methodUnavailable != null:
return methodUnavailable();case CheckNotice() when check != null:
return check();case ClockNotice() when clock != null:
return clock();case AbandonedNotice() when abandoned != null:
return abandoned();case VoucherRemovedNotice() when voucherRemoved != null:
return voucherRemoved(_that.code,_that.error);case TableRemovedNotice() when tableRemoved != null:
return tableRemoved(_that.name,_that.error);case TableDroppedNotice() when tableDropped != null:
return tableDropped(_that.name);case StandDroppedNotice() when standDropped != null:
return standDropped(_that.number);case NowNumberNotice() when nowNumber != null:
return nowNumber();case ErrorNotice() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> names)  unavailable,required TResult Function( List<String> names)  stockCut,required TResult Function( List<String> names)  pricesChanged,required TResult Function()  totalChanged,required TResult Function()  methodUnavailable,required TResult Function()  check,required TResult Function()  clock,required TResult Function()  abandoned,required TResult Function( String code,  ApiException error)  voucherRemoved,required TResult Function( String name,  ApiException error)  tableRemoved,required TResult Function( String name)  tableDropped,required TResult Function( String number)  standDropped,required TResult Function()  nowNumber,required TResult Function( ApiException error)  error,}) {final _that = this;
switch (_that) {
case UnavailableNotice():
return unavailable(_that.names);case StockCutNotice():
return stockCut(_that.names);case PricesChangedNotice():
return pricesChanged(_that.names);case TotalChangedNotice():
return totalChanged();case MethodUnavailableNotice():
return methodUnavailable();case CheckNotice():
return check();case ClockNotice():
return clock();case AbandonedNotice():
return abandoned();case VoucherRemovedNotice():
return voucherRemoved(_that.code,_that.error);case TableRemovedNotice():
return tableRemoved(_that.name,_that.error);case TableDroppedNotice():
return tableDropped(_that.name);case StandDroppedNotice():
return standDropped(_that.number);case NowNumberNotice():
return nowNumber();case ErrorNotice():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> names)?  unavailable,TResult? Function( List<String> names)?  stockCut,TResult? Function( List<String> names)?  pricesChanged,TResult? Function()?  totalChanged,TResult? Function()?  methodUnavailable,TResult? Function()?  check,TResult? Function()?  clock,TResult? Function()?  abandoned,TResult? Function( String code,  ApiException error)?  voucherRemoved,TResult? Function( String name,  ApiException error)?  tableRemoved,TResult? Function( String name)?  tableDropped,TResult? Function( String number)?  standDropped,TResult? Function()?  nowNumber,TResult? Function( ApiException error)?  error,}) {final _that = this;
switch (_that) {
case UnavailableNotice() when unavailable != null:
return unavailable(_that.names);case StockCutNotice() when stockCut != null:
return stockCut(_that.names);case PricesChangedNotice() when pricesChanged != null:
return pricesChanged(_that.names);case TotalChangedNotice() when totalChanged != null:
return totalChanged();case MethodUnavailableNotice() when methodUnavailable != null:
return methodUnavailable();case CheckNotice() when check != null:
return check();case ClockNotice() when clock != null:
return clock();case AbandonedNotice() when abandoned != null:
return abandoned();case VoucherRemovedNotice() when voucherRemoved != null:
return voucherRemoved(_that.code,_that.error);case TableRemovedNotice() when tableRemoved != null:
return tableRemoved(_that.name,_that.error);case TableDroppedNotice() when tableDropped != null:
return tableDropped(_that.name);case StandDroppedNotice() when standDropped != null:
return standDropped(_that.number);case NowNumberNotice() when nowNumber != null:
return nowNumber();case ErrorNotice() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class UnavailableNotice implements SaleNotice {
  const UnavailableNotice( List<String> names): _names = names;
  

 final  List<String> _names;
 List<String> get names {
  if (_names is EqualUnmodifiableListView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_names);
}


/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnavailableNoticeCopyWith<UnavailableNotice> get copyWith => _$UnavailableNoticeCopyWithImpl<UnavailableNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnavailableNotice&&const DeepCollectionEquality().equals(other.names, _names));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_names));
}

@override
String toString() {
    return 'SaleNotice.unavailable(names: $names)';
}


}

/// @nodoc
abstract mixin class $UnavailableNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $UnavailableNoticeCopyWith(UnavailableNotice value, $Res Function(UnavailableNotice) _then) = _$UnavailableNoticeCopyWithImpl;
@useResult
$Res call({
 List<String> names
});




}
/// @nodoc
class _$UnavailableNoticeCopyWithImpl<$Res>
    implements $UnavailableNoticeCopyWith<$Res> {
  _$UnavailableNoticeCopyWithImpl(this._self, this._then);

  final UnavailableNotice _self;
  final $Res Function(UnavailableNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? names = null,}) {
  return _then(UnavailableNotice(
null == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class StockCutNotice implements SaleNotice {
  const StockCutNotice( List<String> names): _names = names;
  

 final  List<String> _names;
 List<String> get names {
  if (_names is EqualUnmodifiableListView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_names);
}


/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockCutNoticeCopyWith<StockCutNotice> get copyWith => _$StockCutNoticeCopyWithImpl<StockCutNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StockCutNotice&&const DeepCollectionEquality().equals(other.names, _names));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_names));
}

@override
String toString() {
    return 'SaleNotice.stockCut(names: $names)';
}


}

/// @nodoc
abstract mixin class $StockCutNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $StockCutNoticeCopyWith(StockCutNotice value, $Res Function(StockCutNotice) _then) = _$StockCutNoticeCopyWithImpl;
@useResult
$Res call({
 List<String> names
});




}
/// @nodoc
class _$StockCutNoticeCopyWithImpl<$Res>
    implements $StockCutNoticeCopyWith<$Res> {
  _$StockCutNoticeCopyWithImpl(this._self, this._then);

  final StockCutNotice _self;
  final $Res Function(StockCutNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? names = null,}) {
  return _then(StockCutNotice(
null == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class PricesChangedNotice implements SaleNotice {
  const PricesChangedNotice( List<String> names): _names = names;
  

 final  List<String> _names;
 List<String> get names {
  if (_names is EqualUnmodifiableListView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_names);
}


/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricesChangedNoticeCopyWith<PricesChangedNotice> get copyWith => _$PricesChangedNoticeCopyWithImpl<PricesChangedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PricesChangedNotice&&const DeepCollectionEquality().equals(other.names, _names));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_names));
}

@override
String toString() {
    return 'SaleNotice.pricesChanged(names: $names)';
}


}

/// @nodoc
abstract mixin class $PricesChangedNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $PricesChangedNoticeCopyWith(PricesChangedNotice value, $Res Function(PricesChangedNotice) _then) = _$PricesChangedNoticeCopyWithImpl;
@useResult
$Res call({
 List<String> names
});




}
/// @nodoc
class _$PricesChangedNoticeCopyWithImpl<$Res>
    implements $PricesChangedNoticeCopyWith<$Res> {
  _$PricesChangedNoticeCopyWithImpl(this._self, this._then);

  final PricesChangedNotice _self;
  final $Res Function(PricesChangedNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? names = null,}) {
  return _then(PricesChangedNotice(
null == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class TotalChangedNotice implements SaleNotice {
  const TotalChangedNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TotalChangedNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.totalChanged()';
}


}




/// @nodoc


class MethodUnavailableNotice implements SaleNotice {
  const MethodUnavailableNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MethodUnavailableNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.methodUnavailable()';
}


}




/// @nodoc


class CheckNotice implements SaleNotice {
  const CheckNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.check()';
}


}




/// @nodoc


class ClockNotice implements SaleNotice {
  const ClockNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.clock()';
}


}




/// @nodoc


class AbandonedNotice implements SaleNotice {
  const AbandonedNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AbandonedNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.abandoned()';
}


}




/// @nodoc


class VoucherRemovedNotice implements SaleNotice {
  const VoucherRemovedNotice(this.code, this.error);
  

 final  String code;
 final  ApiException error;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherRemovedNoticeCopyWith<VoucherRemovedNotice> get copyWith => _$VoucherRemovedNoticeCopyWithImpl<VoucherRemovedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherRemovedNotice&&(identical(other.code, code) || other.code == code)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,code,error);
}

@override
String toString() {
    return 'SaleNotice.voucherRemoved(code: $code, error: $error)';
}


}

/// @nodoc
abstract mixin class $VoucherRemovedNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $VoucherRemovedNoticeCopyWith(VoucherRemovedNotice value, $Res Function(VoucherRemovedNotice) _then) = _$VoucherRemovedNoticeCopyWithImpl;
@useResult
$Res call({
 String code, ApiException error
});




}
/// @nodoc
class _$VoucherRemovedNoticeCopyWithImpl<$Res>
    implements $VoucherRemovedNoticeCopyWith<$Res> {
  _$VoucherRemovedNoticeCopyWithImpl(this._self, this._then);

  final VoucherRemovedNotice _self;
  final $Res Function(VoucherRemovedNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? error = null,}) {
  return _then(VoucherRemovedNotice(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

/// @nodoc


class TableRemovedNotice implements SaleNotice {
  const TableRemovedNotice(this.name, this.error);
  

 final  String name;
 final  ApiException error;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableRemovedNoticeCopyWith<TableRemovedNotice> get copyWith => _$TableRemovedNoticeCopyWithImpl<TableRemovedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TableRemovedNotice&&(identical(other.name, name) || other.name == name)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,error);
}

@override
String toString() {
    return 'SaleNotice.tableRemoved(name: $name, error: $error)';
}


}

/// @nodoc
abstract mixin class $TableRemovedNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $TableRemovedNoticeCopyWith(TableRemovedNotice value, $Res Function(TableRemovedNotice) _then) = _$TableRemovedNoticeCopyWithImpl;
@useResult
$Res call({
 String name, ApiException error
});




}
/// @nodoc
class _$TableRemovedNoticeCopyWithImpl<$Res>
    implements $TableRemovedNoticeCopyWith<$Res> {
  _$TableRemovedNoticeCopyWithImpl(this._self, this._then);

  final TableRemovedNotice _self;
  final $Res Function(TableRemovedNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? error = null,}) {
  return _then(TableRemovedNotice(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

/// @nodoc


class TableDroppedNotice implements SaleNotice {
  const TableDroppedNotice(this.name);
  

 final  String name;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableDroppedNoticeCopyWith<TableDroppedNotice> get copyWith => _$TableDroppedNoticeCopyWithImpl<TableDroppedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TableDroppedNotice&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'SaleNotice.tableDropped(name: $name)';
}


}

/// @nodoc
abstract mixin class $TableDroppedNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $TableDroppedNoticeCopyWith(TableDroppedNotice value, $Res Function(TableDroppedNotice) _then) = _$TableDroppedNoticeCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$TableDroppedNoticeCopyWithImpl<$Res>
    implements $TableDroppedNoticeCopyWith<$Res> {
  _$TableDroppedNoticeCopyWithImpl(this._self, this._then);

  final TableDroppedNotice _self;
  final $Res Function(TableDroppedNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(TableDroppedNotice(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StandDroppedNotice implements SaleNotice {
  const StandDroppedNotice(this.number);
  

 final  String number;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandDroppedNoticeCopyWith<StandDroppedNotice> get copyWith => _$StandDroppedNoticeCopyWithImpl<StandDroppedNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StandDroppedNotice&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode {
    return Object.hash(runtimeType,number);
}

@override
String toString() {
    return 'SaleNotice.standDropped(number: $number)';
}


}

/// @nodoc
abstract mixin class $StandDroppedNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $StandDroppedNoticeCopyWith(StandDroppedNotice value, $Res Function(StandDroppedNotice) _then) = _$StandDroppedNoticeCopyWithImpl;
@useResult
$Res call({
 String number
});




}
/// @nodoc
class _$StandDroppedNoticeCopyWithImpl<$Res>
    implements $StandDroppedNoticeCopyWith<$Res> {
  _$StandDroppedNoticeCopyWithImpl(this._self, this._then);

  final StandDroppedNotice _self;
  final $Res Function(StandDroppedNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(StandDroppedNotice(
null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NowNumberNotice implements SaleNotice {
  const NowNumberNotice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NowNumberNotice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SaleNotice.nowNumber()';
}


}




/// @nodoc


class ErrorNotice implements SaleNotice {
  const ErrorNotice(this.error);
  

 final  ApiException error;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorNoticeCopyWith<ErrorNotice> get copyWith => _$ErrorNoticeCopyWithImpl<ErrorNotice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorNotice&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'SaleNotice.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorNoticeCopyWith<$Res> implements $SaleNoticeCopyWith<$Res> {
  factory $ErrorNoticeCopyWith(ErrorNotice value, $Res Function(ErrorNotice) _then) = _$ErrorNoticeCopyWithImpl;
@useResult
$Res call({
 ApiException error
});




}
/// @nodoc
class _$ErrorNoticeCopyWithImpl<$Res>
    implements $ErrorNoticeCopyWith<$Res> {
  _$ErrorNoticeCopyWithImpl(this._self, this._then);

  final ErrorNotice _self;
  final $Res Function(ErrorNotice) _then;

/// Create a copy of SaleNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ErrorNotice(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
