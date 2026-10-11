// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Order {

 String get orderId;/// OUTLET-DEVICE-YYYYMMDD-0001.
 String get orderNo; OrderType get type; OrderStatus get status; String get cashierName; List<OrderLine> get lines; int get subtotal; int get discount;/// The rates it was charged at, in basis points.
 int get serviceBps; int get service; int get taxBps; int get tax; int get total; OrderPayment get payment;/// When the cashier charged it, by the device's clock (UTC).
 DateTime get clientCreatedAt; String? get voidReason;/// The code of the voucher the sale used, as it was then: the receipt
/// prints it beside the discount. Null for none.
 String? get voucherCode;/// The table a dine-in sale was for, and its name as it was then, which
/// the receipt prints. Null for none.
 String? get tableId; String? get tableName;/// The number on the stand a dine-in customer took, where the outlet
/// seats its customers by number stands: the receipt prints it large,
/// for the waiter who brings the order. Null for none.
 String? get standNumber;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.orderNo, _this.orderNo) || other.orderNo == _this.orderNo)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.cashierName, _this.cashierName) || other.cashierName == _this.cashierName)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.serviceBps, _this.serviceBps) || other.serviceBps == _this.serviceBps)&&(identical(other.service, _this.service) || other.service == _this.service)&&(identical(other.taxBps, _this.taxBps) || other.taxBps == _this.taxBps)&&(identical(other.tax, _this.tax) || other.tax == _this.tax)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.clientCreatedAt, _this.clientCreatedAt) || other.clientCreatedAt == _this.clientCreatedAt)&&(identical(other.voidReason, _this.voidReason) || other.voidReason == _this.voidReason)&&(identical(other.voucherCode, _this.voucherCode) || other.voucherCode == _this.voucherCode)&&(identical(other.tableId, _this.tableId) || other.tableId == _this.tableId)&&(identical(other.tableName, _this.tableName) || other.tableName == _this.tableName)&&(identical(other.standNumber, _this.standNumber) || other.standNumber == _this.standNumber));
}


@override
int get hashCode {
  final _this = this as Order;
  return Object.hashAll([runtimeType,_this.orderId,_this.orderNo,_this.type,_this.status,_this.cashierName,const DeepCollectionEquality().hash(_this.lines),_this.subtotal,_this.discount,_this.serviceBps,_this.service,_this.taxBps,_this.tax,_this.total,_this.payment,_this.clientCreatedAt,_this.voidReason,_this.voucherCode,_this.tableId,_this.tableName,_this.standNumber]);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(orderId: ${_this.orderId}, orderNo: ${_this.orderNo}, type: ${_this.type}, status: ${_this.status}, cashierName: ${_this.cashierName}, lines: ${_this.lines}, subtotal: ${_this.subtotal}, discount: ${_this.discount}, serviceBps: ${_this.serviceBps}, service: ${_this.service}, taxBps: ${_this.taxBps}, tax: ${_this.tax}, total: ${_this.total}, payment: ${_this.payment}, clientCreatedAt: ${_this.clientCreatedAt}, voidReason: ${_this.voidReason}, voucherCode: ${_this.voucherCode}, tableId: ${_this.tableId}, tableName: ${_this.tableName}, standNumber: ${_this.standNumber})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String orderId, String orderNo, OrderType type, OrderStatus status, String cashierName, List<OrderLine> lines, int subtotal, int discount, int serviceBps, int service, int taxBps, int tax, int total, OrderPayment payment, DateTime clientCreatedAt, String? voidReason, String? voucherCode, String? tableId, String? tableName, String? standNumber
});


$OrderPaymentCopyWith<$Res> get payment;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? status = null,Object? cashierName = null,Object? lines = null,Object? subtotal = null,Object? discount = null,Object? serviceBps = null,Object? service = null,Object? taxBps = null,Object? tax = null,Object? total = null,Object? payment = null,Object? clientCreatedAt = null,Object? voidReason = freezed,Object? voucherCode = freezed,Object? tableId = freezed,Object? tableName = freezed,Object? standNumber = freezed,}) {
  return _then(Order(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,cashierName: null == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,serviceBps: null == serviceBps ? _self.serviceBps : serviceBps // ignore: cast_nullable_to_non_nullable
as int,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as int,taxBps: null == taxBps ? _self.taxBps : taxBps // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,tableName: freezed == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res> get payment {
  
  return $OrderPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  String cashierName,  List<OrderLine> lines,  int subtotal,  int discount,  int serviceBps,  int service,  int taxBps,  int tax,  int total,  OrderPayment payment,  DateTime clientCreatedAt,  String? voidReason,  String? voucherCode,  String? tableId,  String? tableName,  String? standNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.cashierName,_that.lines,_that.subtotal,_that.discount,_that.serviceBps,_that.service,_that.taxBps,_that.tax,_that.total,_that.payment,_that.clientCreatedAt,_that.voidReason,_that.voucherCode,_that.tableId,_that.tableName,_that.standNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  String cashierName,  List<OrderLine> lines,  int subtotal,  int discount,  int serviceBps,  int service,  int taxBps,  int tax,  int total,  OrderPayment payment,  DateTime clientCreatedAt,  String? voidReason,  String? voucherCode,  String? tableId,  String? tableName,  String? standNumber)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.cashierName,_that.lines,_that.subtotal,_that.discount,_that.serviceBps,_that.service,_that.taxBps,_that.tax,_that.total,_that.payment,_that.clientCreatedAt,_that.voidReason,_that.voucherCode,_that.tableId,_that.tableName,_that.standNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  String cashierName,  List<OrderLine> lines,  int subtotal,  int discount,  int serviceBps,  int service,  int taxBps,  int tax,  int total,  OrderPayment payment,  DateTime clientCreatedAt,  String? voidReason,  String? voucherCode,  String? tableId,  String? tableName,  String? standNumber)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.cashierName,_that.lines,_that.subtotal,_that.discount,_that.serviceBps,_that.service,_that.taxBps,_that.tax,_that.total,_that.payment,_that.clientCreatedAt,_that.voidReason,_that.voucherCode,_that.tableId,_that.tableName,_that.standNumber);case _:
  return null;

}
}

}

/// @nodoc


class _Order implements Order {
  const _Order({required this.orderId, required this.orderNo, required this.type, required this.status, required this.cashierName, required  List<OrderLine> lines, required this.subtotal, required this.discount, required this.serviceBps, required this.service, required this.taxBps, required this.tax, required this.total, required this.payment, required this.clientCreatedAt, this.voidReason, this.voucherCode, this.tableId, this.tableName, this.standNumber}): _lines = lines;
  

@override final  String orderId;
/// OUTLET-DEVICE-YYYYMMDD-0001.
@override final  String orderNo;
@override final  OrderType type;
@override final  OrderStatus status;
@override final  String cashierName;
 final  List<OrderLine> _lines;
@override List<OrderLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  int subtotal;
@override final  int discount;
/// The rates it was charged at, in basis points.
@override final  int serviceBps;
@override final  int service;
@override final  int taxBps;
@override final  int tax;
@override final  int total;
@override final  OrderPayment payment;
/// When the cashier charged it, by the device's clock (UTC).
@override final  DateTime clientCreatedAt;
@override final  String? voidReason;
/// The code of the voucher the sale used, as it was then: the receipt
/// prints it beside the discount. Null for none.
@override final  String? voucherCode;
/// The table a dine-in sale was for, and its name as it was then, which
/// the receipt prints. Null for none.
@override final  String? tableId;
@override final  String? tableName;
/// The number on the stand a dine-in customer took, where the outlet
/// seats its customers by number stands: the receipt prints it large,
/// for the waiter who brings the order. Null for none.
@override final  String? standNumber;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.cashierName, cashierName) || other.cashierName == cashierName)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.serviceBps, serviceBps) || other.serviceBps == serviceBps)&&(identical(other.service, service) || other.service == service)&&(identical(other.taxBps, taxBps) || other.taxBps == taxBps)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.clientCreatedAt, clientCreatedAt) || other.clientCreatedAt == clientCreatedAt)&&(identical(other.voidReason, voidReason) || other.voidReason == voidReason)&&(identical(other.voucherCode, voucherCode) || other.voucherCode == voucherCode)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.standNumber, standNumber) || other.standNumber == standNumber));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,orderId,orderNo,type,status,cashierName,const DeepCollectionEquality().hash(_lines),subtotal,discount,serviceBps,service,taxBps,tax,total,payment,clientCreatedAt,voidReason,voucherCode,tableId,tableName,standNumber]);
}

@override
String toString() {
    return 'Order(orderId: $orderId, orderNo: $orderNo, type: $type, status: $status, cashierName: $cashierName, lines: $lines, subtotal: $subtotal, discount: $discount, serviceBps: $serviceBps, service: $service, taxBps: $taxBps, tax: $tax, total: $total, payment: $payment, clientCreatedAt: $clientCreatedAt, voidReason: $voidReason, voucherCode: $voucherCode, tableId: $tableId, tableName: $tableName, standNumber: $standNumber)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String orderNo, OrderType type, OrderStatus status, String cashierName, List<OrderLine> lines, int subtotal, int discount, int serviceBps, int service, int taxBps, int tax, int total, OrderPayment payment, DateTime clientCreatedAt, String? voidReason, String? voucherCode, String? tableId, String? tableName, String? standNumber
});


@override $OrderPaymentCopyWith<$Res> get payment;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? status = null,Object? cashierName = null,Object? lines = null,Object? subtotal = null,Object? discount = null,Object? serviceBps = null,Object? service = null,Object? taxBps = null,Object? tax = null,Object? total = null,Object? payment = null,Object? clientCreatedAt = null,Object? voidReason = freezed,Object? voucherCode = freezed,Object? tableId = freezed,Object? tableName = freezed,Object? standNumber = freezed,}) {
  return _then(_Order(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,cashierName: null == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLine>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,serviceBps: null == serviceBps ? _self.serviceBps : serviceBps // ignore: cast_nullable_to_non_nullable
as int,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as int,taxBps: null == taxBps ? _self.taxBps : taxBps // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,voidReason: freezed == voidReason ? _self.voidReason : voidReason // ignore: cast_nullable_to_non_nullable
as String?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,tableName: freezed == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res> get payment {
  
  return $OrderPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

/// @nodoc
mixin _$OrderLine {

 String get orderLineId; String get menuId;/// The menu's name and price as they were at the sale.
 String get name; int get price; int get qty; int get lineTotal; String? get note;
/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineCopyWith<OrderLine> get copyWith => _$OrderLineCopyWithImpl<OrderLine>(this as OrderLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLine&&(identical(other.orderLineId, _this.orderLineId) || other.orderLineId == _this.orderLineId)&&(identical(other.menuId, _this.menuId) || other.menuId == _this.menuId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as OrderLine;
  return Object.hash(runtimeType,_this.orderLineId,_this.menuId,_this.name,_this.price,_this.qty,_this.lineTotal,_this.note);
}

@override
String toString() {
  final _this = this as OrderLine;
  return 'OrderLine(orderLineId: ${_this.orderLineId}, menuId: ${_this.menuId}, name: ${_this.name}, price: ${_this.price}, qty: ${_this.qty}, lineTotal: ${_this.lineTotal}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $OrderLineCopyWith<$Res>  {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) _then) = _$OrderLineCopyWithImpl;
@useResult
$Res call({
 String orderLineId, String menuId, String name, int price, int qty, int lineTotal, String? note
});




}
/// @nodoc
class _$OrderLineCopyWithImpl<$Res>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._self, this._then);

  final OrderLine _self;
  final $Res Function(OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderLineId = null,Object? menuId = null,Object? name = null,Object? price = null,Object? qty = null,Object? lineTotal = null,Object? note = freezed,}) {
  return _then(OrderLine(
orderLineId: null == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String,menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLine].
extension OrderLinePatterns on OrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLine value)  $default,){
final _that = this;
switch (_that) {
case _OrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderLineId,  String menuId,  String name,  int price,  int qty,  int lineTotal,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.orderLineId,_that.menuId,_that.name,_that.price,_that.qty,_that.lineTotal,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderLineId,  String menuId,  String name,  int price,  int qty,  int lineTotal,  String? note)  $default,) {final _that = this;
switch (_that) {
case _OrderLine():
return $default(_that.orderLineId,_that.menuId,_that.name,_that.price,_that.qty,_that.lineTotal,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderLineId,  String menuId,  String name,  int price,  int qty,  int lineTotal,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _OrderLine() when $default != null:
return $default(_that.orderLineId,_that.menuId,_that.name,_that.price,_that.qty,_that.lineTotal,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _OrderLine implements OrderLine {
  const _OrderLine({required this.orderLineId, required this.menuId, required this.name, required this.price, required this.qty, required this.lineTotal, this.note});
  

@override final  String orderLineId;
@override final  String menuId;
/// The menu's name and price as they were at the sale.
@override final  String name;
@override final  int price;
@override final  int qty;
@override final  int lineTotal;
@override final  String? note;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineCopyWith<_OrderLine> get copyWith => __$OrderLineCopyWithImpl<_OrderLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLine&&(identical(other.orderLineId, orderLineId) || other.orderLineId == orderLineId)&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,orderLineId,menuId,name,price,qty,lineTotal,note);
}

@override
String toString() {
    return 'OrderLine(orderLineId: $orderLineId, menuId: $menuId, name: $name, price: $price, qty: $qty, lineTotal: $lineTotal, note: $note)';
}


}

/// @nodoc
abstract mixin class _$OrderLineCopyWith<$Res> implements $OrderLineCopyWith<$Res> {
  factory _$OrderLineCopyWith(_OrderLine value, $Res Function(_OrderLine) _then) = __$OrderLineCopyWithImpl;
@override @useResult
$Res call({
 String orderLineId, String menuId, String name, int price, int qty, int lineTotal, String? note
});




}
/// @nodoc
class __$OrderLineCopyWithImpl<$Res>
    implements _$OrderLineCopyWith<$Res> {
  __$OrderLineCopyWithImpl(this._self, this._then);

  final _OrderLine _self;
  final $Res Function(_OrderLine) _then;

/// Create a copy of OrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderLineId = null,Object? menuId = null,Object? name = null,Object? price = null,Object? qty = null,Object? lineTotal = null,Object? note = freezed,}) {
  return _then(_OrderLine(
orderLineId: null == orderLineId ? _self.orderLineId : orderLineId // ignore: cast_nullable_to_non_nullable
as String,menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$OrderPayment {

 PaymentMethod get method;/// What was charged: the order's total.
 int get amount;/// Cash: what the customer handed over, and what went back.
 int? get received; int? get change;
/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<OrderPayment> get copyWith => _$OrderPaymentCopyWithImpl<OrderPayment>(this as OrderPayment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderPayment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPayment&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.received, _this.received) || other.received == _this.received)&&(identical(other.change, _this.change) || other.change == _this.change));
}


@override
int get hashCode {
  final _this = this as OrderPayment;
  return Object.hash(runtimeType,_this.method,_this.amount,_this.received,_this.change);
}

@override
String toString() {
  final _this = this as OrderPayment;
  return 'OrderPayment(method: ${_this.method}, amount: ${_this.amount}, received: ${_this.received}, change: ${_this.change})';
}


}

/// @nodoc
abstract mixin class $OrderPaymentCopyWith<$Res>  {
  factory $OrderPaymentCopyWith(OrderPayment value, $Res Function(OrderPayment) _then) = _$OrderPaymentCopyWithImpl;
@useResult
$Res call({
 PaymentMethod method, int amount, int? received, int? change
});




}
/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._self, this._then);

  final OrderPayment _self;
  final $Res Function(OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? amount = null,Object? received = freezed,Object? change = freezed,}) {
  return _then(OrderPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,received: freezed == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPayment].
extension OrderPaymentPatterns on OrderPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPayment value)  $default,){
final _that = this;
switch (_that) {
case _OrderPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPayment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentMethod method,  int amount,  int? received,  int? change)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.amount,_that.received,_that.change);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentMethod method,  int amount,  int? received,  int? change)  $default,) {final _that = this;
switch (_that) {
case _OrderPayment():
return $default(_that.method,_that.amount,_that.received,_that.change);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentMethod method,  int amount,  int? received,  int? change)?  $default,) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.amount,_that.received,_that.change);case _:
  return null;

}
}

}

/// @nodoc


class _OrderPayment implements OrderPayment {
  const _OrderPayment({required this.method, required this.amount, this.received, this.change});
  

@override final  PaymentMethod method;
/// What was charged: the order's total.
@override final  int amount;
/// Cash: what the customer handed over, and what went back.
@override final  int? received;
@override final  int? change;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPaymentCopyWith<_OrderPayment> get copyWith => __$OrderPaymentCopyWithImpl<_OrderPayment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.received, received) || other.received == received)&&(identical(other.change, change) || other.change == change));
}


@override
int get hashCode {
    return Object.hash(runtimeType,method,amount,received,change);
}

@override
String toString() {
    return 'OrderPayment(method: $method, amount: $amount, received: $received, change: $change)';
}


}

/// @nodoc
abstract mixin class _$OrderPaymentCopyWith<$Res> implements $OrderPaymentCopyWith<$Res> {
  factory _$OrderPaymentCopyWith(_OrderPayment value, $Res Function(_OrderPayment) _then) = __$OrderPaymentCopyWithImpl;
@override @useResult
$Res call({
 PaymentMethod method, int amount, int? received, int? change
});




}
/// @nodoc
class __$OrderPaymentCopyWithImpl<$Res>
    implements _$OrderPaymentCopyWith<$Res> {
  __$OrderPaymentCopyWithImpl(this._self, this._then);

  final _OrderPayment _self;
  final $Res Function(_OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? amount = null,Object? received = freezed,Object? change = freezed,}) {
  return _then(_OrderPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,received: freezed == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$OrderSummary {

 String get orderId; String get orderNo; OrderType get type; OrderStatus get status; int get total; int get itemCount; PaymentMethod get method; String get cashierName; DateTime get clientCreatedAt;/// The table's name as it was at the sale; null for none.
 String? get tableName;/// The number on the customer's stand; null for none.
 String? get standNumber;
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderSummaryCopyWith<OrderSummary> get copyWith => _$OrderSummaryCopyWithImpl<OrderSummary>(this as OrderSummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OrderSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderSummary&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.orderNo, _this.orderNo) || other.orderNo == _this.orderNo)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.cashierName, _this.cashierName) || other.cashierName == _this.cashierName)&&(identical(other.clientCreatedAt, _this.clientCreatedAt) || other.clientCreatedAt == _this.clientCreatedAt)&&(identical(other.tableName, _this.tableName) || other.tableName == _this.tableName)&&(identical(other.standNumber, _this.standNumber) || other.standNumber == _this.standNumber));
}


@override
int get hashCode {
  final _this = this as OrderSummary;
  return Object.hash(runtimeType,_this.orderId,_this.orderNo,_this.type,_this.status,_this.total,_this.itemCount,_this.method,_this.cashierName,_this.clientCreatedAt,_this.tableName,_this.standNumber);
}

@override
String toString() {
  final _this = this as OrderSummary;
  return 'OrderSummary(orderId: ${_this.orderId}, orderNo: ${_this.orderNo}, type: ${_this.type}, status: ${_this.status}, total: ${_this.total}, itemCount: ${_this.itemCount}, method: ${_this.method}, cashierName: ${_this.cashierName}, clientCreatedAt: ${_this.clientCreatedAt}, tableName: ${_this.tableName}, standNumber: ${_this.standNumber})';
}


}

/// @nodoc
abstract mixin class $OrderSummaryCopyWith<$Res>  {
  factory $OrderSummaryCopyWith(OrderSummary value, $Res Function(OrderSummary) _then) = _$OrderSummaryCopyWithImpl;
@useResult
$Res call({
 String orderId, String orderNo, OrderType type, OrderStatus status, int total, int itemCount, PaymentMethod method, String cashierName, DateTime clientCreatedAt, String? tableName, String? standNumber
});




}
/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._self, this._then);

  final OrderSummary _self;
  final $Res Function(OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? status = null,Object? total = null,Object? itemCount = null,Object? method = null,Object? cashierName = null,Object? clientCreatedAt = null,Object? tableName = freezed,Object? standNumber = freezed,}) {
  return _then(OrderSummary(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,cashierName: null == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tableName: freezed == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderSummary].
extension OrderSummaryPatterns on OrderSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderSummary value)  $default,){
final _that = this;
switch (_that) {
case _OrderSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderSummary value)?  $default,){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  int total,  int itemCount,  PaymentMethod method,  String cashierName,  DateTime clientCreatedAt,  String? tableName,  String? standNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.total,_that.itemCount,_that.method,_that.cashierName,_that.clientCreatedAt,_that.tableName,_that.standNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  int total,  int itemCount,  PaymentMethod method,  String cashierName,  DateTime clientCreatedAt,  String? tableName,  String? standNumber)  $default,) {final _that = this;
switch (_that) {
case _OrderSummary():
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.total,_that.itemCount,_that.method,_that.cashierName,_that.clientCreatedAt,_that.tableName,_that.standNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String orderNo,  OrderType type,  OrderStatus status,  int total,  int itemCount,  PaymentMethod method,  String cashierName,  DateTime clientCreatedAt,  String? tableName,  String? standNumber)?  $default,) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.status,_that.total,_that.itemCount,_that.method,_that.cashierName,_that.clientCreatedAt,_that.tableName,_that.standNumber);case _:
  return null;

}
}

}

/// @nodoc


class _OrderSummary implements OrderSummary {
  const _OrderSummary({required this.orderId, required this.orderNo, required this.type, required this.status, required this.total, required this.itemCount, required this.method, required this.cashierName, required this.clientCreatedAt, this.tableName, this.standNumber});
  

@override final  String orderId;
@override final  String orderNo;
@override final  OrderType type;
@override final  OrderStatus status;
@override final  int total;
@override final  int itemCount;
@override final  PaymentMethod method;
@override final  String cashierName;
@override final  DateTime clientCreatedAt;
/// The table's name as it was at the sale; null for none.
@override final  String? tableName;
/// The number on the customer's stand; null for none.
@override final  String? standNumber;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderSummaryCopyWith<_OrderSummary> get copyWith => __$OrderSummaryCopyWithImpl<_OrderSummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderSummary&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.total, total) || other.total == total)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.method, method) || other.method == method)&&(identical(other.cashierName, cashierName) || other.cashierName == cashierName)&&(identical(other.clientCreatedAt, clientCreatedAt) || other.clientCreatedAt == clientCreatedAt)&&(identical(other.tableName, tableName) || other.tableName == tableName)&&(identical(other.standNumber, standNumber) || other.standNumber == standNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,orderId,orderNo,type,status,total,itemCount,method,cashierName,clientCreatedAt,tableName,standNumber);
}

@override
String toString() {
    return 'OrderSummary(orderId: $orderId, orderNo: $orderNo, type: $type, status: $status, total: $total, itemCount: $itemCount, method: $method, cashierName: $cashierName, clientCreatedAt: $clientCreatedAt, tableName: $tableName, standNumber: $standNumber)';
}


}

/// @nodoc
abstract mixin class _$OrderSummaryCopyWith<$Res> implements $OrderSummaryCopyWith<$Res> {
  factory _$OrderSummaryCopyWith(_OrderSummary value, $Res Function(_OrderSummary) _then) = __$OrderSummaryCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String orderNo, OrderType type, OrderStatus status, int total, int itemCount, PaymentMethod method, String cashierName, DateTime clientCreatedAt, String? tableName, String? standNumber
});




}
/// @nodoc
class __$OrderSummaryCopyWithImpl<$Res>
    implements _$OrderSummaryCopyWith<$Res> {
  __$OrderSummaryCopyWithImpl(this._self, this._then);

  final _OrderSummary _self;
  final $Res Function(_OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? status = null,Object? total = null,Object? itemCount = null,Object? method = null,Object? cashierName = null,Object? clientCreatedAt = null,Object? tableName = freezed,Object? standNumber = freezed,}) {
  return _then(_OrderSummary(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,cashierName: null == cashierName ? _self.cashierName : cashierName // ignore: cast_nullable_to_non_nullable
as String,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,tableName: freezed == tableName ? _self.tableName : tableName // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NewOrder {

 String get orderId; String get orderNo; OrderType get type;/// In UTC.
 DateTime get clientCreatedAt; List<NewOrderLine> get lines;/// The total the cashier showed: the server refuses it if its own
/// differs.
 int get total; PaymentMethod get method;/// Cash handed over.
 int? get received;/// The voucher the customer gave, one per order; null for none.
 String? get voucherCode;/// The table of a dine-in order, if the cashier picked one; null for
/// none.
 String? get tableId;/// The number on the dine-in customer's stand, as the server keeps it,
/// where the outlet seats its customers by number stands; null for none.
 String? get standNumber;
/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewOrderCopyWith<NewOrder> get copyWith => _$NewOrderCopyWithImpl<NewOrder>(this as NewOrder, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NewOrder;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewOrder&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.orderNo, _this.orderNo) || other.orderNo == _this.orderNo)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.clientCreatedAt, _this.clientCreatedAt) || other.clientCreatedAt == _this.clientCreatedAt)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.received, _this.received) || other.received == _this.received)&&(identical(other.voucherCode, _this.voucherCode) || other.voucherCode == _this.voucherCode)&&(identical(other.tableId, _this.tableId) || other.tableId == _this.tableId)&&(identical(other.standNumber, _this.standNumber) || other.standNumber == _this.standNumber));
}


@override
int get hashCode {
  final _this = this as NewOrder;
  return Object.hash(runtimeType,_this.orderId,_this.orderNo,_this.type,_this.clientCreatedAt,const DeepCollectionEquality().hash(_this.lines),_this.total,_this.method,_this.received,_this.voucherCode,_this.tableId,_this.standNumber);
}

@override
String toString() {
  final _this = this as NewOrder;
  return 'NewOrder(orderId: ${_this.orderId}, orderNo: ${_this.orderNo}, type: ${_this.type}, clientCreatedAt: ${_this.clientCreatedAt}, lines: ${_this.lines}, total: ${_this.total}, method: ${_this.method}, received: ${_this.received}, voucherCode: ${_this.voucherCode}, tableId: ${_this.tableId}, standNumber: ${_this.standNumber})';
}


}

/// @nodoc
abstract mixin class $NewOrderCopyWith<$Res>  {
  factory $NewOrderCopyWith(NewOrder value, $Res Function(NewOrder) _then) = _$NewOrderCopyWithImpl;
@useResult
$Res call({
 String orderId, String orderNo, OrderType type, DateTime clientCreatedAt, List<NewOrderLine> lines, int total, PaymentMethod method, int? received, String? voucherCode, String? tableId, String? standNumber
});




}
/// @nodoc
class _$NewOrderCopyWithImpl<$Res>
    implements $NewOrderCopyWith<$Res> {
  _$NewOrderCopyWithImpl(this._self, this._then);

  final NewOrder _self;
  final $Res Function(NewOrder) _then;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? clientCreatedAt = null,Object? lines = null,Object? total = null,Object? method = null,Object? received = freezed,Object? voucherCode = freezed,Object? tableId = freezed,Object? standNumber = freezed,}) {
  return _then(NewOrder(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<NewOrderLine>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,received: freezed == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewOrder].
extension NewOrderPatterns on NewOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewOrder value)  $default,){
final _that = this;
switch (_that) {
case _NewOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewOrder value)?  $default,){
final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  DateTime clientCreatedAt,  List<NewOrderLine> lines,  int total,  PaymentMethod method,  int? received,  String? voucherCode,  String? tableId,  String? standNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.clientCreatedAt,_that.lines,_that.total,_that.method,_that.received,_that.voucherCode,_that.tableId,_that.standNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String orderNo,  OrderType type,  DateTime clientCreatedAt,  List<NewOrderLine> lines,  int total,  PaymentMethod method,  int? received,  String? voucherCode,  String? tableId,  String? standNumber)  $default,) {final _that = this;
switch (_that) {
case _NewOrder():
return $default(_that.orderId,_that.orderNo,_that.type,_that.clientCreatedAt,_that.lines,_that.total,_that.method,_that.received,_that.voucherCode,_that.tableId,_that.standNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String orderNo,  OrderType type,  DateTime clientCreatedAt,  List<NewOrderLine> lines,  int total,  PaymentMethod method,  int? received,  String? voucherCode,  String? tableId,  String? standNumber)?  $default,) {final _that = this;
switch (_that) {
case _NewOrder() when $default != null:
return $default(_that.orderId,_that.orderNo,_that.type,_that.clientCreatedAt,_that.lines,_that.total,_that.method,_that.received,_that.voucherCode,_that.tableId,_that.standNumber);case _:
  return null;

}
}

}

/// @nodoc


class _NewOrder implements NewOrder {
  const _NewOrder({required this.orderId, required this.orderNo, required this.type, required this.clientCreatedAt, required  List<NewOrderLine> lines, required this.total, required this.method, this.received, this.voucherCode, this.tableId, this.standNumber}): _lines = lines;
  

@override final  String orderId;
@override final  String orderNo;
@override final  OrderType type;
/// In UTC.
@override final  DateTime clientCreatedAt;
 final  List<NewOrderLine> _lines;
@override List<NewOrderLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

/// The total the cashier showed: the server refuses it if its own
/// differs.
@override final  int total;
@override final  PaymentMethod method;
/// Cash handed over.
@override final  int? received;
/// The voucher the customer gave, one per order; null for none.
@override final  String? voucherCode;
/// The table of a dine-in order, if the cashier picked one; null for
/// none.
@override final  String? tableId;
/// The number on the dine-in customer's stand, as the server keeps it,
/// where the outlet seats its customers by number stands; null for none.
@override final  String? standNumber;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewOrderCopyWith<_NewOrder> get copyWith => __$NewOrderCopyWithImpl<_NewOrder>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.type, type) || other.type == type)&&(identical(other.clientCreatedAt, clientCreatedAt) || other.clientCreatedAt == clientCreatedAt)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.total, total) || other.total == total)&&(identical(other.method, method) || other.method == method)&&(identical(other.received, received) || other.received == received)&&(identical(other.voucherCode, voucherCode) || other.voucherCode == voucherCode)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.standNumber, standNumber) || other.standNumber == standNumber));
}


@override
int get hashCode {
    return Object.hash(runtimeType,orderId,orderNo,type,clientCreatedAt,const DeepCollectionEquality().hash(_lines),total,method,received,voucherCode,tableId,standNumber);
}

@override
String toString() {
    return 'NewOrder(orderId: $orderId, orderNo: $orderNo, type: $type, clientCreatedAt: $clientCreatedAt, lines: $lines, total: $total, method: $method, received: $received, voucherCode: $voucherCode, tableId: $tableId, standNumber: $standNumber)';
}


}

/// @nodoc
abstract mixin class _$NewOrderCopyWith<$Res> implements $NewOrderCopyWith<$Res> {
  factory _$NewOrderCopyWith(_NewOrder value, $Res Function(_NewOrder) _then) = __$NewOrderCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String orderNo, OrderType type, DateTime clientCreatedAt, List<NewOrderLine> lines, int total, PaymentMethod method, int? received, String? voucherCode, String? tableId, String? standNumber
});




}
/// @nodoc
class __$NewOrderCopyWithImpl<$Res>
    implements _$NewOrderCopyWith<$Res> {
  __$NewOrderCopyWithImpl(this._self, this._then);

  final _NewOrder _self;
  final $Res Function(_NewOrder) _then;

/// Create a copy of NewOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orderNo = null,Object? type = null,Object? clientCreatedAt = null,Object? lines = null,Object? total = null,Object? method = null,Object? received = freezed,Object? voucherCode = freezed,Object? tableId = freezed,Object? standNumber = freezed,}) {
  return _then(_NewOrder(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OrderType,clientCreatedAt: null == clientCreatedAt ? _self.clientCreatedAt : clientCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<NewOrderLine>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,received: freezed == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as int?,voucherCode: freezed == voucherCode ? _self.voucherCode : voucherCode // ignore: cast_nullable_to_non_nullable
as String?,tableId: freezed == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String?,standNumber: freezed == standNumber ? _self.standNumber : standNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$NewOrderLine {

 String get menuId; int get qty;/// The price the cashier showed: the server refuses it if the menu's
/// differs.
 int get price; String? get note;
/// Create a copy of NewOrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewOrderLineCopyWith<NewOrderLine> get copyWith => _$NewOrderLineCopyWithImpl<NewOrderLine>(this as NewOrderLine, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as NewOrderLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewOrderLine&&(identical(other.menuId, _this.menuId) || other.menuId == _this.menuId)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as NewOrderLine;
  return Object.hash(runtimeType,_this.menuId,_this.qty,_this.price,_this.note);
}

@override
String toString() {
  final _this = this as NewOrderLine;
  return 'NewOrderLine(menuId: ${_this.menuId}, qty: ${_this.qty}, price: ${_this.price}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $NewOrderLineCopyWith<$Res>  {
  factory $NewOrderLineCopyWith(NewOrderLine value, $Res Function(NewOrderLine) _then) = _$NewOrderLineCopyWithImpl;
@useResult
$Res call({
 String menuId, int qty, int price, String? note
});




}
/// @nodoc
class _$NewOrderLineCopyWithImpl<$Res>
    implements $NewOrderLineCopyWith<$Res> {
  _$NewOrderLineCopyWithImpl(this._self, this._then);

  final NewOrderLine _self;
  final $Res Function(NewOrderLine) _then;

/// Create a copy of NewOrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuId = null,Object? qty = null,Object? price = null,Object? note = freezed,}) {
  return _then(NewOrderLine(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewOrderLine].
extension NewOrderLinePatterns on NewOrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewOrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewOrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewOrderLine value)  $default,){
final _that = this;
switch (_that) {
case _NewOrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewOrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _NewOrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String menuId,  int qty,  int price,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewOrderLine() when $default != null:
return $default(_that.menuId,_that.qty,_that.price,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String menuId,  int qty,  int price,  String? note)  $default,) {final _that = this;
switch (_that) {
case _NewOrderLine():
return $default(_that.menuId,_that.qty,_that.price,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String menuId,  int qty,  int price,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _NewOrderLine() when $default != null:
return $default(_that.menuId,_that.qty,_that.price,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _NewOrderLine implements NewOrderLine {
  const _NewOrderLine({required this.menuId, required this.qty, required this.price, this.note});
  

@override final  String menuId;
@override final  int qty;
/// The price the cashier showed: the server refuses it if the menu's
/// differs.
@override final  int price;
@override final  String? note;

/// Create a copy of NewOrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewOrderLineCopyWith<_NewOrderLine> get copyWith => __$NewOrderLineCopyWithImpl<_NewOrderLine>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewOrderLine&&(identical(other.menuId, menuId) || other.menuId == menuId)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.price, price) || other.price == price)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,menuId,qty,price,note);
}

@override
String toString() {
    return 'NewOrderLine(menuId: $menuId, qty: $qty, price: $price, note: $note)';
}


}

/// @nodoc
abstract mixin class _$NewOrderLineCopyWith<$Res> implements $NewOrderLineCopyWith<$Res> {
  factory _$NewOrderLineCopyWith(_NewOrderLine value, $Res Function(_NewOrderLine) _then) = __$NewOrderLineCopyWithImpl;
@override @useResult
$Res call({
 String menuId, int qty, int price, String? note
});




}
/// @nodoc
class __$NewOrderLineCopyWithImpl<$Res>
    implements _$NewOrderLineCopyWith<$Res> {
  __$NewOrderLineCopyWithImpl(this._self, this._then);

  final _NewOrderLine _self;
  final $Res Function(_NewOrderLine) _then;

/// Create a copy of NewOrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuId = null,Object? qty = null,Object? price = null,Object? note = freezed,}) {
  return _then(_NewOrderLine(
menuId: null == menuId ? _self.menuId : menuId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
