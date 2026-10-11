// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderSummaryCWProxy {
  OrderSummary orderId(String orderId);

  OrderSummary orderNo(String orderNo);

  OrderSummary deviceId(String deviceId);

  OrderSummary type(OrderType type);

  OrderSummary tableName(String? tableName);

  OrderSummary standNumber(String? standNumber);

  OrderSummary status(OrderStatus status);

  OrderSummary total(int total);

  OrderSummary itemCount(int itemCount);

  OrderSummary paymentMethod(PaymentMethod paymentMethod);

  OrderSummary cashier(OrderPerson cashier);

  OrderSummary clientCreatedAt(DateTime clientCreatedAt);

  OrderSummary createdAt(DateTime createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderSummary call({
    String orderId,
    String orderNo,
    String deviceId,
    OrderType type,
    String? tableName,
    String? standNumber,
    OrderStatus status,
    int total,
    int itemCount,
    PaymentMethod paymentMethod,
    OrderPerson cashier,
    DateTime clientCreatedAt,
    DateTime createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderSummary.copyWith.fieldName(...)`
class _$OrderSummaryCWProxyImpl implements _$OrderSummaryCWProxy {
  const _$OrderSummaryCWProxyImpl(this._value);

  final OrderSummary _value;

  @override
  OrderSummary orderId(String orderId) => this(orderId: orderId);

  @override
  OrderSummary orderNo(String orderNo) => this(orderNo: orderNo);

  @override
  OrderSummary deviceId(String deviceId) => this(deviceId: deviceId);

  @override
  OrderSummary type(OrderType type) => this(type: type);

  @override
  OrderSummary tableName(String? tableName) => this(tableName: tableName);

  @override
  OrderSummary standNumber(String? standNumber) =>
      this(standNumber: standNumber);

  @override
  OrderSummary status(OrderStatus status) => this(status: status);

  @override
  OrderSummary total(int total) => this(total: total);

  @override
  OrderSummary itemCount(int itemCount) => this(itemCount: itemCount);

  @override
  OrderSummary paymentMethod(PaymentMethod paymentMethod) =>
      this(paymentMethod: paymentMethod);

  @override
  OrderSummary cashier(OrderPerson cashier) => this(cashier: cashier);

  @override
  OrderSummary clientCreatedAt(DateTime clientCreatedAt) =>
      this(clientCreatedAt: clientCreatedAt);

  @override
  OrderSummary createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderSummary call({
    Object? orderId = const $CopyWithPlaceholder(),
    Object? orderNo = const $CopyWithPlaceholder(),
    Object? deviceId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? tableName = const $CopyWithPlaceholder(),
    Object? standNumber = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? itemCount = const $CopyWithPlaceholder(),
    Object? paymentMethod = const $CopyWithPlaceholder(),
    Object? cashier = const $CopyWithPlaceholder(),
    Object? clientCreatedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return OrderSummary(
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
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      itemCount: itemCount == const $CopyWithPlaceholder()
          ? _value.itemCount
          // ignore: cast_nullable_to_non_nullable
          : itemCount as int,
      paymentMethod: paymentMethod == const $CopyWithPlaceholder()
          ? _value.paymentMethod
          // ignore: cast_nullable_to_non_nullable
          : paymentMethod as PaymentMethod,
      cashier: cashier == const $CopyWithPlaceholder()
          ? _value.cashier
          // ignore: cast_nullable_to_non_nullable
          : cashier as OrderPerson,
      clientCreatedAt: clientCreatedAt == const $CopyWithPlaceholder()
          ? _value.clientCreatedAt
          // ignore: cast_nullable_to_non_nullable
          : clientCreatedAt as DateTime,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $OrderSummaryCopyWith on OrderSummary {
  /// Returns a callable class that can be used as follows: `instanceOfOrderSummary.copyWith(...)` or like so:`instanceOfOrderSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderSummaryCWProxy get copyWith => _$OrderSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OrderSummary',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'order_id',
            'order_no',
            'device_id',
            'type',
            'table_name',
            'stand_number',
            'status',
            'total',
            'item_count',
            'payment_method',
            'cashier',
            'client_created_at',
            'created_at',
          ],
        );
        final val = OrderSummary(
          orderId: $checkedConvert('order_id', (v) => v as String),
          orderNo: $checkedConvert('order_no', (v) => v as String),
          deviceId: $checkedConvert('device_id', (v) => v as String),
          type: $checkedConvert(
            'type',
            (v) => $enumDecode(_$OrderTypeEnumMap, v),
          ),
          tableName: $checkedConvert('table_name', (v) => v as String?),
          standNumber: $checkedConvert('stand_number', (v) => v as String?),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$OrderStatusEnumMap, v),
          ),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
          itemCount: $checkedConvert('item_count', (v) => (v as num).toInt()),
          paymentMethod: $checkedConvert(
            'payment_method',
            (v) => $enumDecode(_$PaymentMethodEnumMap, v),
          ),
          cashier: $checkedConvert(
            'cashier',
            (v) => OrderPerson.fromJson(v as Map<String, dynamic>),
          ),
          clientCreatedAt: $checkedConvert(
            'client_created_at',
            (v) => DateTime.parse(v as String),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'orderId': 'order_id',
        'orderNo': 'order_no',
        'deviceId': 'device_id',
        'tableName': 'table_name',
        'standNumber': 'stand_number',
        'itemCount': 'item_count',
        'paymentMethod': 'payment_method',
        'clientCreatedAt': 'client_created_at',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$OrderSummaryToJson(OrderSummary instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'device_id': instance.deviceId,
      'type': _$OrderTypeEnumMap[instance.type]!,
      'table_name': instance.tableName,
      'stand_number': instance.standNumber,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'total': instance.total,
      'item_count': instance.itemCount,
      'payment_method': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'cashier': instance.cashier.toJson(),
      'client_created_at': instance.clientCreatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$OrderTypeEnumMap = {
  OrderType.dineIn: 'dine_in',
  OrderType.takeaway: 'takeaway',
};

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.void_: 'void',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.qris: 'qris',
  PaymentMethod.debit: 'debit',
};
