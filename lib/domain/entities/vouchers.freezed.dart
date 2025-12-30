// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vouchers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Voucher {
  int? get voucherId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  int? get minOrderValue => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherCopyWith<Voucher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherCopyWith<$Res> {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) then) =
      _$VoucherCopyWithImpl<$Res, Voucher>;
  @useResult
  $Res call({
    int? voucherId,
    String? code,
    String? description,
    double discount,
    int? minOrderValue,
    DateTime? startTime,
    DateTime? endTime,
  });
}

/// @nodoc
class _$VoucherCopyWithImpl<$Res, $Val extends Voucher>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discount = null,
    Object? minOrderValue = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            voucherId: freezed == voucherId
                ? _value.voucherId
                : voucherId // ignore: cast_nullable_to_non_nullable
                      as int?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            minOrderValue: freezed == minOrderValue
                ? _value.minOrderValue
                : minOrderValue // ignore: cast_nullable_to_non_nullable
                      as int?,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VoucherImplCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$$VoucherImplCopyWith(
    _$VoucherImpl value,
    $Res Function(_$VoucherImpl) then,
  ) = __$$VoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? voucherId,
    String? code,
    String? description,
    double discount,
    int? minOrderValue,
    DateTime? startTime,
    DateTime? endTime,
  });
}

/// @nodoc
class __$$VoucherImplCopyWithImpl<$Res>
    extends _$VoucherCopyWithImpl<$Res, _$VoucherImpl>
    implements _$$VoucherImplCopyWith<$Res> {
  __$$VoucherImplCopyWithImpl(
    _$VoucherImpl _value,
    $Res Function(_$VoucherImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discount = null,
    Object? minOrderValue = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(
      _$VoucherImpl(
        voucherId: freezed == voucherId
            ? _value.voucherId
            : voucherId // ignore: cast_nullable_to_non_nullable
                  as int?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        minOrderValue: freezed == minOrderValue
            ? _value.minOrderValue
            : minOrderValue // ignore: cast_nullable_to_non_nullable
                  as int?,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$VoucherImpl extends _Voucher {
  const _$VoucherImpl({
    this.voucherId,
    this.code,
    this.description,
    this.discount = 0.0,
    this.minOrderValue,
    this.startTime,
    this.endTime,
  }) : super._();

  @override
  final int? voucherId;
  @override
  final String? code;
  @override
  final String? description;
  @override
  @JsonKey()
  final double discount;
  @override
  final int? minOrderValue;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  @override
  String toString() {
    return 'Voucher(voucherId: $voucherId, code: $code, description: $description, discount: $discount, minOrderValue: $minOrderValue, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherImpl &&
            (identical(other.voucherId, voucherId) ||
                other.voucherId == voucherId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    voucherId,
    code,
    description,
    discount,
    minOrderValue,
    startTime,
    endTime,
  );

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      __$$VoucherImplCopyWithImpl<_$VoucherImpl>(this, _$identity);
}

abstract class _Voucher extends Voucher {
  const factory _Voucher({
    final int? voucherId,
    final String? code,
    final String? description,
    final double discount,
    final int? minOrderValue,
    final DateTime? startTime,
    final DateTime? endTime,
  }) = _$VoucherImpl;
  const _Voucher._() : super._();

  @override
  int? get voucherId;
  @override
  String? get code;
  @override
  String? get description;
  @override
  double get discount;
  @override
  int? get minOrderValue;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;

  /// Create a copy of Voucher
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
