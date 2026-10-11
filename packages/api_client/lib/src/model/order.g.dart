// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderCWProxy {
  Order orderId(String orderId);

  Order orderNo(String orderNo);

  Order deviceId(String deviceId);

  Order type(OrderType type);

  Order tableId(String? tableId);

  Order tableName(String? tableName);

  Order standNumber(String? standNumber);

  Order status(OrderStatus status);

  Order cashier(OrderPerson cashier);

  Order items(List<OrderItem> items);

  Order subtotal(int subtotal);

  Order voucherCode(String? voucherCode);

  Order voucherDiscount(int voucherDiscount);

  Order serviceBps(int serviceBps);

  Order service(int service);

  Order taxBps(int taxBps);

  Order tax(int tax);

  Order total(int total);

  Order payment(OrderPayment payment);

  Order clientCreatedAt(DateTime clientCreatedAt);

  Order createdAt(DateTime createdAt);

  Order voidedAt(DateTime? voidedAt);

  Order voidedBy(OrderPerson? voidedBy);

  Order voidReason(String? voidReason);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    String orderId,
    String orderNo,
    String deviceId,
    OrderType type,
    String? tableId,
    String? tableName,
    String? standNumber,
    OrderStatus status,
    OrderPerson cashier,
    List<OrderItem> items,
    int subtotal,
    String? voucherCode,
    int voucherDiscount,
    int serviceBps,
    int service,
    int taxBps,
    int tax,
    int total,
    OrderPayment payment,
    DateTime clientCreatedAt,
    DateTime createdAt,
    DateTime? voidedAt,
    OrderPerson? voidedBy,
    String? voidReason,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrder.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrder.copyWith.fieldName(...)`
class _$OrderCWProxyImpl implements _$OrderCWProxy {
  const _$OrderCWProxyImpl(this._value);

  final Order _value;

  @override
  Order orderId(String orderId) => this(orderId: orderId);

  @override
  Order orderNo(String orderNo) => this(orderNo: orderNo);

  @override
  Order deviceId(String deviceId) => this(deviceId: deviceId);

  @override
  Order type(OrderType type) => this(type: type);

  @override
  Order tableId(String? tableId) => this(tableId: tableId);

  @override
  Order tableName(String? tableName) => this(tableName: tableName);

  @override
  Order standNumber(String? standNumber) => this(standNumber: standNumber);

  @override
  Order status(OrderStatus status) => this(status: status);

  @override
  Order cashier(OrderPerson cashier) => this(cashier: cashier);

  @override
  Order items(List<OrderItem> items) => this(items: items);

  @override
  Order subtotal(int subtotal) => this(subtotal: subtotal);

  @override
  Order voucherCode(String? voucherCode) => this(voucherCode: voucherCode);

  @override
  Order voucherDiscount(int voucherDiscount) =>
      this(voucherDiscount: voucherDiscount);

  @override
  Order serviceBps(int serviceBps) => this(serviceBps: serviceBps);

  @override
  Order service(int service) => this(service: service);

  @override
  Order taxBps(int taxBps) => this(taxBps: taxBps);

  @override
  Order tax(int tax) => this(tax: tax);

  @override
  Order total(int total) => this(total: total);

  @override
  Order payment(OrderPayment payment) => this(payment: payment);

  @override
  Order clientCreatedAt(DateTime clientCreatedAt) =>
      this(clientCreatedAt: clientCreatedAt);

  @override
  Order createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Order voidedAt(DateTime? voidedAt) => this(voidedAt: voidedAt);

  @override
  Order voidedBy(OrderPerson? voidedBy) => this(voidedBy: voidedBy);

  @override
  Order voidReason(String? voidReason) => this(voidReason: voidReason);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Order(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Order(...).copyWith(id: 12, name: "My name")
  /// ````
  Order call({
    Object? orderId = const $CopyWithPlaceholder(),
    Object? orderNo = const $CopyWithPlaceholder(),
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? tableId = const $CopyWithPlaceholder(),
    Object? tableName = const $CopyWithPlaceholder(),
    Object? standNumber = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? cashier = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? subtotal = const $CopyWithPlaceholder(),
    Object? voucherCode = const $CopyWithPlaceholder(),
    Object? voucherDiscount = const $CopyWithPlaceholder(),
    Object? serviceBps = const $CopyWithPlaceholder(),
    Object? service = const $CopyWithPlaceholder(),
    Object? taxBps = const $CopyWithPlaceholder(),
    Object? tax = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? payment = const $CopyWithPlaceholder(),
    Object? clientCreatedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? voidedAt = const $CopyWithPlaceholder(),
    Object? voidedBy = const $CopyWithPlaceholder(),
    Object? voidReason = const $CopyWithPlaceholder(),
  }) {
    return Order(
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String,
      orderNo: orderNo == const $CopyWithPlaceholder()
          ? _value.orderNo
          // ignore: cast_nullable_to_non_nullable
          : orderNo as String,
      deviceId: deviceId == const $CopyWithPlaceholder()
          ? _value.deviceId
          // ignore: cast_nullable_to_non_nullable
          : deviceId as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as OrderType,
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String?,
      tableName: tableName == const $CopyWithPlaceholder()
          ? _value.tableName
          // ignore: cast_nullable_to_non_nullable
          : tableName as String?,
      standNumber: standNumber == const $CopyWithPlaceholder()
          ? _value.standNumber
          // ignore: cast_nullable_to_non_nullable
          : standNumber as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OrderStatus,
      cashier: cashier == const $CopyWithPlaceholder()
          ? _value.cashier
          // ignore: cast_nullable_to_non_nullable
          : cashier as OrderPerson,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<OrderItem>,
      subtotal: subtotal == const $CopyWithPlaceholder()
          ? _value.subtotal
          // ignore: cast_nullable_to_non_nullable
          : subtotal as int,
      voucherCode: voucherCode == const $CopyWithPlaceholder()
          ? _value.voucherCode
          // ignore: cast_nullable_to_non_nullable
          : voucherCode as String?,
      voucherDiscount: voucherDiscount == const $CopyWithPlaceholder()
          ? _value.voucherDiscount
          // ignore: cast_nullable_to_non_nullable
          : voucherDiscount as int,
      serviceBps: serviceBps == const $CopyWithPlaceholder()
          ? _value.serviceBps
          // ignore: cast_nullable_to_non_nullable
          : serviceBps as int,
      service: service == const $CopyWithPlaceholder()
          ? _value.service
          // ignore: cast_nullable_to_non_nullable
          : service as int,
      taxBps: taxBps == const $CopyWithPlaceholder()
          ? _value.taxBps
          // ignore: cast_nullable_to_non_nullable
          : taxBps as int,
      tax: tax == const $CopyWithPlaceholder()
          ? _value.tax
          // ignore: cast_nullable_to_non_nullable
          : tax as int,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      payment: payment == const $CopyWithPlaceholder()
          ? _value.payment
          // ignore: cast_nullable_to_non_nullable
          : payment as OrderPayment,
      clientCreatedAt: clientCreatedAt == const $CopyWithPlaceholder()
          ? _value.clientCreatedAt
          // ignore: cast_nullable_to_non_nullable
          : clientCreatedAt as DateTime,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      voidedAt: voidedAt == const $CopyWithPlaceholder()
          ? _value.voidedAt
          // ignore: cast_nullable_to_non_nullable
          : voidedAt as DateTime?,
      voidedBy: voidedBy == const $CopyWithPlaceholder()
          ? _value.voidedBy
          // ignore: cast_nullable_to_non_nullable
          : voidedBy as OrderPerson?,
      voidReason: voidReason == const $CopyWithPlaceholder()
          ? _value.voidReason
          // ignore: cast_nullable_to_non_nullable
          : voidReason as String?,
    );
  }
}

extension $OrderCopyWith on Order {
  /// Returns a callable class that can be used as follows: `instanceOfOrder.copyWith(...)` or like so:`instanceOfOrder.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderCWProxy get copyWith => _$OrderCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Order',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'order_id',
        'order_no',
        'device_id',
        'type',
        'table_id',
        'table_name',
        'stand_number',
        'status',
        'cashier',
        'items',
        'subtotal',
        'voucher_code',
        'voucher_discount',
        'service_bps',
        'service',
        'tax_bps',
        'tax',
        'total',
        'payment',
        'client_created_at',
        'created_at',
        'voided_at',
        'voided_by',
        'void_reason',
      ],
    );
    final val = Order(
      orderId: $checkedConvert('order_id', (v) => v as String),
      orderNo: $checkedConvert('order_no', (v) => v as String),
      deviceId: $checkedConvert('device_id', (v) => v as String),
      type: $checkedConvert('type', (v) => $enumDecode(_$OrderTypeEnumMap, v)),
      tableId: $checkedConvert('table_id', (v) => v as String?),
      tableName: $checkedConvert('table_name', (v) => v as String?),
      standNumber: $checkedConvert('stand_number', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$OrderStatusEnumMap, v),
      ),
      cashier: $checkedConvert(
        'cashier',
        (v) => OrderPerson.fromJson(v as Map<String, dynamic>),
      ),
      items: $checkedConvert(
        'items',
        (v) => (v as List<dynamic>)
            .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      subtotal: $checkedConvert('subtotal', (v) => (v as num).toInt()),
      voucherCode: $checkedConvert('voucher_code', (v) => v as String?),
      voucherDiscount: $checkedConvert(
        'voucher_discount',
        (v) => (v as num).toInt(),
      ),
      serviceBps: $checkedConvert('service_bps', (v) => (v as num).toInt()),
      service: $checkedConvert('service', (v) => (v as num).toInt()),
      taxBps: $checkedConvert('tax_bps', (v) => (v as num).toInt()),
      tax: $checkedConvert('tax', (v) => (v as num).toInt()),
      total: $checkedConvert('total', (v) => (v as num).toInt()),
      payment: $checkedConvert(
        'payment',
        (v) => OrderPayment.fromJson(v as Map<String, dynamic>),
      ),
      clientCreatedAt: $checkedConvert(
        'client_created_at',
        (v) => DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      voidedAt: $checkedConvert(
        'voided_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      voidedBy: $checkedConvert(
        'voided_by',
        (v) =>
            v == null ? null : OrderPerson.fromJson(v as Map<String, dynamic>),
      ),
      voidReason: $checkedConvert('void_reason', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'orderId': 'order_id',
    'orderNo': 'order_no',
    'deviceId': 'device_id',
    'tableId': 'table_id',
    'tableName': 'table_name',
    'standNumber': 'stand_number',
    'voucherCode': 'voucher_code',
    'voucherDiscount': 'voucher_discount',
    'serviceBps': 'service_bps',
    'taxBps': 'tax_bps',
    'clientCreatedAt': 'client_created_at',
    'createdAt': 'created_at',
    'voidedAt': 'voided_at',
    'voidedBy': 'voided_by',
    'voidReason': 'void_reason',
  },
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'order_id': instance.orderId,
  'order_no': instance.orderNo,
  'device_id': instance.deviceId,
  'type': _$OrderTypeEnumMap[instance.type]!,
  'table_id': instance.tableId,
  'table_name': instance.tableName,
  'stand_number': instance.standNumber,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'cashier': instance.cashier.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'subtotal': instance.subtotal,
  'voucher_code': instance.voucherCode,
  'voucher_discount': instance.voucherDiscount,
  'service_bps': instance.serviceBps,
  'service': instance.service,
  'tax_bps': instance.taxBps,
  'tax': instance.tax,
  'total': instance.total,
  'payment': instance.payment.toJson(),
  'client_created_at': instance.clientCreatedAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'voided_at': instance.voidedAt?.toIso8601String(),
  'voided_by': instance.voidedBy?.toJson(),
  'void_reason': instance.voidReason,
};

const _$OrderTypeEnumMap = {
  OrderType.dineIn: 'dine_in',
  OrderType.takeaway: 'takeaway',
};

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.void_: 'void',
};
