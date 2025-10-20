// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  @JsonKey(name: 'CustomerID')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LoyaltyPoints')
  int? get loyaltyPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarImage')
  String? get avatarImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'Role')
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
    CustomerModel value,
    $Res Function(CustomerModel) then,
  ) = _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'avatarImage') String? avatarImage,
    @JsonKey(name: 'Role') String? role,
  });
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? fullName = freezed,
    Object? loyaltyPoints = freezed,
    Object? membershipLevel = freezed,
    Object? createdAt = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarImage = freezed,
    Object? role = freezed,
  }) {
    return _then(
      _value.copyWith(
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            loyaltyPoints: freezed == loyaltyPoints
                ? _value.loyaltyPoints
                : loyaltyPoints // ignore: cast_nullable_to_non_nullable
                      as int?,
            membershipLevel: freezed == membershipLevel
                ? _value.membershipLevel
                : membershipLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarImage: freezed == avatarImage
                ? _value.avatarImage
                : avatarImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerModelImplCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$CustomerModelImplCopyWith(
    _$CustomerModelImpl value,
    $Res Function(_$CustomerModelImpl) then,
  ) = __$$CustomerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'CustomerID') int? customerId,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'avatarImage') String? avatarImage,
    @JsonKey(name: 'Role') String? role,
  });
}

/// @nodoc
class __$$CustomerModelImplCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$CustomerModelImpl>
    implements _$$CustomerModelImplCopyWith<$Res> {
  __$$CustomerModelImplCopyWithImpl(
    _$CustomerModelImpl _value,
    $Res Function(_$CustomerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? fullName = freezed,
    Object? loyaltyPoints = freezed,
    Object? membershipLevel = freezed,
    Object? createdAt = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatarImage = freezed,
    Object? role = freezed,
  }) {
    return _then(
      _$CustomerModelImpl(
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        loyaltyPoints: freezed == loyaltyPoints
            ? _value.loyaltyPoints
            : loyaltyPoints // ignore: cast_nullable_to_non_nullable
                  as int?,
        membershipLevel: freezed == membershipLevel
            ? _value.membershipLevel
            : membershipLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarImage: freezed == avatarImage
            ? _value.avatarImage
            : avatarImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerModelImpl extends _CustomerModel {
  const _$CustomerModelImpl({
    @JsonKey(name: 'CustomerID') this.customerId,
    @JsonKey(name: 'FullName') this.fullName,
    @JsonKey(name: 'LoyaltyPoints') this.loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') this.membershipLevel,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'Email') this.email,
    @JsonKey(name: 'Phone') this.phone,
    @JsonKey(name: 'avatarImage') this.avatarImage,
    @JsonKey(name: 'Role') this.role,
  }) : super._();

  factory _$CustomerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerModelImplFromJson(json);

  @override
  @JsonKey(name: 'CustomerID')
  final int? customerId;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'LoyaltyPoints')
  final int? loyaltyPoints;
  @override
  @JsonKey(name: 'MembershipLevel')
  final String? membershipLevel;
  @override
  @JsonKey(name: 'CreatedAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'Phone')
  final String? phone;
  @override
  @JsonKey(name: 'avatarImage')
  final String? avatarImage;
  @override
  @JsonKey(name: 'Role')
  final String? role;

  @override
  String toString() {
    return 'CustomerModel(customerId: $customerId, fullName: $fullName, loyaltyPoints: $loyaltyPoints, membershipLevel: $membershipLevel, createdAt: $createdAt, email: $email, phone: $phone, avatarImage: $avatarImage, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerModelImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.membershipLevel, membershipLevel) ||
                other.membershipLevel == membershipLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatarImage, avatarImage) ||
                other.avatarImage == avatarImage) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerId,
    fullName,
    loyaltyPoints,
    membershipLevel,
    createdAt,
    email,
    phone,
    avatarImage,
    role,
  );

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      __$$CustomerModelImplCopyWithImpl<_$CustomerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerModelImplToJson(this);
  }
}

abstract class _CustomerModel extends CustomerModel {
  const factory _CustomerModel({
    @JsonKey(name: 'CustomerID') final int? customerId,
    @JsonKey(name: 'FullName') final String? fullName,
    @JsonKey(name: 'LoyaltyPoints') final int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') final String? membershipLevel,
    @JsonKey(name: 'CreatedAt') final String? createdAt,
    @JsonKey(name: 'Email') final String? email,
    @JsonKey(name: 'Phone') final String? phone,
    @JsonKey(name: 'avatarImage') final String? avatarImage,
    @JsonKey(name: 'Role') final String? role,
  }) = _$CustomerModelImpl;
  const _CustomerModel._() : super._();

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$CustomerModelImpl.fromJson;

  @override
  @JsonKey(name: 'CustomerID')
  int? get customerId;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'LoyaltyPoints')
  int? get loyaltyPoints;
  @override
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel;
  @override
  @JsonKey(name: 'CreatedAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'Phone')
  String? get phone;
  @override
  @JsonKey(name: 'avatarImage')
  String? get avatarImage;
  @override
  @JsonKey(name: 'Role')
  String? get role;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerModelImplCopyWith<_$CustomerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
