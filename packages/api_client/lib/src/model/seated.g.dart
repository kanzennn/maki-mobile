// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seated.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SeatedCWProxy {
  Seated since(DateTime since);

  Seated orders(int orders);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seated(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seated(...).copyWith(id: 12, name: "My name")
  /// ````
  Seated call({DateTime since, int orders});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSeated.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSeated.copyWith.fieldName(...)`
class _$SeatedCWProxyImpl implements _$SeatedCWProxy {
  const _$SeatedCWProxyImpl(this._value);

  final Seated _value;

  @override
  Seated since(DateTime since) => this(since: since);

  @override
  Seated orders(int orders) => this(orders: orders);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Seated(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Seated(...).copyWith(id: 12, name: "My name")
  /// ````
  Seated call({
    Object? since = const $CopyWithPlaceholder(),
    Object? orders = const $CopyWithPlaceholder(),
  }) {
    return Seated(
      since: since == const $CopyWithPlaceholder()
          ? _value.since
          // ignore: cast_nullable_to_non_nullable
          : since as DateTime,
      orders: orders == const $CopyWithPlaceholder()
          ? _value.orders
          // ignore: cast_nullable_to_non_nullable
          : orders as int,
    );
  }
}

extension $SeatedCopyWith on Seated {
  /// Returns a callable class that can be used as follows: `instanceOfSeated.copyWith(...)` or like so:`instanceOfSeated.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SeatedCWProxy get copyWith => _$SeatedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seated _$SeatedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Seated', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['since', 'orders']);
      final val = Seated(
        since: $checkedConvert('since', (v) => DateTime.parse(v as String)),
        orders: $checkedConvert('orders', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$SeatedToJson(Seated instance) => <String, dynamic>{
  'since': instance.since.toIso8601String(),
  'orders': instance.orders,
};
