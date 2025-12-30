import '../../repositories/cart_item_repository/cart_item_repository.dart';
//entity
import '../../entities/cart_item.dart';

class UpdateCartItemUseCase {
  final CartItemRepository repository;

  UpdateCartItemUseCase(this.repository);

  Future<int> updateCartItem({
    required int cartItemId,
    required int quantity,
    required int variantId,
    required int isSelected,
  }) {
    return repository.updateCartItem(
      cartItemId: cartItemId,
      quantity: quantity,
      variantId: variantId,
      isSelected: isSelected,
    );
  }
}
