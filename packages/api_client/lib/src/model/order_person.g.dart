// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_person.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OrderPersonCWProxy {
  OrderPerson userId(String userId);

  OrderPerson name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderPerson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderPerson(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderPerson call({String userId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOrderPerson.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOrderPerson.copyWith.fieldName(...)`
class _$OrderPersonCWProxyImpl implements _$OrderPersonCWProxy {
  const _$OrderPersonCWProxyImpl(this._value);

  final OrderPerson _value;

  @override
  OrderPerson userId(String userId) => this(userId: userId);

  @override
  OrderPerson name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OrderPerson(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OrderPerson(...).copyWith(id: 12, name: "My name")
  /// ````
  OrderPerson call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return OrderPerson(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $OrderPersonCopyWith on OrderPerson {
  /// Returns a callable class that can be used as follows: `instanceOfOrderPerson.copyWith(...)` or like so:`instanceOfOrderPerson.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OrderPersonCWProxy get copyWith => _$OrderPersonCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPerson _$OrderPersonFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderPerson', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name']);
      final val = OrderPerson(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$OrderPersonToJson(OrderPerson instance) =>
    <String, dynamic>{'user_id': instance.userId, 'name': instance.name};
