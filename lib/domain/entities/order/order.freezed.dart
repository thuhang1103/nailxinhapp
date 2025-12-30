// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Order {
  int? get orderID => throw _privateConstructorUsedError;
  int? get addressID => throw _privateConstructorUsedError;
  String? get addressName => throw _privateConstructorUsedError;
  int? get voucherID => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  double? get finalAmount => throw _privateConstructorUsedError;
  DateTime? get orderDate => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get paidStatus => throw _privateConstructorUsedError;
  String? get orderStatus => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call({
    int? orderID,
    int? addressID,
    String? addressName,
    int? voucherID,
    double? totalAmount,
    double? discountAmount,
    double? finalAmount,
    DateTime? orderDate,
    DateTime? updatedAt,
    String? paidStatus,
    String? orderStatus,
  });
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? addressID = freezed,
    Object? addressName = freezed,
    Object? voucherID = freezed,
    Object? totalAmount = freezed,
    Object? discountAmount = freezed,
    Object? finalAmount = freezed,
    Object? orderDate = freezed,
    Object? updatedAt = freezed,
    Object? paidStatus = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            orderID: freezed == orderID
                ? _value.orderID
                : orderID // ignore: cast_nullable_to_non_nullable
                      as int?,
            addressID: freezed == addressID
                ? _value.addressID
                : addressID // ignore: cast_nullable_to_non_nullable
                      as int?,
            addressName: freezed == addressName
                ? _value.addressName
                : addressName // ignore: cast_nullable_to_non_nullable
                      as String?,
            voucherID: freezed == voucherID
                ? _value.voucherID
                : voucherID // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalAmount: freezed == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            finalAmount: freezed == finalAmount
                ? _value.finalAmount
                : finalAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            orderDate: freezed == orderDate
                ? _value.orderDate
                : orderDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            paidStatus: freezed == paidStatus
                ? _value.paidStatus
                : paidStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderStatus: freezed == orderStatus
                ? _value.orderStatus
                : orderStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
    _$OrderImpl value,
    $Res Function(_$OrderImpl) then,
  ) = __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? orderID,
    int? addressID,
    String? addressName,
    int? voucherID,
    double? totalAmount,
    double? discountAmount,
    double? finalAmount,
    DateTime? orderDate,
    DateTime? updatedAt,
    String? paidStatus,
    String? orderStatus,
  });
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
    _$OrderImpl _value,
    $Res Function(_$OrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderID = freezed,
    Object? addressID = freezed,
    Object? addressName = freezed,
    Object? voucherID = freezed,
    Object? totalAmount = freezed,
    Object? discountAmount = freezed,
    Object? finalAmount = freezed,
    Object? orderDate = freezed,
    Object? updatedAt = freezed,
    Object? paidStatus = freezed,
    Object? orderStatus = freezed,
  }) {
    return _then(
      _$OrderImpl(
        orderID: freezed == orderID
            ? _value.orderID
            : orderID // ignore: cast_nullable_to_non_nullable
                  as int?,
        addressID: freezed == addressID
            ? _value.addressID
            : addressID // ignore: cast_nullable_to_non_nullable
                  as int?,
        addressName: freezed == addressName
            ? _value.addressName
            : addressName // ignore: cast_nullable_to_non_nullable
                  as String?,
        voucherID: freezed == voucherID
            ? _value.voucherID
            : voucherID // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalAmount: freezed == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        finalAmount: freezed == finalAmount
            ? _value.finalAmount
            : finalAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        orderDate: freezed == orderDate
            ? _value.orderDate
            : orderDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        paidStatus: freezed == paidStatus
            ? _value.paidStatus
            : paidStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderStatus: freezed == orderStatus
            ? _value.orderStatus
            : orderStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OrderImpl extends _Order {
  const _$OrderImpl({
    this.orderID,
    this.addressID,
    this.addressName,
    this.voucherID,
    this.totalAmount,
    this.discountAmount,
    this.finalAmount,
    this.orderDate,
    this.updatedAt,
    this.paidStatus,
    this.orderStatus,
  }) : super._();

  @override
  final int? orderID;
  @override
  final int? addressID;
  @override
  final String? addressName;
  @override
  final int? voucherID;
  @override
  final double? totalAmount;
  @override
  final double? discountAmount;
  @override
  final double? finalAmount;
  @override
  final DateTime? orderDate;
  @override
  final DateTime? updatedAt;
  @override
  final String? paidStatus;
  @override
  final String? orderStatus;

  @override
  String toString() {
    return 'Order(orderID: $orderID, addressID: $addressID, addressName: $addressName, voucherID: $voucherID, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount, orderDate: $orderDate, updatedAt: $updatedAt, paidStatus: $paidStatus, orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.addressID, addressID) ||
                other.addressID == addressID) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.voucherID, voucherID) ||
                other.voucherID == voucherID) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.paidStatus, paidStatus) ||
                other.paidStatus == paidStatus) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderID,
    addressID,
    addressName,
    voucherID,
    totalAmount,
    discountAmount,
    finalAmount,
    orderDate,
    updatedAt,
    paidStatus,
    orderStatus,
  );

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);
}

abstract class _Order extends Order {
  const factory _Order({
    final int? orderID,
    final int? addressID,
    final String? addressName,
    final int? voucherID,
    final double? totalAmount,
    final double? discountAmount,
    final double? finalAmount,
    final DateTime? orderDate,
    final DateTime? updatedAt,
    final String? paidStatus,
    final String? orderStatus,
  }) = _$OrderImpl;
  const _Order._() : super._();

  @override
  int? get orderID;
  @override
  int? get addressID;
  @override
  String? get addressName;
  @override
  int? get voucherID;
  @override
  double? get totalAmount;
  @override
  double? get discountAmount;
  @override
  double? get finalAmount;
  @override
  DateTime? get orderDate;
  @override
  DateTime? get updatedAt;
  @override
  String? get paidStatus;
  @override
  String? get orderStatus;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
