// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VoucherModel _$VoucherModelFromJson(Map<String, dynamic> json) {
  return _VoucherModel.fromJson(json);
}

/// @nodoc
mixin _$VoucherModel {
  @JsonKey(name: 'VoucherID')
  int? get voucherId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountAmount')
  int? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'MinOrderValue')
  int? get minOrderValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  DateTime? get startDate => throw _privateConstructorUsedError; // thêm
  @JsonKey(name: 'EndDate')
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this VoucherModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoucherModelCopyWith<VoucherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherModelCopyWith<$Res> {
  factory $VoucherModelCopyWith(
    VoucherModel value,
    $Res Function(VoucherModel) then,
  ) = _$VoucherModelCopyWithImpl<$Res, VoucherModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'VoucherID') int? voucherId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'DiscountAmount') int? discountAmount,
    @JsonKey(name: 'MinOrderValue') int? minOrderValue,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
  });
}

/// @nodoc
class _$VoucherModelCopyWithImpl<$Res, $Val extends VoucherModel>
    implements $VoucherModelCopyWith<$Res> {
  _$VoucherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discountAmount = freezed,
    Object? minOrderValue = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
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
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as int?,
            minOrderValue: freezed == minOrderValue
                ? _value.minOrderValue
                : minOrderValue // ignore: cast_nullable_to_non_nullable
                      as int?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VoucherModelImplCopyWith<$Res>
    implements $VoucherModelCopyWith<$Res> {
  factory _$$VoucherModelImplCopyWith(
    _$VoucherModelImpl value,
    $Res Function(_$VoucherModelImpl) then,
  ) = __$$VoucherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'VoucherID') int? voucherId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'DiscountAmount') int? discountAmount,
    @JsonKey(name: 'MinOrderValue') int? minOrderValue,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
  });
}

/// @nodoc
class __$$VoucherModelImplCopyWithImpl<$Res>
    extends _$VoucherModelCopyWithImpl<$Res, _$VoucherModelImpl>
    implements _$$VoucherModelImplCopyWith<$Res> {
  __$$VoucherModelImplCopyWithImpl(
    _$VoucherModelImpl _value,
    $Res Function(_$VoucherModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voucherId = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? discountAmount = freezed,
    Object? minOrderValue = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(
      _$VoucherModelImpl(
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
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as int?,
        minOrderValue: freezed == minOrderValue
            ? _value.minOrderValue
            : minOrderValue // ignore: cast_nullable_to_non_nullable
                  as int?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherModelImpl extends _VoucherModel {
  const _$VoucherModelImpl({
    @JsonKey(name: 'VoucherID') this.voucherId,
    @JsonKey(name: 'Code') this.code,
    @JsonKey(name: 'Description') this.description,
    @JsonKey(name: 'DiscountAmount') this.discountAmount,
    @JsonKey(name: 'MinOrderValue') this.minOrderValue,
    @JsonKey(name: 'StartDate') this.startDate,
    @JsonKey(name: 'EndDate') this.endDate,
  }) : super._();

  factory _$VoucherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherModelImplFromJson(json);

  @override
  @JsonKey(name: 'VoucherID')
  final int? voucherId;
  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'DiscountAmount')
  final int? discountAmount;
  @override
  @JsonKey(name: 'MinOrderValue')
  final int? minOrderValue;
  @override
  @JsonKey(name: 'StartDate')
  final DateTime? startDate;
  // thêm
  @override
  @JsonKey(name: 'EndDate')
  final DateTime? endDate;

  @override
  String toString() {
    return 'VoucherModel(voucherId: $voucherId, code: $code, description: $description, discountAmount: $discountAmount, minOrderValue: $minOrderValue, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherModelImpl &&
            (identical(other.voucherId, voucherId) ||
                other.voucherId == voucherId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.minOrderValue, minOrderValue) ||
                other.minOrderValue == minOrderValue) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    voucherId,
    code,
    description,
    discountAmount,
    minOrderValue,
    startDate,
    endDate,
  );

  /// Create a copy of VoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherModelImplCopyWith<_$VoucherModelImpl> get copyWith =>
      __$$VoucherModelImplCopyWithImpl<_$VoucherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherModelImplToJson(this);
  }
}

abstract class _VoucherModel extends VoucherModel {
  const factory _VoucherModel({
    @JsonKey(name: 'VoucherID') final int? voucherId,
    @JsonKey(name: 'Code') final String? code,
    @JsonKey(name: 'Description') final String? description,
    @JsonKey(name: 'DiscountAmount') final int? discountAmount,
    @JsonKey(name: 'MinOrderValue') final int? minOrderValue,
    @JsonKey(name: 'StartDate') final DateTime? startDate,
    @JsonKey(name: 'EndDate') final DateTime? endDate,
  }) = _$VoucherModelImpl;
  const _VoucherModel._() : super._();

  factory _VoucherModel.fromJson(Map<String, dynamic> json) =
      _$VoucherModelImpl.fromJson;

  @override
  @JsonKey(name: 'VoucherID')
  int? get voucherId;
  @override
  @JsonKey(name: 'Code')
  String? get code;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'DiscountAmount')
  int? get discountAmount;
  @override
  @JsonKey(name: 'MinOrderValue')
  int? get minOrderValue;
  @override
  @JsonKey(name: 'StartDate')
  DateTime? get startDate; // thêm
  @override
  @JsonKey(name: 'EndDate')
  DateTime? get endDate;

  /// Create a copy of VoucherModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoucherModelImplCopyWith<_$VoucherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
