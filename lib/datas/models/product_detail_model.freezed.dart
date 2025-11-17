// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) {
  return _ProductDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailModel {
  @JsonKey(name: 'ProductID')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductName')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'BasePrice')
  double? get basePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryID')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StockQuantity')
  int get stockQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'SoldQuantity')
  int get soldQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'Status_Product')
  String? get statusProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'Images')
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ProductDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailModelCopyWith<ProductDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailModelCopyWith<$Res> {
  factory $ProductDetailModelCopyWith(
    ProductDetailModel value,
    $Res Function(ProductDetailModel) then,
  ) = _$ProductDetailModelCopyWithImpl<$Res, ProductDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'BasePrice') double? basePrice,
    @JsonKey(name: 'CategoryID') int? categoryId,
    @JsonKey(name: 'StockQuantity') int stockQuantity,
    @JsonKey(name: 'SoldQuantity') int soldQuantity,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'Status_Product') String? statusProduct,
    @JsonKey(name: 'Images') List<String> images,
  });
}

/// @nodoc
class _$ProductDetailModelCopyWithImpl<$Res, $Val extends ProductDetailModel>
    implements $ProductDetailModelCopyWith<$Res> {
  _$ProductDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? description = freezed,
    Object? basePrice = freezed,
    Object? categoryId = freezed,
    Object? stockQuantity = null,
    Object? soldQuantity = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusProduct = freezed,
    Object? images = null,
  }) {
    return _then(
      _value.copyWith(
            productId: freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as int?,
            productName: freezed == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            basePrice: freezed == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int?,
            stockQuantity: null == stockQuantity
                ? _value.stockQuantity
                : stockQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            soldQuantity: null == soldQuantity
                ? _value.soldQuantity
                : soldQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            statusProduct: freezed == statusProduct
                ? _value.statusProduct
                : statusProduct // ignore: cast_nullable_to_non_nullable
                      as String?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductDetailModelImplCopyWith<$Res>
    implements $ProductDetailModelCopyWith<$Res> {
  factory _$$ProductDetailModelImplCopyWith(
    _$ProductDetailModelImpl value,
    $Res Function(_$ProductDetailModelImpl) then,
  ) = __$$ProductDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'BasePrice') double? basePrice,
    @JsonKey(name: 'CategoryID') int? categoryId,
    @JsonKey(name: 'StockQuantity') int stockQuantity,
    @JsonKey(name: 'SoldQuantity') int soldQuantity,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'Status_Product') String? statusProduct,
    @JsonKey(name: 'Images') List<String> images,
  });
}

/// @nodoc
class __$$ProductDetailModelImplCopyWithImpl<$Res>
    extends _$ProductDetailModelCopyWithImpl<$Res, _$ProductDetailModelImpl>
    implements _$$ProductDetailModelImplCopyWith<$Res> {
  __$$ProductDetailModelImplCopyWithImpl(
    _$ProductDetailModelImpl _value,
    $Res Function(_$ProductDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? productName = freezed,
    Object? description = freezed,
    Object? basePrice = freezed,
    Object? categoryId = freezed,
    Object? stockQuantity = null,
    Object? soldQuantity = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusProduct = freezed,
    Object? images = null,
  }) {
    return _then(
      _$ProductDetailModelImpl(
        productId: freezed == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as int?,
        productName: freezed == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        basePrice: freezed == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int?,
        stockQuantity: null == stockQuantity
            ? _value.stockQuantity
            : stockQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        soldQuantity: null == soldQuantity
            ? _value.soldQuantity
            : soldQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        statusProduct: freezed == statusProduct
            ? _value.statusProduct
            : statusProduct // ignore: cast_nullable_to_non_nullable
                  as String?,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailModelImpl extends _ProductDetailModel {
  const _$ProductDetailModelImpl({
    @JsonKey(name: 'ProductID') this.productId,
    @JsonKey(name: 'ProductName') this.productName,
    @JsonKey(name: 'Description') this.description,
    @JsonKey(name: 'BasePrice') this.basePrice,
    @JsonKey(name: 'CategoryID') this.categoryId,
    @JsonKey(name: 'StockQuantity') this.stockQuantity = 0,
    @JsonKey(name: 'SoldQuantity') this.soldQuantity = 0,
    @JsonKey(name: 'CreatedAt') this.createdAt,
    @JsonKey(name: 'UpdatedAt') this.updatedAt,
    @JsonKey(name: 'Status_Product') this.statusProduct,
    @JsonKey(name: 'Images') final List<String> images = const <String>[],
  }) : _images = images,
       super._();

  factory _$ProductDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'ProductID')
  final int? productId;
  @override
  @JsonKey(name: 'ProductName')
  final String? productName;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'BasePrice')
  final double? basePrice;
  @override
  @JsonKey(name: 'CategoryID')
  final int? categoryId;
  @override
  @JsonKey(name: 'StockQuantity')
  final int stockQuantity;
  @override
  @JsonKey(name: 'SoldQuantity')
  final int soldQuantity;
  @override
  @JsonKey(name: 'CreatedAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'Status_Product')
  final String? statusProduct;
  final List<String> _images;
  @override
  @JsonKey(name: 'Images')
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductDetailModel(productId: $productId, productName: $productName, description: $description, basePrice: $basePrice, categoryId: $categoryId, stockQuantity: $stockQuantity, soldQuantity: $soldQuantity, createdAt: $createdAt, updatedAt: $updatedAt, statusProduct: $statusProduct, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.soldQuantity, soldQuantity) ||
                other.soldQuantity == soldQuantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.statusProduct, statusProduct) ||
                other.statusProduct == statusProduct) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    productId,
    productName,
    description,
    basePrice,
    categoryId,
    stockQuantity,
    soldQuantity,
    createdAt,
    updatedAt,
    statusProduct,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of ProductDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailModelImplCopyWith<_$ProductDetailModelImpl> get copyWith =>
      __$$ProductDetailModelImplCopyWithImpl<_$ProductDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailModelImplToJson(this);
  }
}

abstract class _ProductDetailModel extends ProductDetailModel {
  const factory _ProductDetailModel({
    @JsonKey(name: 'ProductID') final int? productId,
    @JsonKey(name: 'ProductName') final String? productName,
    @JsonKey(name: 'Description') final String? description,
    @JsonKey(name: 'BasePrice') final double? basePrice,
    @JsonKey(name: 'CategoryID') final int? categoryId,
    @JsonKey(name: 'StockQuantity') final int stockQuantity,
    @JsonKey(name: 'SoldQuantity') final int soldQuantity,
    @JsonKey(name: 'CreatedAt') final DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') final DateTime? updatedAt,
    @JsonKey(name: 'Status_Product') final String? statusProduct,
    @JsonKey(name: 'Images') final List<String> images,
  }) = _$ProductDetailModelImpl;
  const _ProductDetailModel._() : super._();

  factory _ProductDetailModel.fromJson(Map<String, dynamic> json) =
      _$ProductDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'ProductID')
  int? get productId;
  @override
  @JsonKey(name: 'ProductName')
  String? get productName;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'BasePrice')
  double? get basePrice;
  @override
  @JsonKey(name: 'CategoryID')
  int? get categoryId;
  @override
  @JsonKey(name: 'StockQuantity')
  int get stockQuantity;
  @override
  @JsonKey(name: 'SoldQuantity')
  int get soldQuantity;
  @override
  @JsonKey(name: 'CreatedAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'UpdatedAt')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'Status_Product')
  String? get statusProduct;
  @override
  @JsonKey(name: 'Images')
  List<String> get images;

  /// Create a copy of ProductDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailModelImplCopyWith<_$ProductDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
