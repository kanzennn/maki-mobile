// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_adjustment_input.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockAdjustmentInputCWProxy {
  StockAdjustmentInput type(StockAdjustmentInputTypeEnum type);

  StockAdjustmentInput qty(int qty);

  StockAdjustmentInput reason(StockAdjustmentInputReasonEnum reason);

  StockAdjustmentInput note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockAdjustmentInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockAdjustmentInput(...).copyWith(id: 12, name: "My name")
  /// ````
  StockAdjustmentInput call({
    StockAdjustmentInputTypeEnum type,
    int qty,
    StockAdjustmentInputReasonEnum reason,
    String? note,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockAdjustmentInput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockAdjustmentInput.copyWith.fieldName(...)`
class _$StockAdjustmentInputCWProxyImpl
    implements _$StockAdjustmentInputCWProxy {
  const _$StockAdjustmentInputCWProxyImpl(this._value);

  final StockAdjustmentInput _value;

  @override
  StockAdjustmentInput type(StockAdjustmentInputTypeEnum type) =>
      this(type: type);

  @override
  StockAdjustmentInput qty(int qty) => this(qty: qty);

  @override
  StockAdjustmentInput reason(StockAdjustmentInputReasonEnum reason) =>
      this(reason: reason);

  @override
  StockAdjustmentInput note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockAdjustmentInput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockAdjustmentInput(...).copyWith(id: 12, name: "My name")
  /// ````
  StockAdjustmentInput call({
    Object? type = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
    Object? reason = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return StockAdjustmentInput(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as StockAdjustmentInputTypeEnum,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as StockAdjustmentInputReasonEnum,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $StockAdjustmentInputCopyWith on StockAdjustmentInput {
  /// Returns a callable class that can be used as follows: `instanceOfStockAdjustmentInput.copyWith(...)` or like so:`instanceOfStockAdjustmentInput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockAdjustmentInputCWProxy get copyWith =>
      _$StockAdjustmentInputCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockAdjustmentInput _$StockAdjustmentInputFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StockAdjustmentInput', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['type', 'qty', 'reason']);
  final val = StockAdjustmentInput(
    type: $checkedConvert(
      'type',
      (v) => $enumDecode(_$StockAdjustmentInputTypeEnumEnumMap, v),
    ),
    qty: $checkedConvert('qty', (v) => (v as num).toInt()),
    reason: $checkedConvert(
      'reason',
      (v) => $enumDecode(_$StockAdjustmentInputReasonEnumEnumMap, v),
    ),
    note: $checkedConvert('note', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$StockAdjustmentInputToJson(
  StockAdjustmentInput instance,
) => <String, dynamic>{
  'type': _$StockAdjustmentInputTypeEnumEnumMap[instance.type]!,
  'qty': instance.qty,
  'reason': _$StockAdjustmentInputReasonEnumEnumMap[instance.reason]!,
  'note': ?instance.note,
};

const _$StockAdjustmentInputTypeEnumEnumMap = {
  StockAdjustmentInputTypeEnum.in_: 'in',
  StockAdjustmentInputTypeEnum.out_: 'out',
  StockAdjustmentInputTypeEnum.set_: 'set',
};

const _$StockAdjustmentInputReasonEnumEnumMap = {
  StockAdjustmentInputReasonEnum.restock: 'restock',
  StockAdjustmentInputReasonEnum.damaged: 'damaged',
  StockAdjustmentInputReasonEnum.correction: 'correction',
  StockAdjustmentInputReasonEnum.other: 'other',
};
