// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateOrderRequestCWProxy {
  CreateOrderRequest orderId(String orderId);

  CreateOrderRequest orderNo(String orderNo);

  CreateOrderRequest type(OrderType type);

  CreateOrderRequest tableId(String? tableId);

  CreateOrderRequest standNumber(String? standNumber);

  CreateOrderRequest clientCreatedAt(DateTime clientCreatedAt);

  CreateOrderRequest items(List<CreateOrderItem> items);

  CreateOrderRequest voucherCode(String? voucherCode);

  CreateOrderRequest total(int total);

  CreateOrderRequest payment(CreateOrderPayment payment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderRequest call({
    String orderId,
    String orderNo,
    OrderType type,
    String? tableId,
    String? standNumber,
    DateTime clientCreatedAt,
    List<CreateOrderItem> items,
    String? voucherCode,
    int total,
    CreateOrderPayment payment,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateOrderRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateOrderRequest.copyWith.fieldName(...)`
class _$CreateOrderRequestCWProxyImpl implements _$CreateOrderRequestCWProxy {
  const _$CreateOrderRequestCWProxyImpl(this._value);

  final CreateOrderRequest _value;

  @override
  CreateOrderRequest orderId(String orderId) => this(orderId: orderId);

  @override
  CreateOrderRequest orderNo(String orderNo) => this(orderNo: orderNo);

  @override
  CreateOrderRequest type(OrderType type) => this(type: type);

  @override
  CreateOrderRequest tableId(String? tableId) => this(tableId: tableId);

  @override
  CreateOrderRequest standNumber(String? standNumber) =>
      this(standNumber: standNumber);

  @override
  CreateOrderRequest clientCreatedAt(DateTime clientCreatedAt) =>
      this(clientCreatedAt: clientCreatedAt);

  @override
  CreateOrderRequest items(List<CreateOrderItem> items) => this(items: items);

  @override
  CreateOrderRequest voucherCode(String? voucherCode) =>
      this(voucherCode: voucherCode);

  @override
  CreateOrderRequest total(int total) => this(total: total);

  @override
  CreateOrderRequest payment(CreateOrderPayment payment) =>
      this(payment: payment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateOrderRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateOrderRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateOrderRequest call({
    Object? orderId = const $CopyWithPlaceholder(),
    Object? orderNo = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? tableId = const $CopyWithPlaceholder(),
    Object? standNumber = const $CopyWithPlaceholder(),
    Object? clientCreatedAt = const $CopyWithPlaceholder(),
    Object? items = const $CopyWithPlaceholder(),
    Object? voucherCode = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? payment = const $CopyWithPlaceholder(),
  }) {
    return CreateOrderRequest(
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String,
      orderNo: orderNo == const $CopyWithPlaceholder()
          ? _value.orderNo
          // ignore: cast_nullable_to_non_nullable
          : orderNo as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as OrderType,
      tableId: tableId == const $CopyWithPlaceholder()
          ? _value.tableId
          // ignore: cast_nullable_to_non_nullable
          : tableId as String?,
      standNumber: standNumber == const $CopyWithPlaceholder()
          ? _value.standNumber
          // ignore: cast_nullable_to_non_nullable
          : standNumber as String?,
      clientCreatedAt: clientCreatedAt == const $CopyWithPlaceholder()
          ? _value.clientCreatedAt
          // ignore: cast_nullable_to_non_nullable
          : clientCreatedAt as DateTime,
      items: items == const $CopyWithPlaceholder()
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<CreateOrderItem>,
      voucherCode: voucherCode == const $CopyWithPlaceholder()
          ? _value.voucherCode
          // ignore: cast_nullable_to_non_nullable
          : voucherCode as String?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int,
      payment: payment == const $CopyWithPlaceholder()
          ? _value.payment
          // ignore: cast_nullable_to_non_nullable
          : payment as CreateOrderPayment,
    );
  }
}

extension $CreateOrderRequestCopyWith on CreateOrderRequest {
  /// Returns a callable class that can be used as follows: `instanceOfCreateOrderRequest.copyWith(...)` or like so:`instanceOfCreateOrderRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateOrderRequestCWProxy get copyWith =>
      _$CreateOrderRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CreateOrderRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'order_id',
            'order_no',
            'type',
            'client_created_at',
            'items',
            'total',
            'payment',
          ],
        );
        final val = CreateOrderRequest(
          orderId: $checkedConvert('order_id', (v) => v as String),
          orderNo: $checkedConvert('order_no', (v) => v as String),
          type: $checkedConvert(
            'type',
            (v) => $enumDecode(_$OrderTypeEnumMap, v),
          ),
          tableId: $checkedConvert('table_id', (v) => v as String?),
          standNumber: $checkedConvert('stand_number', (v) => v as String?),
          clientCreatedAt: $checkedConvert(
            'client_created_at',
            (v) => DateTime.parse(v as String),
          ),
          items: $checkedConvert(
            'items',
            (v) => (v as List<dynamic>)
                .map((e) => CreateOrderItem.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          voucherCode: $checkedConvert('voucher_code', (v) => v as String?),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
          payment: $checkedConvert(
            'payment',
            (v) => CreateOrderPayment.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'orderId': 'order_id',
        'orderNo': 'order_no',
        'tableId': 'table_id',
        'standNumber': 'stand_number',
        'clientCreatedAt': 'client_created_at',
        'voucherCode': 'voucher_code',
      },
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'type': _$OrderTypeEnumMap[instance.type]!,
      'table_id': ?instance.tableId,
      'stand_number': ?instance.standNumber,
      'client_created_at': instance.clientCreatedAt.toIso8601String(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'voucher_code': ?instance.voucherCode,
      'total': instance.total,
      'payment': instance.payment.toJson(),
    };

const _$OrderTypeEnumMap = {
  OrderType.dineIn: 'dine_in',
  OrderType.takeaway: 'takeaway',
};
