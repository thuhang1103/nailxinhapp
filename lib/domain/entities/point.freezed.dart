// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Point {
  int? get customerID => throw _privateConstructorUsedError;
  int? get loyaltyPoints => throw _privateConstructorUsedError;
  String? get membershipLevel => throw _privateConstructorUsedError;
  DateTime? get lastDailyPointAt => throw _privateConstructorUsedError;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call({
    int? customerID,
    int? loyaltyPoints,
    String? membershipLevel,
    DateTime? lastDailyPointAt,
  });
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Point
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
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
    _$PointImpl value,
    $Res Function(_$PointImpl) then,
  ) = __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? customerID,
    int? loyaltyPoints,
    String? membershipLevel,
    DateTime? lastDailyPointAt,
  });
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
    _$PointImpl _value,
    $Res Function(_$PointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Point
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
      _$PointImpl(
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

class _$PointImpl extends _Point {
  const _$PointImpl({
    this.customerID,
    this.loyaltyPoints,
    this.membershipLevel,
    this.lastDailyPointAt,
  }) : super._();

  @override
  final int? customerID;
  @override
  final int? loyaltyPoints;
  @override
  final String? membershipLevel;
  @override
  final DateTime? lastDailyPointAt;

  @override
  String toString() {
    return 'Point(customerID: $customerID, loyaltyPoints: $loyaltyPoints, membershipLevel: $membershipLevel, lastDailyPointAt: $lastDailyPointAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.membershipLevel, membershipLevel) ||
                other.membershipLevel == membershipLevel) &&
            (identical(other.lastDailyPointAt, lastDailyPointAt) ||
                other.lastDailyPointAt == lastDailyPointAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerID,
    loyaltyPoints,
    membershipLevel,
    lastDailyPointAt,
  );

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);
}

abstract class _Point extends Point {
  const factory _Point({
    final int? customerID,
    final int? loyaltyPoints,
    final String? membershipLevel,
    final DateTime? lastDailyPointAt,
  }) = _$PointImpl;
  const _Point._() : super._();

  @override
  int? get customerID;
  @override
  int? get loyaltyPoints;
  @override
  String? get membershipLevel;
  @override
  DateTime? get lastDailyPointAt;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
