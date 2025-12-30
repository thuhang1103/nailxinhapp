import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item.dart' as entity;

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

double _parseDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble(); // int hoặc double
  return double.tryParse(v.toString()) ?? 0.0; // string
}

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @JsonKey(name: 'CartItemID') int? cartItemId,
    @JsonKey(name: 'CartID') int? cartId,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'VariantID') int? variantId,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') @Default(1) int quantity,
    @JsonKey(name: 'Price', fromJson: _parseDouble) @Default(0.0) double price,
    @JsonKey(name: 'Stock') @Default(0) int stock,
    //total
    @JsonKey(name: 'Total', fromJson: _parseDouble) @Default(0.0) double total,
    @JsonKey(name: 'is_selected') @Default(0) int isSelected,
    @JsonKey(name: 'CreatedAt') String? createdAt,
    @JsonKey(name: 'UpdatedAt') String? updatedAt,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  entity.CartItem toEntity() {
    return entity.CartItem(
      id: cartItemId,
      cartId: cartId,
      productId: productId,
      variantId: variantId,
      variantName: variantName,
      productName: productName,
      imagePath: imagePath,
      quantity: quantity,
      price: price,
      stock: stock,
      total: total,
      isSelected: isSelected,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }

  /// computed total (keeps in sync with quantity and price)
}
