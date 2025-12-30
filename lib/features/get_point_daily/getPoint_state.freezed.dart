// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'getPoint_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetPointState {
  int get point => throw _privateConstructorUsedError;
  String? get membershipLevel => throw _privateConstructorUsedError;
  int get canClaimToday => throw _privateConstructorUsedError;
  bool get canSpin => throw _privateConstructorUsedError;
  int? get lastSpinResult => throw _privateConstructorUsedError;
  CommonState get pointState => throw _privateConstructorUsedError;

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPointStateCopyWith<GetPointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPointStateCopyWith<$Res> {
  factory $GetPointStateCopyWith(
    GetPointState value,
    $Res Function(GetPointState) then,
  ) = _$GetPointStateCopyWithImpl<$Res, GetPointState>;
  @useResult
  $Res call({
    int point,
    String? membershipLevel,
    int canClaimToday,
    bool canSpin,
    int? lastSpinResult,
    CommonState pointState,
  });

  $CommonStateCopyWith<$Res> get pointState;
}

/// @nodoc
class _$GetPointStateCopyWithImpl<$Res, $Val extends GetPointState>
    implements $GetPointStateCopyWith<$Res> {
  _$GetPointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? membershipLevel = freezed,
    Object? canClaimToday = null,
    Object? canSpin = null,
    Object? lastSpinResult = freezed,
    Object? pointState = null,
  }) {
    return _then(
      _value.copyWith(
            point: null == point
                ? _value.point
                : point // ignore: cast_nullable_to_non_nullable
                      as int,
            membershipLevel: freezed == membershipLevel
                ? _value.membershipLevel
                : membershipLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            canClaimToday: null == canClaimToday
                ? _value.canClaimToday
                : canClaimToday // ignore: cast_nullable_to_non_nullable
                      as int,
            canSpin: null == canSpin
                ? _value.canSpin
                : canSpin // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastSpinResult: freezed == lastSpinResult
                ? _value.lastSpinResult
                : lastSpinResult // ignore: cast_nullable_to_non_nullable
                      as int?,
            pointState: null == pointState
                ? _value.pointState
                : pointState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get pointState {
    return $CommonStateCopyWith<$Res>(_value.pointState, (value) {
      return _then(_value.copyWith(pointState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetPointStateImplCopyWith<$Res>
    implements $GetPointStateCopyWith<$Res> {
  factory _$$GetPointStateImplCopyWith(
    _$GetPointStateImpl value,
    $Res Function(_$GetPointStateImpl) then,
  ) = __$$GetPointStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int point,
    String? membershipLevel,
    int canClaimToday,
    bool canSpin,
    int? lastSpinResult,
    CommonState pointState,
  });

  @override
  $CommonStateCopyWith<$Res> get pointState;
}

/// @nodoc
class __$$GetPointStateImplCopyWithImpl<$Res>
    extends _$GetPointStateCopyWithImpl<$Res, _$GetPointStateImpl>
    implements _$$GetPointStateImplCopyWith<$Res> {
  __$$GetPointStateImplCopyWithImpl(
    _$GetPointStateImpl _value,
    $Res Function(_$GetPointStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? membershipLevel = freezed,
    Object? canClaimToday = null,
    Object? canSpin = null,
    Object? lastSpinResult = freezed,
    Object? pointState = null,
  }) {
    return _then(
      _$GetPointStateImpl(
        point: null == point
            ? _value.point
            : point // ignore: cast_nullable_to_non_nullable
                  as int,
        membershipLevel: freezed == membershipLevel
            ? _value.membershipLevel
            : membershipLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        canClaimToday: null == canClaimToday
            ? _value.canClaimToday
            : canClaimToday // ignore: cast_nullable_to_non_nullable
                  as int,
        canSpin: null == canSpin
            ? _value.canSpin
            : canSpin // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastSpinResult: freezed == lastSpinResult
            ? _value.lastSpinResult
            : lastSpinResult // ignore: cast_nullable_to_non_nullable
                  as int?,
        pointState: null == pointState
            ? _value.pointState
            : pointState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$GetPointStateImpl implements _GetPointState {
  const _$GetPointStateImpl({
    this.point = 0,
    this.membershipLevel = 'hạng đồng',
    this.canClaimToday = 1,
    this.canSpin = false,
    this.lastSpinResult,
    this.pointState = const CommonState.initial(),
  });

  @override
  @JsonKey()
  final int point;
  @override
  @JsonKey()
  final String? membershipLevel;
  @override
  @JsonKey()
  final int canClaimToday;
  @override
  @JsonKey()
  final bool canSpin;
  @override
  final int? lastSpinResult;
  @override
  @JsonKey()
  final CommonState pointState;

  @override
  String toString() {
    return 'GetPointState(point: $point, membershipLevel: $membershipLevel, canClaimToday: $canClaimToday, canSpin: $canSpin, lastSpinResult: $lastSpinResult, pointState: $pointState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPointStateImpl &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.membershipLevel, membershipLevel) ||
                other.membershipLevel == membershipLevel) &&
            (identical(other.canClaimToday, canClaimToday) ||
                other.canClaimToday == canClaimToday) &&
            (identical(other.canSpin, canSpin) || other.canSpin == canSpin) &&
            (identical(other.lastSpinResult, lastSpinResult) ||
                other.lastSpinResult == lastSpinResult) &&
            (identical(other.pointState, pointState) ||
                other.pointState == pointState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    point,
    membershipLevel,
    canClaimToday,
    canSpin,
    lastSpinResult,
    pointState,
  );

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPointStateImplCopyWith<_$GetPointStateImpl> get copyWith =>
      __$$GetPointStateImplCopyWithImpl<_$GetPointStateImpl>(this, _$identity);
}

abstract class _GetPointState implements GetPointState {
  const factory _GetPointState({
    final int point,
    final String? membershipLevel,
    final int canClaimToday,
    final bool canSpin,
    final int? lastSpinResult,
    final CommonState pointState,
  }) = _$GetPointStateImpl;

  @override
  int get point;
  @override
  String? get membershipLevel;
  @override
  int get canClaimToday;
  @override
  bool get canSpin;
  @override
  int? get lastSpinResult;
  @override
  CommonState get pointState;

  /// Create a copy of GetPointState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPointStateImplCopyWith<_$GetPointStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
