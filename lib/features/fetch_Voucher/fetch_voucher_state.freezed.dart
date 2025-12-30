// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_voucher_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VoucherState {
  List<Voucher> get vouchers => throw _privateConstructorUsedError;
  Voucher? get maxVoucher => throw _privateConstructorUsedError;
  CommonState get voucherState => throw _privateConstructorUsedError;

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherStateCopyWith<VoucherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherStateCopyWith<$Res> {
  factory $VoucherStateCopyWith(
    VoucherState value,
    $Res Function(VoucherState) then,
  ) = _$VoucherStateCopyWithImpl<$Res, VoucherState>;
  @useResult
  $Res call({
    List<Voucher> vouchers,
    Voucher? maxVoucher,
    CommonState voucherState,
  });

  $VoucherCopyWith<$Res>? get maxVoucher;
  $CommonStateCopyWith<$Res> get voucherState;
}

/// @nodoc
class _$VoucherStateCopyWithImpl<$Res, $Val extends VoucherState>
    implements $VoucherStateCopyWith<$Res> {
  _$VoucherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vouchers = null,
    Object? maxVoucher = freezed,
    Object? voucherState = null,
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
            voucherState: null == voucherState
                ? _value.voucherState
                : voucherState // ignore: cast_nullable_to_non_nullable
                      as CommonState,
          )
          as $Val,
    );
  }

  /// Create a copy of VoucherState
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

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommonStateCopyWith<$Res> get voucherState {
    return $CommonStateCopyWith<$Res>(_value.voucherState, (value) {
      return _then(_value.copyWith(voucherState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherStateImplCopyWith<$Res>
    implements $VoucherStateCopyWith<$Res> {
  factory _$$VoucherStateImplCopyWith(
    _$VoucherStateImpl value,
    $Res Function(_$VoucherStateImpl) then,
  ) = __$$VoucherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Voucher> vouchers,
    Voucher? maxVoucher,
    CommonState voucherState,
  });

  @override
  $VoucherCopyWith<$Res>? get maxVoucher;
  @override
  $CommonStateCopyWith<$Res> get voucherState;
}

/// @nodoc
class __$$VoucherStateImplCopyWithImpl<$Res>
    extends _$VoucherStateCopyWithImpl<$Res, _$VoucherStateImpl>
    implements _$$VoucherStateImplCopyWith<$Res> {
  __$$VoucherStateImplCopyWithImpl(
    _$VoucherStateImpl _value,
    $Res Function(_$VoucherStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vouchers = null,
    Object? maxVoucher = freezed,
    Object? voucherState = null,
  }) {
    return _then(
      _$VoucherStateImpl(
        vouchers: null == vouchers
            ? _value._vouchers
            : vouchers // ignore: cast_nullable_to_non_nullable
                  as List<Voucher>,
        maxVoucher: freezed == maxVoucher
            ? _value.maxVoucher
            : maxVoucher // ignore: cast_nullable_to_non_nullable
                  as Voucher?,
        voucherState: null == voucherState
            ? _value.voucherState
            : voucherState // ignore: cast_nullable_to_non_nullable
                  as CommonState,
      ),
    );
  }
}

/// @nodoc

class _$VoucherStateImpl implements _VoucherState {
  const _$VoucherStateImpl({
    final List<Voucher> vouchers = const [],
    this.maxVoucher,
    this.voucherState = const CommonState.initial(),
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
  @JsonKey()
  final CommonState voucherState;

  @override
  String toString() {
    return 'VoucherState(vouchers: $vouchers, maxVoucher: $maxVoucher, voucherState: $voucherState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherStateImpl &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers) &&
            (identical(other.maxVoucher, maxVoucher) ||
                other.maxVoucher == maxVoucher) &&
            (identical(other.voucherState, voucherState) ||
                other.voucherState == voucherState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vouchers),
    maxVoucher,
    voucherState,
  );

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherStateImplCopyWith<_$VoucherStateImpl> get copyWith =>
      __$$VoucherStateImplCopyWithImpl<_$VoucherStateImpl>(this, _$identity);
}

abstract class _VoucherState implements VoucherState {
  const factory _VoucherState({
    final List<Voucher> vouchers,
    final Voucher? maxVoucher,
    final CommonState voucherState,
  }) = _$VoucherStateImpl;

  @override
  List<Voucher> get vouchers;
  @override
  Voucher? get maxVoucher;
  @override
  CommonState get voucherState;

  /// Create a copy of VoucherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherStateImplCopyWith<_$VoucherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
