// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  @JsonKey(name: 'CustomerID')
  int? get customerID => throw _privateConstructorUsedError;
  @JsonKey(name: 'LoyaltyPoints')
  int? get loyaltyPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastDailyPointAt')
  DateTime? get lastDailyPointAt => throw _privateConstructorUsedError;

  /// Serializes this PointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointModelCopyWith<PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointModelCopyWith<$Res> {
  factory $PointModelCopyWith(
    PointModel value,
    $Res Function(PointModel) then,
  ) = _$PointModelCopyWithImpl<$Res, PointModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'CustomerID') int? customerID,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'LastDailyPointAt') DateTime? lastDailyPointAt,
  });
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res, $Val extends PointModel>
    implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerID = freezed,
    Object? loyaltyPoints = freezed,
    Object? membershipLevel = freezed,
    Object? lastDailyPointAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            customerID: freezed == customerID
                ? _value.customerID
                : customerID // ignore: cast_nullable_to_non_nullable
                      as int?,
            loyaltyPoints: freezed == loyaltyPoints
                ? _value.loyaltyPoints
                : loyaltyPoints // ignore: cast_nullable_to_non_nullable
                      as int?,
            membershipLevel: freezed == membershipLevel
                ? _value.membershipLevel
                : membershipLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastDailyPointAt: freezed == lastDailyPointAt
                ? _value.lastDailyPointAt
                : lastDailyPointAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PointModelImplCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$PointModelImplCopyWith(
    _$PointModelImpl value,
    $Res Function(_$PointModelImpl) then,
  ) = __$$PointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'CustomerID') int? customerID,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'LastDailyPointAt') DateTime? lastDailyPointAt,
  });
}

/// @nodoc
class __$$PointModelImplCopyWithImpl<$Res>
    extends _$PointModelCopyWithImpl<$Res, _$PointModelImpl>
    implements _$$PointModelImplCopyWith<$Res> {
  __$$PointModelImplCopyWithImpl(
    _$PointModelImpl _value,
    $Res Function(_$PointModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerID = freezed,
    Object? loyaltyPoints = freezed,
    Object? membershipLevel = freezed,
    Object? lastDailyPointAt = freezed,
  }) {
    return _then(
      _$PointModelImpl(
        customerID: freezed == customerID
            ? _value.customerID
            : customerID // ignore: cast_nullable_to_non_nullable
                  as int?,
        loyaltyPoints: freezed == loyaltyPoints
            ? _value.loyaltyPoints
            : loyaltyPoints // ignore: cast_nullable_to_non_nullable
                  as int?,
        membershipLevel: freezed == membershipLevel
            ? _value.membershipLevel
            : membershipLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastDailyPointAt: freezed == lastDailyPointAt
            ? _value.lastDailyPointAt
            : lastDailyPointAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PointModelImpl extends _PointModel {
  const _$PointModelImpl({
    @JsonKey(name: 'CustomerID') this.customerID,
    @JsonKey(name: 'LoyaltyPoints') this.loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') this.membershipLevel,
    @JsonKey(name: 'LastDailyPointAt') this.lastDailyPointAt,
  }) : super._();

  factory _$PointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointModelImplFromJson(json);

  @override
  @JsonKey(name: 'CustomerID')
  final int? customerID;
  @override
  @JsonKey(name: 'LoyaltyPoints')
  final int? loyaltyPoints;
  @override
  @JsonKey(name: 'MembershipLevel')
  final String? membershipLevel;
  @override
  @JsonKey(name: 'LastDailyPointAt')
  final DateTime? lastDailyPointAt;

  @override
  String toString() {
    return 'PointModel(customerID: $customerID, loyaltyPoints: $loyaltyPoints, membershipLevel: $membershipLevel, lastDailyPointAt: $lastDailyPointAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointModelImpl &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.membershipLevel, membershipLevel) ||
                other.membershipLevel == membershipLevel) &&
            (identical(other.lastDailyPointAt, lastDailyPointAt) ||
                other.lastDailyPointAt == lastDailyPointAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerID,
    loyaltyPoints,
    membershipLevel,
    lastDailyPointAt,
  );

  /// Create a copy of PointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointModelImplCopyWith<_$PointModelImpl> get copyWith =>
      __$$PointModelImplCopyWithImpl<_$PointModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointModelImplToJson(this);
  }
}

abstract class _PointModel extends PointModel {
  const factory _PointModel({
    @JsonKey(name: 'CustomerID') final int? customerID,
    @JsonKey(name: 'LoyaltyPoints') final int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') final String? membershipLevel,
    @JsonKey(name: 'LastDailyPointAt') final DateTime? lastDailyPointAt,
  }) = _$PointModelImpl;
  const _PointModel._() : super._();

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$PointModelImpl.fromJson;

  @override
  @JsonKey(name: 'CustomerID')
  int? get customerID;
  @override
  @JsonKey(name: 'LoyaltyPoints')
  int? get loyaltyPoints;
  @override
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel;
  @override
  @JsonKey(name: 'LastDailyPointAt')
  DateTime? get lastDailyPointAt;

  /// Create a copy of PointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointModelImplCopyWith<_$PointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
