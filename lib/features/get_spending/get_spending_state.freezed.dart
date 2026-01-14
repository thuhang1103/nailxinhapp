// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_spending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetSpendingState {
  List<MonthlySpending> get monthly => throw _privateConstructorUsedError;
  double get totalMonth => throw _privateConstructorUsedError;
  double get totalYear => throw _privateConstructorUsedError;
  int get countMonth => throw _privateConstructorUsedError;
  int get countYear => throw _privateConstructorUsedError;
  CommonState get getSpendingState => throw _privateConstructorUsedError;

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSpendingStateCopyWith<GetSpendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSpendingStateCopyWith<$Res> {
  factory $GetSpendingStateCopyWith(
    GetSpendingState value,
    $Res Function(GetSpendingState) then,
  ) = _$GetSpendingStateCopyWithImpl<$Res, GetSpendingState>;
  @useResult
  $Res call({
    List<MonthlySpending> monthly,
    double totalMonth,
    double totalYear,
    int countMonth,
    int countYear,
    CommonState getSpendingState,
  });

  $CommonStateCopyWith<$Res> get getSpendingState;
}

/// @nodoc
class _$GetSpendingStateCopyWithImpl<$Res, $Val extends GetSpendingState>
    implements $GetSpendingStateCopyWith<$Res> {
  _$GetSpendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthly = null,
    Object? totalMonth = null,
    Object? totalYear = null,
    Object? countMonth = null,
    Object? countYear = null,
    Object? getSpendingState = null,
  }) {
    return _then(
      _value.copyWith(
            monthly: null == monthly
                ? _value.monthly
                : monthly // ignore: cast_nullable_to_non_nullable
                      as List<MonthlySpending>,
            totalMonth: null == totalMonth
                ? _value.totalMonth
                : totalMonth // ignore: cast_nullable_to_non_nullable
                      as double,
            totalYear: null == totalYear
                ? _value.totalYear
                : totalYear // ignore: cast_nullable_to_non_nullable
                      as double,
            countMonth: null == countMonth
                ? _value.countMonth
                : countMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            countYear: null == countYear
                ? _value.countYear
                : countYear // ignore: cast_nullable_to_non_nullable
                      as int,
            getSpendingState: null == getSpendingState
                ? _value.getSpendingState
                : getSpendingState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getSpendingState {
    return $CommonStateCopyWith<$Res>(_value.getSpendingState, (value) {
      return _then(_value.copyWith(getSpendingState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetSpendingStateImplCopyWith<$Res>
    implements $GetSpendingStateCopyWith<$Res> {
  factory _$$GetSpendingStateImplCopyWith(
    _$GetSpendingStateImpl value,
    $Res Function(_$GetSpendingStateImpl) then,
  ) = __$$GetSpendingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<MonthlySpending> monthly,
    double totalMonth,
    double totalYear,
    int countMonth,
    int countYear,
    CommonState getSpendingState,
  });

  @override
  $CommonStateCopyWith<$Res> get getSpendingState;
}

/// @nodoc
class __$$GetSpendingStateImplCopyWithImpl<$Res>
    extends _$GetSpendingStateCopyWithImpl<$Res, _$GetSpendingStateImpl>
    implements _$$GetSpendingStateImplCopyWith<$Res> {
  __$$GetSpendingStateImplCopyWithImpl(
    _$GetSpendingStateImpl _value,
    $Res Function(_$GetSpendingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthly = null,
    Object? totalMonth = null,
    Object? totalYear = null,
    Object? countMonth = null,
    Object? countYear = null,
    Object? getSpendingState = null,
  }) {
    return _then(
      _$GetSpendingStateImpl(
        monthly: null == monthly
            ? _value._monthly
            : monthly // ignore: cast_nullable_to_non_nullable
                  as List<MonthlySpending>,
        totalMonth: null == totalMonth
            ? _value.totalMonth
            : totalMonth // ignore: cast_nullable_to_non_nullable
                  as double,
        totalYear: null == totalYear
            ? _value.totalYear
            : totalYear // ignore: cast_nullable_to_non_nullable
                  as double,
        countMonth: null == countMonth
            ? _value.countMonth
            : countMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        countYear: null == countYear
            ? _value.countYear
            : countYear // ignore: cast_nullable_to_non_nullable
                  as int,
        getSpendingState: null == getSpendingState
            ? _value.getSpendingState
            : getSpendingState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$GetSpendingStateImpl implements _GetSpendingState {
  const _$GetSpendingStateImpl({
    final List<MonthlySpending> monthly = const [],
    this.totalMonth = 0,
    this.totalYear = 0,
    this.countMonth = 0,
    this.countYear = 0,
    this.getSpendingState = const CommonState.initial(),
  }) : _monthly = monthly;

  final List<MonthlySpending> _monthly;
  @override
  @JsonKey()
  List<MonthlySpending> get monthly {
    if (_monthly is EqualUnmodifiableListView) return _monthly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthly);
  }

  @override
  @JsonKey()
  final double totalMonth;
  @override
  @JsonKey()
  final double totalYear;
  @override
  @JsonKey()
  final int countMonth;
  @override
  @JsonKey()
  final int countYear;
  @override
  @JsonKey()
  final CommonState getSpendingState;

  @override
  String toString() {
    return 'GetSpendingState(monthly: $monthly, totalMonth: $totalMonth, totalYear: $totalYear, countMonth: $countMonth, countYear: $countYear, getSpendingState: $getSpendingState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSpendingStateImpl &&
            const DeepCollectionEquality().equals(other._monthly, _monthly) &&
            (identical(other.totalMonth, totalMonth) ||
                other.totalMonth == totalMonth) &&
            (identical(other.totalYear, totalYear) ||
                other.totalYear == totalYear) &&
            (identical(other.countMonth, countMonth) ||
                other.countMonth == countMonth) &&
            (identical(other.countYear, countYear) ||
                other.countYear == countYear) &&
            (identical(other.getSpendingState, getSpendingState) ||
                other.getSpendingState == getSpendingState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_monthly),
    totalMonth,
    totalYear,
    countMonth,
    countYear,
    getSpendingState,
  );

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSpendingStateImplCopyWith<_$GetSpendingStateImpl> get copyWith =>
      __$$GetSpendingStateImplCopyWithImpl<_$GetSpendingStateImpl>(
        this,
        _$identity,
      );
}

abstract class _GetSpendingState implements GetSpendingState {
  const factory _GetSpendingState({
    final List<MonthlySpending> monthly,
    final double totalMonth,
    final double totalYear,
    final int countMonth,
    final int countYear,
    final CommonState getSpendingState,
  }) = _$GetSpendingStateImpl;

  @override
  List<MonthlySpending> get monthly;
  @override
  double get totalMonth;
  @override
  double get totalYear;
  @override
  int get countMonth;
  @override
  int get countYear;
  @override
  CommonState get getSpendingState;

  /// Create a copy of GetSpendingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSpendingStateImplCopyWith<_$GetSpendingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
