// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return _ProductDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductDetail {
  int? get productId => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get basePrice => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;
  int get soldQuantity => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get statusProduct => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this ProductDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailCopyWith<ProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailCopyWith<$Res> {
  factory $ProductDetailCopyWith(
    ProductDetail value,
    $Res Function(ProductDetail) then,
  ) = _$ProductDetailCopyWithImpl<$Res, ProductDetail>;
  @useResult
  $Res call({
    int? productId,
    String? productName,
    String? description,
    double? basePrice,
    int? categoryId,
    int stockQuantity,
    int soldQuantity,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? statusProduct,
    List<String> images,
  });
}

/// @nodoc
class _$ProductDetailCopyWithImpl<$Res, $Val extends ProductDetail>
    implements $ProductDetailCopyWith<$Res> {
  _$ProductDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetail
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
abstract class _$$ProductDetailImplCopyWith<$Res>
    implements $ProductDetailCopyWith<$Res> {
  factory _$$ProductDetailImplCopyWith(
    _$ProductDetailImpl value,
    $Res Function(_$ProductDetailImpl) then,
  ) = __$$ProductDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? productId,
    String? productName,
    String? description,
    double? basePrice,
    int? categoryId,
    int stockQuantity,
    int soldQuantity,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? statusProduct,
    List<String> images,
  });
}

/// @nodoc
class __$$ProductDetailImplCopyWithImpl<$Res>
    extends _$ProductDetailCopyWithImpl<$Res, _$ProductDetailImpl>
    implements _$$ProductDetailImplCopyWith<$Res> {
  __$$ProductDetailImplCopyWithImpl(
    _$ProductDetailImpl _value,
    $Res Function(_$ProductDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductDetail
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
      _$ProductDetailImpl(
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
class _$ProductDetailImpl implements _ProductDetail {
  const _$ProductDetailImpl({
    this.productId,
    this.productName,
    this.description,
    this.basePrice,
    this.categoryId,
    this.stockQuantity = 0,
    this.soldQuantity = 0,
    this.createdAt,
    this.updatedAt,
    this.statusProduct,
    final List<String> images = const <String>[],
  }) : _images = images;

  factory _$ProductDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailImplFromJson(json);

  @override
  final int? productId;
  @override
  final String? productName;
  @override
  final String? description;
  @override
  final double? basePrice;
  @override
  final int? categoryId;
  @override
  @JsonKey()
  final int stockQuantity;
  @override
  @JsonKey()
  final int soldQuantity;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? statusProduct;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductDetail(productId: $productId, productName: $productName, description: $description, basePrice: $basePrice, categoryId: $categoryId, stockQuantity: $stockQuantity, soldQuantity: $soldQuantity, createdAt: $createdAt, updatedAt: $updatedAt, statusProduct: $statusProduct, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailImpl &&
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

  /// Create a copy of ProductDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailImplCopyWith<_$ProductDetailImpl> get copyWith =>
      __$$ProductDetailImplCopyWithImpl<_$ProductDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailImplToJson(this);
  }
}

abstract class _ProductDetail implements ProductDetail {
  const factory _ProductDetail({
    final int? productId,
    final String? productName,
    final String? description,
    final double? basePrice,
    final int? categoryId,
    final int stockQuantity,
    final int soldQuantity,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? statusProduct,
    final List<String> images,
  }) = _$ProductDetailImpl;

  factory _ProductDetail.fromJson(Map<String, dynamic> json) =
      _$ProductDetailImpl.fromJson;

  @override
  int? get productId;
  @override
  String? get productName;
  @override
  String? get description;
  @override
  double? get basePrice;
  @override
  int? get categoryId;
  @override
  int get stockQuantity;
  @override
  int get soldQuantity;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get statusProduct;
  @override
  List<String> get images;

  /// Create a copy of ProductDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailImplCopyWith<_$ProductDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
