// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  @JsonKey(name: 'OrderDetailID')
  int? get orderDetailID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderID')
  int? get orderID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductID')
  int? get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'VariantName')
  String? get variantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImagePath')
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total')
  double? get total => throw _privateConstructorUsedError;

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
    OrderDetailModel value,
    $Res Function(OrderDetailModel) then,
  ) = _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'OrderDetailID') int? orderDetailID,
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'Price') double? price,
    @JsonKey(name: 'Total') double? total,
  });
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDetailID = freezed,
    Object? orderID = freezed,
    Object? productID = freezed,
    Object? productName = freezed,
    Object? variantName = freezed,
    Object? imagePath = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? total = freezed,
  }) {
    return _then(
      _value.copyWith(
            orderDetailID: freezed == orderDetailID
                ? _value.orderDetailID
                : orderDetailID // ignore: cast_nullable_to_non_nullable
                      as int?,
            orderID: freezed == orderID
                ? _value.orderID
                : orderID // ignore: cast_nullable_to_non_nullable
                      as int?,
            productID: freezed == productID
                ? _value.productID
                : productID // ignore: cast_nullable_to_non_nullable
                      as int?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            variantName: freezed == variantName
                ? _value.variantName
                : variantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            imagePath: freezed == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: freezed == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(
    _$OrderDetailModelImpl value,
    $Res Function(_$OrderDetailModelImpl) then,
  ) = __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'OrderDetailID') int? orderDetailID,
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'Price') double? price,
    @JsonKey(name: 'Total') double? total,
  });
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(
    _$OrderDetailModelImpl _value,
    $Res Function(_$OrderDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDetailID = freezed,
    Object? orderID = freezed,
    Object? productID = freezed,
    Object? productName = freezed,
    Object? variantName = freezed,
    Object? imagePath = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? total = freezed,
  }) {
    return _then(
      _$OrderDetailModelImpl(
        orderDetailID: freezed == orderDetailID
            ? _value.orderDetailID
            : orderDetailID // ignore: cast_nullable_to_non_nullable
                  as int?,
        orderID: freezed == orderID
            ? _value.orderID
            : orderID // ignore: cast_nullable_to_non_nullable
                  as int?,
        productID: freezed == productID
            ? _value.productID
            : productID // ignore: cast_nullable_to_non_nullable
                  as int?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        variantName: freezed == variantName
            ? _value.variantName
            : variantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        imagePath: freezed == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: freezed == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailModelImpl extends _OrderDetailModel {
  const _$OrderDetailModelImpl({
    @JsonKey(name: 'OrderDetailID') this.orderDetailID,
    @JsonKey(name: 'OrderID') this.orderID,
    @JsonKey(name: 'ProductID') this.productID,
    @JsonKey(name: 'ProductName') this.productName,
    @JsonKey(name: 'VariantName') this.variantName,
    @JsonKey(name: 'ImagePath') this.imagePath,
    @JsonKey(name: 'Quantity') this.quantity,
    @JsonKey(name: 'Price') this.price,
    @JsonKey(name: 'Total') this.total,
  }) : super._();

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'OrderDetailID')
  final int? orderDetailID;
  @override
  @JsonKey(name: 'OrderID')
  final int? orderID;
  @override
  @JsonKey(name: 'ProductID')
  final int? productID;
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;
  @override
  @JsonKey(name: 'VariantName')
  final String? variantName;
  @override
  @JsonKey(name: 'ImagePath')
  final String? imagePath;
  @override
  @JsonKey(name: 'Quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'Price')
  final double? price;
  @override
  @JsonKey(name: 'Total')
  final double? total;

  @override
  String toString() {
    return 'OrderDetailModel(orderDetailID: $orderDetailID, orderID: $orderID, productID: $productID, productName: $productName, variantName: $variantName, imagePath: $imagePath, quantity: $quantity, price: $price, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
            (identical(other.orderDetailID, orderDetailID) ||
                other.orderDetailID == orderDetailID) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.variantName, variantName) ||
                other.variantName == variantName) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderDetailID,
    orderID,
    productID,
    productName,
    variantName,
    imagePath,
    quantity,
    price,
    total,
  );

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(this);
  }
}

abstract class _OrderDetailModel extends OrderDetailModel {
  const factory _OrderDetailModel({
    @JsonKey(name: 'OrderDetailID') final int? orderDetailID,
    @JsonKey(name: 'OrderID') final int? orderID,
    @JsonKey(name: 'ProductID') final int? productID,
    @JsonKey(name: 'ProductName') final String? productName,
    @JsonKey(name: 'VariantName') final String? variantName,
    @JsonKey(name: 'ImagePath') final String? imagePath,
    @JsonKey(name: 'Quantity') final int? quantity,
    @JsonKey(name: 'Price') final double? price,
    @JsonKey(name: 'Total') final double? total,
  }) = _$OrderDetailModelImpl;
  const _OrderDetailModel._() : super._();

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'OrderDetailID')
  int? get orderDetailID;
  @override
  @JsonKey(name: 'OrderID')
  int? get orderID;
  @override
  @JsonKey(name: 'ProductID')
  int? get productID;
  @override
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  @JsonKey(name: 'VariantName')
  String? get variantName;
  @override
  @JsonKey(name: 'ImagePath')
  String? get imagePath;
  @override
  @JsonKey(name: 'Quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'Price')
  double? get price;
  @override
  @JsonKey(name: 'Total')
  double? get total;

  /// Create a copy of OrderDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
