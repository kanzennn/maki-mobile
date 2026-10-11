// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockMovementCWProxy {
  StockMovement stockMovementId(String stockMovementId);

  StockMovement type(StockMovementTypeEnum type);

  StockMovement qtyChange(int qtyChange);

  StockMovement stockAfter(int stockAfter);

  StockMovement reason(StockMovementReasonEnum? reason);

  StockMovement note(String? note);

  StockMovement user(StockMovementUser user);

  StockMovement orderId(String? orderId);

  StockMovement createdAt(DateTime createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovement(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovement call({
    String stockMovementId,
    StockMovementTypeEnum type,
    int qtyChange,
    int stockAfter,
    StockMovementReasonEnum? reason,
    String? note,
    StockMovementUser user,
    String? orderId,
    DateTime createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockMovement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockMovement.copyWith.fieldName(...)`
class _$StockMovementCWProxyImpl implements _$StockMovementCWProxy {
  const _$StockMovementCWProxyImpl(this._value);

  final StockMovement _value;

  @override
  StockMovement stockMovementId(String stockMovementId) =>
      this(stockMovementId: stockMovementId);

  @override
  StockMovement type(StockMovementTypeEnum type) => this(type: type);

  @override
  StockMovement qtyChange(int qtyChange) => this(qtyChange: qtyChange);

  @override
  StockMovement stockAfter(int stockAfter) => this(stockAfter: stockAfter);

  @override
  StockMovement reason(StockMovementReasonEnum? reason) => this(reason: reason);

  @override
  StockMovement note(String? note) => this(note: note);

  @override
  StockMovement user(StockMovementUser user) => this(user: user);

  @override
  StockMovement orderId(String? orderId) => this(orderId: orderId);

  @override
  StockMovement createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovement(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovement call({
    Object? stockMovementId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? qtyChange = const $CopyWithPlaceholder(),
    Object? stockAfter = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return StockMovement(
      stockMovementId: stockMovementId == const $CopyWithPlaceholder()
          ? _value.stockMovementId
          // ignore: cast_nullable_to_non_nullable
          : stockMovementId as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as StockMovementTypeEnum,
      qtyChange: qtyChange == const $CopyWithPlaceholder()
          ? _value.qtyChange
          // ignore: cast_nullable_to_non_nullable
          : qtyChange as int,
      stockAfter: stockAfter == const $CopyWithPlaceholder()
          ? _value.stockAfter
          // ignore: cast_nullable_to_non_nullable
          : stockAfter as int,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as StockMovementReasonEnum?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as StockMovementUser,
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $StockMovementCopyWith on StockMovement {
  /// Returns a callable class that can be used as follows: `instanceOfStockMovement.copyWith(...)` or like so:`instanceOfStockMovement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockMovementCWProxy get copyWith => _$StockMovementCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockMovement _$StockMovementFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StockMovement',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'stock_movement_id',
            'type',
            'qty_change',
            'stock_after',
            'reason',
            'note',
            'user',
            'order_id',
            'created_at',
          ],
        );
        final val = StockMovement(
          stockMovementId: $checkedConvert(
            'stock_movement_id',
            (v) => v as String,
          ),
          type: $checkedConvert(
            'type',
            (v) => $enumDecode(_$StockMovementTypeEnumEnumMap, v),
          ),
          qtyChange: $checkedConvert('qty_change', (v) => (v as num).toInt()),
          stockAfter: $checkedConvert('stock_after', (v) => (v as num).toInt()),
          reason: $checkedConvert(
            'reason',
            (v) => $enumDecodeNullable(_$StockMovementReasonEnumEnumMap, v),
          ),
          note: $checkedConvert('note', (v) => v as String?),
          user: $checkedConvert(
            'user',
            (v) => StockMovementUser.fromJson(v as Map<String, dynamic>),
          ),
          orderId: $checkedConvert('order_id', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stockMovementId': 'stock_movement_id',
        'qtyChange': 'qty_change',
        'stockAfter': 'stock_after',
        'orderId': 'order_id',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$StockMovementToJson(StockMovement instance) =>
    <String, dynamic>{
      'stock_movement_id': instance.stockMovementId,
      'type': _$StockMovementTypeEnumEnumMap[instance.type]!,
      'qty_change': instance.qtyChange,
      'stock_after': instance.stockAfter,
      'reason': _$StockMovementReasonEnumEnumMap[instance.reason],
      'note': instance.note,
      'user': instance.user.toJson(),
      'order_id': instance.orderId,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$StockMovementTypeEnumEnumMap = {
  StockMovementTypeEnum.initial: 'initial',
  StockMovementTypeEnum.in_: 'in',
  StockMovementTypeEnum.out_: 'out',
  StockMovementTypeEnum.set_: 'set',
  StockMovementTypeEnum.sale: 'sale',
  StockMovementTypeEnum.void_: 'void',
};

const _$StockMovementReasonEnumEnumMap = {
  StockMovementReasonEnum.initial: 'initial',
  StockMovementReasonEnum.restock: 'restock',
  StockMovementReasonEnum.damaged: 'damaged',
  StockMovementReasonEnum.correction: 'correction',
  StockMovementReasonEnum.other: 'other',
};
