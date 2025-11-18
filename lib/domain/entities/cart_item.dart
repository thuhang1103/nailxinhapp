import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._(); // private ctor for custom getters

  const factory CartItem({
    int? id,
    int? cartId,
    int? productId,
    int? quantity,
    String? productName,
    String? imagePath,
    @Default(0.0) double price,
    @Default(0.0) double total,
    @Default(0) int isSelected,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CartItem;
}
