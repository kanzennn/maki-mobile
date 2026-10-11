// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockMovementUserCWProxy {
  StockMovementUser userId(String userId);

  StockMovementUser name(String name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovementUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovementUser(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovementUser call({String userId, String name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockMovementUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockMovementUser.copyWith.fieldName(...)`
class _$StockMovementUserCWProxyImpl implements _$StockMovementUserCWProxy {
  const _$StockMovementUserCWProxyImpl(this._value);

  final StockMovementUser _value;

  @override
  StockMovementUser userId(String userId) => this(userId: userId);

  @override
  StockMovementUser name(String name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockMovementUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockMovementUser(...).copyWith(id: 12, name: "My name")
  /// ````
  StockMovementUser call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return StockMovementUser(
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

extension $StockMovementUserCopyWith on StockMovementUser {
  /// Returns a callable class that can be used as follows: `instanceOfStockMovementUser.copyWith(...)` or like so:`instanceOfStockMovementUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockMovementUserCWProxy get copyWith =>
      _$StockMovementUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockMovementUser _$StockMovementUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StockMovementUser', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['user_id', 'name']);
      final val = StockMovementUser(
        userId: $checkedConvert('user_id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$StockMovementUserToJson(StockMovementUser instance) =>
    <String, dynamic>{'user_id': instance.userId, 'name': instance.name};
