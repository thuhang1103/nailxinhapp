// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) {
  return _CartItemModel.fromJson(json);
}

/// @nodoc
mixin _$CartItemModel {
  @JsonKey(name: 'CartItemID')
  int? get cartItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CartID')
  int? get cartId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductID')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'VariantID')
  int? get variantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'VariantName')
  String? get variantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImagePath')
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price', fromJson: _parseDouble)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'Stock')
  int get stock => throw _privateConstructorUsedError; //total
  @JsonKey(name: 'Total', fromJson: _parseDouble)
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_selected')
  int get isSelected => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CartItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
    CartItemModel value,
    $Res Function(CartItemModel) then,
  ) = _$CartItemModelCopyWithImpl<$Res, CartItemModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'CartItemID') int? cartItemId,
    @JsonKey(name: 'CartID') int? cartId,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'VariantID') int? variantId,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') int quantity,
    @JsonKey(name: 'Price', fromJson: _parseDouble) double price,
    @JsonKey(name: 'Stock') int stock,
    @JsonKey(name: 'Total', fromJson: _parseDouble) double total,
    @JsonKey(name: 'is_selected') int isSelected,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'UpdatedAt') String? updatedAt,
  });
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res, $Val extends CartItemModel>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? variantName = freezed,
    Object? productName = freezed,
    Object? imagePath = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? stock = null,
    Object? total = null,
    Object? isSelected = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            cartItemId: freezed == cartItemId
                ? _value.cartItemId
                : cartItemId // ignore: cast_nullable_to_non_nullable
                      as int?,
            cartId: freezed == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productId: freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int?,
            variantId: freezed == variantId
                ? _value.variantId
                : variantId // ignore: cast_nullable_to_non_nullable
                      as int?,
            variantName: freezed == variantName
                ? _value.variantName
                : variantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            imagePath: freezed == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemModelImplCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$$CartItemModelImplCopyWith(
    _$CartItemModelImpl value,
    $Res Function(_$CartItemModelImpl) then,
  ) = __$$CartItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'CartItemID') int? cartItemId,
    @JsonKey(name: 'CartID') int? cartId,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'VariantID') int? variantId,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') int quantity,
    @JsonKey(name: 'Price', fromJson: _parseDouble) double price,
    @JsonKey(name: 'Stock') int stock,
    @JsonKey(name: 'Total', fromJson: _parseDouble) double total,
    @JsonKey(name: 'is_selected') int isSelected,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'UpdatedAt') String? updatedAt,
  });
}

/// @nodoc
class __$$CartItemModelImplCopyWithImpl<$Res>
    extends _$CartItemModelCopyWithImpl<$Res, _$CartItemModelImpl>
    implements _$$CartItemModelImplCopyWith<$Res> {
  __$$CartItemModelImplCopyWithImpl(
    _$CartItemModelImpl _value,
    $Res Function(_$CartItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = freezed,
    Object? cartId = freezed,
    Object? productId = freezed,
    Object? variantId = freezed,
    Object? variantName = freezed,
    Object? productName = freezed,
    Object? imagePath = freezed,
    Object? quantity = null,
    Object? price = null,
    Object? stock = null,
    Object? total = null,
    Object? isSelected = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CartItemModelImpl(
        cartItemId: freezed == cartItemId
            ? _value.cartItemId
            : cartItemId // ignore: cast_nullable_to_non_nullable
                  as int?,
        cartId: freezed == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productId: freezed == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int?,
        variantId: freezed == variantId
            ? _value.variantId
            : variantId // ignore: cast_nullable_to_non_nullable
                  as int?,
        variantName: freezed == variantName
            ? _value.variantName
            : variantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        imagePath: freezed == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemModelImpl extends _CartItemModel {
  const _$CartItemModelImpl({
    @JsonKey(name: 'CartItemID') this.cartItemId,
    @JsonKey(name: 'CartID') this.cartId,
    @JsonKey(name: 'ProductID') this.productId,
    @JsonKey(name: 'VariantID') this.variantId,
    @JsonKey(name: 'VariantName') this.variantName,
    @JsonKey(name: 'ProductName') this.productName,
    @JsonKey(name: 'ImagePath') this.imagePath,
    @JsonKey(name: 'Quantity') this.quantity = 1,
    @JsonKey(name: 'Price', fromJson: _parseDouble) this.price = 0.0,
    @JsonKey(name: 'Stock') this.stock = 0,
    @JsonKey(name: 'Total', fromJson: _parseDouble) this.total = 0.0,
    @JsonKey(name: 'is_selected') this.isSelected = 0,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
  }) : super._();

  factory _$CartItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'CartItemID')
  final int? cartItemId;
  @override
  @JsonKey(name: 'CartID')
  final int? cartId;
  @override
  @JsonKey(name: 'ProductID')
  final int? productId;
  @override
  @JsonKey(name: 'VariantID')
  final int? variantId;
  @override
  @JsonKey(name: 'VariantName')
  final String? variantName;
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;
  @override
  @JsonKey(name: 'ImagePath')
  final String? imagePath;
  @override
  @JsonKey(name: 'Quantity')
  final int quantity;
  @override
  @JsonKey(name: 'Price', fromJson: _parseDouble)
  final double price;
  @override
  @JsonKey(name: 'Stock')
  final int stock;
  //total
  @override
  @JsonKey(name: 'Total', fromJson: _parseDouble)
  final double total;
  @override
  @JsonKey(name: 'is_selected')
  final int isSelected;
  @override
  @JsonKey(name: 'CreatedAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  final String? updatedAt;

  @override
  String toString() {
    return 'CartItemModel(cartItemId: $cartItemId, cartId: $cartId, productId: $productId, variantId: $variantId, variantName: $variantName, productName: $productName, imagePath: $imagePath, quantity: $quantity, price: $price, stock: $stock, total: $total, isSelected: $isSelected, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemModelImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.variantName, variantName) ||
                other.variantName == variantName) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cartItemId,
    cartId,
    productId,
    variantId,
    variantName,
    productName,
    imagePath,
    quantity,
    price,
    stock,
    total,
    isSelected,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      __$$CartItemModelImplCopyWithImpl<_$CartItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemModelImplToJson(this);
  }
}

abstract class _CartItemModel extends CartItemModel {
  const factory _CartItemModel({
    @JsonKey(name: 'CartItemID') final int? cartItemId,
    @JsonKey(name: 'CartID') final int? cartId,
    @JsonKey(name: 'ProductID') final int? productId,
    @JsonKey(name: 'VariantID') final int? variantId,
    @JsonKey(name: 'VariantName') final String? variantName,
    @JsonKey(name: 'ProductName') final String? productName,
    @JsonKey(name: 'ImagePath') final String? imagePath,
    @JsonKey(name: 'Quantity') final int quantity,
    @JsonKey(name: 'Price', fromJson: _parseDouble) final double price,
    @JsonKey(name: 'Stock') final int stock,
    @JsonKey(name: 'Total', fromJson: _parseDouble) final double total,
    @JsonKey(name: 'is_selected') final int isSelected,
    @JsonKey(name: 'CreatedAt') final String? createdAt,
    @JsonKey(name: 'UpdatedAt') final String? updatedAt,
  }) = _$CartItemModelImpl;
  const _CartItemModel._() : super._();

  factory _CartItemModel.fromJson(Map<String, dynamic> json) =
      _$CartItemModelImpl.fromJson;

  @override
  @JsonKey(name: 'CartItemID')
  int? get cartItemId;
  @override
  @JsonKey(name: 'CartID')
  int? get cartId;
  @override
  @JsonKey(name: 'ProductID')
  int? get productId;
  @override
  @JsonKey(name: 'VariantID')
  int? get variantId;
  @override
  @JsonKey(name: 'VariantName')
  String? get variantName;
  @override
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  @JsonKey(name: 'ImagePath')
  String? get imagePath;
  @override
  @JsonKey(name: 'Quantity')
  int get quantity;
  @override
  @JsonKey(name: 'Price', fromJson: _parseDouble)
  double get price;
  @override
  @JsonKey(name: 'Stock')
  int get stock; //total
  @override
  @JsonKey(name: 'Total', fromJson: _parseDouble)
  double get total;
  @override
  @JsonKey(name: 'is_selected')
  int get isSelected;
  @override
  @JsonKey(name: 'CreatedAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  String? get updatedAt;

  /// Create a copy of CartItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemModelImplCopyWith<_$CartItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
