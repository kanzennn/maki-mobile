// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffCWProxy {
  Staff userId(String userId);

  Staff name(String name);

  Staff username(String username);

  Staff email(String? email);

  Staff phone(String? phone);

  Staff isManager(bool isManager);

  Staff role(StaffRole? role);

  Staff status(StaffStatusEnum status);

  Staff mustChangePassword(bool mustChangePassword);

  Staff lastLoginAt(DateTime? lastLoginAt);

  Staff createdAt(DateTime createdAt);

  Staff updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Staff(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Staff(...).copyWith(id: 12, name: "My name")
  /// ````
  Staff call({
    String userId,
    String name,
    String username,
    String? email,
    String? phone,
    bool isManager,
    StaffRole? role,
    StaffStatusEnum status,
    bool mustChangePassword,
    DateTime? lastLoginAt,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaff.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaff.copyWith.fieldName(...)`
class _$StaffCWProxyImpl implements _$StaffCWProxy {
  const _$StaffCWProxyImpl(this._value);

  final Staff _value;

  @override
  Staff userId(String userId) => this(userId: userId);

  @override
  Staff name(String name) => this(name: name);

  @override
  Staff username(String username) => this(username: username);

  @override
  Staff email(String? email) => this(email: email);

  @override
  Staff phone(String? phone) => this(phone: phone);

  @override
  Staff isManager(bool isManager) => this(isManager: isManager);

  @override
  Staff role(StaffRole? role) => this(role: role);

  @override
  Staff status(StaffStatusEnum status) => this(status: status);

  @override
  Staff mustChangePassword(bool mustChangePassword) =>
      this(mustChangePassword: mustChangePassword);

  @override
  Staff lastLoginAt(DateTime? lastLoginAt) => this(lastLoginAt: lastLoginAt);

  @override
  Staff createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Staff updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Staff(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Staff(...).copyWith(id: 12, name: "My name")
  /// ````
  Staff call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? isManager = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? mustChangePassword = const $CopyWithPlaceholder(),
    Object? lastLoginAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Staff(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      isManager: isManager == const $CopyWithPlaceholder()
          ? _value.isManager
          // ignore: cast_nullable_to_non_nullable
          : isManager as bool,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as StaffRole?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as StaffStatusEnum,
      mustChangePassword: mustChangePassword == const $CopyWithPlaceholder()
          ? _value.mustChangePassword
          // ignore: cast_nullable_to_non_nullable
          : mustChangePassword as bool,
      lastLoginAt: lastLoginAt == const $CopyWithPlaceholder()
          ? _value.lastLoginAt
          // ignore: cast_nullable_to_non_nullable
          : lastLoginAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $StaffCopyWith on Staff {
  /// Returns a callable class that can be used as follows: `instanceOfStaff.copyWith(...)` or like so:`instanceOfStaff.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffCWProxy get copyWith => _$StaffCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staff _$StaffFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Staff',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'user_id',
        'name',
        'username',
        'email',
        'phone',
        'is_manager',
        'role',
        'status',
        'must_change_password',
        'last_login_at',
        'created_at',
        'updated_at',
      ],
    );
    final val = Staff(
      userId: $checkedConvert('user_id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      username: $checkedConvert('username', (v) => v as String),
      email: $checkedConvert('email', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      isManager: $checkedConvert('is_manager', (v) => v as bool),
      role: $checkedConvert(
        'role',
        (v) => v == null ? null : StaffRole.fromJson(v as Map<String, dynamic>),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$StaffStatusEnumEnumMap, v),
      ),
      mustChangePassword: $checkedConvert(
        'must_change_password',
        (v) => v as bool,
      ),
      lastLoginAt: $checkedConvert(
        'last_login_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'isManager': 'is_manager',
    'mustChangePassword': 'must_change_password',
    'lastLoginAt': 'last_login_at',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$StaffToJson(Staff instance) => <String, dynamic>{
  'user_id': instance.userId,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'phone': instance.phone,
  'is_manager': instance.isManager,
  'role': instance.role?.toJson(),
  'status': _$StaffStatusEnumEnumMap[instance.status]!,
  'must_change_password': instance.mustChangePassword,
  'last_login_at': instance.lastLoginAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$StaffStatusEnumEnumMap = {
  StaffStatusEnum.active: 'active',
  StaffStatusEnum.inactive: 'inactive',
};
