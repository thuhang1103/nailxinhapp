import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item.dart' as entity;

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @JsonKey(name: 'CartItemID') int? cartItemId,
    @JsonKey(name: 'CartID') int? cartId,
    @JsonKey(name: 'ProductID') int? productId,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') @Default(1) int quantity,
    @JsonKey(name: 'Price') @Default(0.0) double price,
    //total
    @JsonKey(name: 'Total') @Default(0.0) double total,
    @JsonKey(name: 'is_selected') @Default(false) bool isSelected,
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
      productName: productName,
      imagePath: imagePath,
      quantity: quantity,
      price: price,
      total: total,
      isSelected: isSelected,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
    );
  }

  /// computed total (keeps in sync with quantity and price)
}
