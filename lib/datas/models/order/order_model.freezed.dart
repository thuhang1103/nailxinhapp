// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  @JsonKey(name: 'OrderID')
  int? get orderID => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressID')
  int? get addressID => throw _privateConstructorUsedError;
  @JsonKey(name: 'AddressName')
  String? get addressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'VoucherID')
  int? get voucherID => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'TotalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'DiscountAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'FinalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get finalAmount => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'OrderDate',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  DateTime? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'UpdatedAt',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Paid_Status')
  String? get paidStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Order_Status')
  String? get orderStatus => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'AddressID') int? addressID,
    @JsonKey(name: 'AddressName') String? addressName,
    @JsonKey(name: 'VoucherID') int? voucherID,
    @JsonKey(
      name: 'TotalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? totalAmount,
    @JsonKey(
      name: 'DiscountAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? discountAmount,
    @JsonKey(
      name: 'FinalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? finalAmount,
    @JsonKey(
      name: 'OrderDate',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? orderDate,
    @JsonKey(
      name: 'UpdatedAt',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: 'Paid_Status') String? paidStatus,
    @JsonKey(name: 'Order_Status') String? orderStatus,
  });
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
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
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'AddressID') int? addressID,
    @JsonKey(name: 'AddressName') String? addressName,
    @JsonKey(name: 'VoucherID') int? voucherID,
    @JsonKey(
      name: 'TotalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? totalAmount,
    @JsonKey(
      name: 'DiscountAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? discountAmount,
    @JsonKey(
      name: 'FinalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? finalAmount,
    @JsonKey(
      name: 'OrderDate',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? orderDate,
    @JsonKey(
      name: 'UpdatedAt',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: 'Paid_Status') String? paidStatus,
    @JsonKey(name: 'Order_Status') String? orderStatus,
  });
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
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
      _$OrderModelImpl(
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
@JsonSerializable()
class _$OrderModelImpl extends _OrderModel {
  const _$OrderModelImpl({
    @JsonKey(name: 'OrderID') this.orderID,
    @JsonKey(name: 'AddressID') this.addressID,
    @JsonKey(name: 'AddressName') this.addressName,
    @JsonKey(name: 'VoucherID') this.voucherID,
    @JsonKey(
      name: 'TotalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    this.totalAmount,
    @JsonKey(
      name: 'DiscountAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    this.discountAmount,
    @JsonKey(
      name: 'FinalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    this.finalAmount,
    @JsonKey(
      name: 'OrderDate',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    this.orderDate,
    @JsonKey(
      name: 'UpdatedAt',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    this.updatedAt,
    @JsonKey(name: 'Paid_Status') this.paidStatus,
    @JsonKey(name: 'Order_Status') this.orderStatus,
  }) : super._();

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey(name: 'OrderID')
  final int? orderID;
  @override
  @JsonKey(name: 'AddressID')
  final int? addressID;
  @override
  @JsonKey(name: 'AddressName')
  final String? addressName;
  @override
  @JsonKey(name: 'VoucherID')
  final int? voucherID;
  @override
  @JsonKey(
    name: 'TotalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  final double? totalAmount;
  @override
  @JsonKey(
    name: 'DiscountAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  final double? discountAmount;
  @override
  @JsonKey(
    name: 'FinalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  final double? finalAmount;
  @override
  @JsonKey(
    name: 'OrderDate',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  final DateTime? orderDate;
  @override
  @JsonKey(
    name: 'UpdatedAt',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Paid_Status')
  final String? paidStatus;
  @override
  @JsonKey(name: 'Order_Status')
  final String? orderStatus;

  @override
  String toString() {
    return 'OrderModel(orderID: $orderID, addressID: $addressID, addressName: $addressName, voucherID: $voucherID, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount, orderDate: $orderDate, updatedAt: $updatedAt, paidStatus: $paidStatus, orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel({
    @JsonKey(name: 'OrderID') final int? orderID,
    @JsonKey(name: 'AddressID') final int? addressID,
    @JsonKey(name: 'AddressName') final String? addressName,
    @JsonKey(name: 'VoucherID') final int? voucherID,
    @JsonKey(
      name: 'TotalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    final double? totalAmount,
    @JsonKey(
      name: 'DiscountAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    final double? discountAmount,
    @JsonKey(
      name: 'FinalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    final double? finalAmount,
    @JsonKey(
      name: 'OrderDate',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    final DateTime? orderDate,
    @JsonKey(
      name: 'UpdatedAt',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    final DateTime? updatedAt,
    @JsonKey(name: 'Paid_Status') final String? paidStatus,
    @JsonKey(name: 'Order_Status') final String? orderStatus,
  }) = _$OrderModelImpl;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  @JsonKey(name: 'OrderID')
  int? get orderID;
  @override
  @JsonKey(name: 'AddressID')
  int? get addressID;
  @override
  @JsonKey(name: 'AddressName')
  String? get addressName;
  @override
  @JsonKey(name: 'VoucherID')
  int? get voucherID;
  @override
  @JsonKey(
    name: 'TotalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get totalAmount;
  @override
  @JsonKey(
    name: 'DiscountAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get discountAmount;
  @override
  @JsonKey(
    name: 'FinalAmount',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  double? get finalAmount;
  @override
  @JsonKey(
    name: 'OrderDate',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  DateTime? get orderDate;
  @override
  @JsonKey(
    name: 'UpdatedAt',
    fromJson: _dateTimeFromJson,
    toJson: _dateTimeToJson,
  )
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Paid_Status')
  String? get paidStatus;
  @override
  @JsonKey(name: 'Order_Status')
  String? get orderStatus;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
