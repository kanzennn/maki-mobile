// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_redemption.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VoucherRedemptionCWProxy {
  VoucherRedemption orderId(String orderId);

  VoucherRedemption orderNo(String orderNo);

  VoucherRedemption outlet(VoucherOutlet outlet);

  VoucherRedemption clientCreatedAt(DateTime clientCreatedAt);

  VoucherRedemption voucherDiscount(int voucherDiscount);

  VoucherRedemption status(OrderStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherRedemption(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherRedemption(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherRedemption call({
    String orderId,
    String orderNo,
    VoucherOutlet outlet,
    DateTime clientCreatedAt,
    int voucherDiscount,
    OrderStatus status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVoucherRedemption.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVoucherRedemption.copyWith.fieldName(...)`
class _$VoucherRedemptionCWProxyImpl implements _$VoucherRedemptionCWProxy {
  const _$VoucherRedemptionCWProxyImpl(this._value);

  final VoucherRedemption _value;

  @override
  VoucherRedemption orderId(String orderId) => this(orderId: orderId);

  @override
  VoucherRedemption orderNo(String orderNo) => this(orderNo: orderNo);

  @override
  VoucherRedemption outlet(VoucherOutlet outlet) => this(outlet: outlet);

  @override
  VoucherRedemption clientCreatedAt(DateTime clientCreatedAt) =>
      this(clientCreatedAt: clientCreatedAt);

  @override
  VoucherRedemption voucherDiscount(int voucherDiscount) =>
      this(voucherDiscount: voucherDiscount);

  @override
  VoucherRedemption status(OrderStatus status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VoucherRedemption(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VoucherRedemption(...).copyWith(id: 12, name: "My name")
  /// ````
  VoucherRedemption call({
    Object? orderId = const $CopyWithPlaceholder(),
    Object? orderNo = const $CopyWithPlaceholder(),
    Object? outlet = const $CopyWithPlaceholder(),
    Object? clientCreatedAt = const $CopyWithPlaceholder(),
    Object? voucherDiscount = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return VoucherRedemption(
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String,
      orderNo: orderNo == const $CopyWithPlaceholder()
          ? _value.orderNo
          // ignore: cast_nullable_to_non_nullable
          : orderNo as String,
      outlet: outlet == const $CopyWithPlaceholder()
          ? _value.outlet
          // ignore: cast_nullable_to_non_nullable
          : outlet as VoucherOutlet,
      clientCreatedAt: clientCreatedAt == const $CopyWithPlaceholder()
          ? _value.clientCreatedAt
          // ignore: cast_nullable_to_non_nullable
          : clientCreatedAt as DateTime,
      voucherDiscount: voucherDiscount == const $CopyWithPlaceholder()
          ? _value.voucherDiscount
          // ignore: cast_nullable_to_non_nullable
          : voucherDiscount as int,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as OrderStatus,
    );
  }
}

extension $VoucherRedemptionCopyWith on VoucherRedemption {
  /// Returns a callable class that can be used as follows: `instanceOfVoucherRedemption.copyWith(...)` or like so:`instanceOfVoucherRedemption.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VoucherRedemptionCWProxy get copyWith =>
      _$VoucherRedemptionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherRedemption _$VoucherRedemptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VoucherRedemption',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'order_id',
            'order_no',
            'outlet',
            'client_created_at',
            'voucher_discount',
            'status',
          ],
        );
        final val = VoucherRedemption(
          orderId: $checkedConvert('order_id', (v) => v as String),
          orderNo: $checkedConvert('order_no', (v) => v as String),
          outlet: $checkedConvert(
            'outlet',
            (v) => VoucherOutlet.fromJson(v as Map<String, dynamic>),
          ),
          clientCreatedAt: $checkedConvert(
            'client_created_at',
            (v) => DateTime.parse(v as String),
          ),
          voucherDiscount: $checkedConvert(
            'voucher_discount',
            (v) => (v as num).toInt(),
          ),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$OrderStatusEnumMap, v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'orderId': 'order_id',
        'orderNo': 'order_no',
        'clientCreatedAt': 'client_created_at',
        'voucherDiscount': 'voucher_discount',
      },
    );

Map<String, dynamic> _$VoucherRedemptionToJson(VoucherRedemption instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_no': instance.orderNo,
      'outlet': instance.outlet.toJson(),
      'client_created_at': instance.clientCreatedAt.toIso8601String(),
      'voucher_discount': instance.voucherDiscount,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.paid: 'paid',
  OrderStatus.void_: 'void',
};
