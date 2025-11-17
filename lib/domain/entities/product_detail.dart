import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail.freezed.dart';
part 'product_detail.g.dart';

@freezed
class ProductDetail with _$ProductDetail {
  const factory ProductDetail({
    int? productId,
    String? productName,
    String? description,
    double? basePrice,
    int? categoryId,
    @Default(0) int stockQuantity,
    @Default(0) int soldQuantity,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? statusProduct,
    @Default(<String>[]) List<String> images,
  }) = _ProductDetail;

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
}
