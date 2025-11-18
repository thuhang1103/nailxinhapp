import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_detail.dart' as entity;

part 'product_detail_model.freezed.dart';
part 'product_detail_model.g.dart';

@freezed
class ProductDetailModel with _$ProductDetailModel {
  const ProductDetailModel._();

  const factory ProductDetailModel({
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'BasePrice') double? basePrice,
    @JsonKey(name: 'CategoryID') int? categoryId,
    @JsonKey(name: 'StockQuantity') @Default(0) int stockQuantity,
    @JsonKey(name: 'SoldQuantity') @Default(0) int soldQuantity,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
    @JsonKey(name: 'Status_Product') int? statusProduct,
    @JsonKey(name: 'Images') @Default(<String>[]) List<String> images,
  }) = _ProductDetailModel;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  // convert to domain entity
  entity.ProductDetail toEntity() {
    return entity.ProductDetail(
      productId: productId,
      productName: productName,
      description: description,
      basePrice: basePrice,
      categoryId: categoryId,
      stockQuantity: stockQuantity,
      soldQuantity: soldQuantity,
      createdAt: createdAt,
      updatedAt: updatedAt,
      statusProduct: statusProduct,
      images: images,
    );
  }
}
