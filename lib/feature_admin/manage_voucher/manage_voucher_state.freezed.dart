// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_voucher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ManageVoucherState {
  List<Voucher> get vouchers => throw _privateConstructorUsedError;
  Voucher? get maxVoucher => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get minOrderValue => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  CommonState get createVoucherState => throw _privateConstructorUsedError;
  CommonState get updateVoucherState => throw _privateConstructorUsedError;
  CommonState get deleteVoucherState => throw _privateConstructorUsedError;
  CommonState get getvoucherState => throw _privateConstructorUsedError;

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageVoucherStateCopyWith<ManageVoucherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageVoucherStateCopyWith<$Res> {
  factory $ManageVoucherStateCopyWith(
    ManageVoucherState value,
    $Res Function(ManageVoucherState) then,
  ) = _$ManageVoucherStateCopyWithImpl<$Res, ManageVoucherState>;
  @useResult
  $Res call({
    List<Voucher> vouchers,
    Voucher? maxVoucher,
    String? code,
    String? description,
    double? minOrderValue,
    double? discountAmount,
    DateTime? startDate,
    DateTime? endDate,
    CommonState createVoucherState,
    CommonState updateVoucherState,
    CommonState deleteVoucherState,
    CommonState getvoucherState,
  });

  $VoucherCopyWith<$Res>? get maxVoucher;
  $CommonStateCopyWith<$Res> get createVoucherState;
  $CommonStateCopyWith<$Res> get updateVoucherState;
  $CommonStateCopyWith<$Res> get deleteVoucherState;
  $CommonStateCopyWith<$Res> get getvoucherState;
}

/// @nodoc
class _$ManageVoucherStateCopyWithImpl<$Res, $Val extends ManageVoucherState>
    implements $ManageVoucherStateCopyWith<$Res> {
  _$ManageVoucherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vouchers = null,
    Object? maxVoucher = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? minOrderValue = freezed,
    Object? discountAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createVoucherState = null,
    Object? updateVoucherState = null,
    Object? deleteVoucherState = null,
    Object? getvoucherState = null,
  }) {
    return _then(
      _value.copyWith(
            vouchers: null == vouchers
                ? _value.vouchers
                : vouchers // ignore: cast_nullable_to_non_nullable
                      as List<Voucher>,
            maxVoucher: freezed == maxVoucher
                ? _value.maxVoucher
                : maxVoucher // ignore: cast_nullable_to_non_nullable
                      as Voucher?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            minOrderValue: freezed == minOrderValue
                ? _value.minOrderValue
                : minOrderValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createVoucherState: null == createVoucherState
                ? _value.createVoucherState
                : createVoucherState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            updateVoucherState: null == updateVoucherState
                ? _value.updateVoucherState
                : updateVoucherState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            deleteVoucherState: null == deleteVoucherState
                ? _value.deleteVoucherState
                : deleteVoucherState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
            getvoucherState: null == getvoucherState
                ? _value.getvoucherState
                : getvoucherState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoucherCopyWith<$Res>? get maxVoucher {
    if (_value.maxVoucher == null) {
      return null;
    }

    return $VoucherCopyWith<$Res>(_value.maxVoucher!, (value) {
      return _then(_value.copyWith(maxVoucher: value) as $Val);
    });
  }

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get createVoucherState {
    return $CommonStateCopyWith<$Res>(_value.createVoucherState, (value) {
      return _then(_value.copyWith(createVoucherState: value) as $Val);
    });
  }

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get updateVoucherState {
    return $CommonStateCopyWith<$Res>(_value.updateVoucherState, (value) {
      return _then(_value.copyWith(updateVoucherState: value) as $Val);
    });
  }

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get deleteVoucherState {
    return $CommonStateCopyWith<$Res>(_value.deleteVoucherState, (value) {
      return _then(_value.copyWith(deleteVoucherState: value) as $Val);
    });
  }

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get getvoucherState {
    return $CommonStateCopyWith<$Res>(_value.getvoucherState, (value) {
      return _then(_value.copyWith(getvoucherState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManageVoucherStateImplCopyWith<$Res>
    implements $ManageVoucherStateCopyWith<$Res> {
  factory _$$ManageVoucherStateImplCopyWith(
    _$ManageVoucherStateImpl value,
    $Res Function(_$ManageVoucherStateImpl) then,
  ) = __$$ManageVoucherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Voucher> vouchers,
    Voucher? maxVoucher,
    String? code,
    String? description,
    double? minOrderValue,
    double? discountAmount,
    DateTime? startDate,
    DateTime? endDate,
    CommonState createVoucherState,
    CommonState updateVoucherState,
    CommonState deleteVoucherState,
    CommonState getvoucherState,
  });

  @override
  $VoucherCopyWith<$Res>? get maxVoucher;
  @override
  $CommonStateCopyWith<$Res> get createVoucherState;
  @override
  $CommonStateCopyWith<$Res> get updateVoucherState;
  @override
  $CommonStateCopyWith<$Res> get deleteVoucherState;
  @override
  $CommonStateCopyWith<$Res> get getvoucherState;
}

/// @nodoc
class __$$ManageVoucherStateImplCopyWithImpl<$Res>
    extends _$ManageVoucherStateCopyWithImpl<$Res, _$ManageVoucherStateImpl>
    implements _$$ManageVoucherStateImplCopyWith<$Res> {
  __$$ManageVoucherStateImplCopyWithImpl(
    _$ManageVoucherStateImpl _value,
    $Res Function(_$ManageVoucherStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vouchers = null,
    Object? maxVoucher = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? minOrderValue = freezed,
    Object? discountAmount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? createVoucherState = null,
    Object? updateVoucherState = null,
    Object? deleteVoucherState = null,
    Object? getvoucherState = null,
  }) {
    return _then(
      _$ManageVoucherStateImpl(
        vouchers: null == vouchers
            ? _value._vouchers
            : vouchers // ignore: cast_nullable_to_non_nullable
                  as List<Voucher>,
        maxVoucher: freezed == maxVoucher
            ? _value.maxVoucher
            : maxVoucher // ignore: cast_nullable_to_non_nullable
                  as Voucher?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        minOrderValue: freezed == minOrderValue
            ? _value.minOrderValue
            : minOrderValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createVoucherState: null == createVoucherState
            ? _value.createVoucherState
            : createVoucherState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        updateVoucherState: null == updateVoucherState
            ? _value.updateVoucherState
            : updateVoucherState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        deleteVoucherState: null == deleteVoucherState
            ? _value.deleteVoucherState
            : deleteVoucherState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
        getvoucherState: null == getvoucherState
            ? _value.getvoucherState
            : getvoucherState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$ManageVoucherStateImpl implements _ManageVoucherState {
  const _$ManageVoucherStateImpl({
    final List<Voucher> vouchers = const [],
    this.maxVoucher,
    this.code,
    this.description,
    this.minOrderValue,
    this.discountAmount,
    this.startDate,
    this.endDate,
    this.createVoucherState = const CommonState.initial(),
    this.updateVoucherState = const CommonState.initial(),
    this.deleteVoucherState = const CommonState.initial(),
    this.getvoucherState = const CommonState.initial(),
  }) : _vouchers = vouchers;

  final List<Voucher> _vouchers;
  @override
  @JsonKey()
  List<Voucher> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  @override
  final Voucher? maxVoucher;
  @override
  final String? code;
  @override
  final String? description;
  @override
  final double? minOrderValue;
  @override
  final double? discountAmount;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final CommonState createVoucherState;
  @override
  @JsonKey()
  final CommonState updateVoucherState;
  @override
  @JsonKey()
  final CommonState deleteVoucherState;
  @override
  @JsonKey()
  final CommonState getvoucherState;

  @override
  String toString() {
    return 'ManageVoucherState(vouchers: $vouchers, maxVoucher: $maxVoucher, code: $code, description: $description, minOrderValue: $minOrderValue, discountAmount: $discountAmount, startDate: $startDate, endDate: $endDate, createVoucherState: $createVoucherState, updateVoucherState: $updateVoucherState, deleteVoucherState: $deleteVoucherState, getvoucherState: $getvoucherState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageVoucherStateImpl &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers) &&
            (identical(other.maxVoucher, maxVoucher) ||
                other.maxVoucher == maxVoucher) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createVoucherState, createVoucherState) ||
                other.createVoucherState == createVoucherState) &&
            (identical(other.updateVoucherState, updateVoucherState) ||
                other.updateVoucherState == updateVoucherState) &&
            (identical(other.deleteVoucherState, deleteVoucherState) ||
                other.deleteVoucherState == deleteVoucherState) &&
            (identical(other.getvoucherState, getvoucherState) ||
                other.getvoucherState == getvoucherState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vouchers),
    maxVoucher,
    code,
    description,
    minOrderValue,
    discountAmount,
    startDate,
    endDate,
    createVoucherState,
    updateVoucherState,
    deleteVoucherState,
    getvoucherState,
  );

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageVoucherStateImplCopyWith<_$ManageVoucherStateImpl> get copyWith =>
      __$$ManageVoucherStateImplCopyWithImpl<_$ManageVoucherStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ManageVoucherState implements ManageVoucherState {
  const factory _ManageVoucherState({
    final List<Voucher> vouchers,
    final Voucher? maxVoucher,
    final String? code,
    final String? description,
    final double? minOrderValue,
    final double? discountAmount,
    final DateTime? startDate,
    final DateTime? endDate,
    final CommonState createVoucherState,
    final CommonState updateVoucherState,
    final CommonState deleteVoucherState,
    final CommonState getvoucherState,
  }) = _$ManageVoucherStateImpl;

  @override
  List<Voucher> get vouchers;
  @override
  Voucher? get maxVoucher;
  @override
  String? get code;
  @override
  String? get description;
  @override
  double? get minOrderValue;
  @override
  double? get discountAmount;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  CommonState get createVoucherState;
  @override
  CommonState get updateVoucherState;
  @override
  CommonState get deleteVoucherState;
  @override
  CommonState get getvoucherState;

  /// Create a copy of ManageVoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageVoucherStateImplCopyWith<_$ManageVoucherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
