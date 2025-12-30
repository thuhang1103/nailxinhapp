import '../../repositories/cart_item_repository/cart_item_repository.dart';

class CreateCartItemUseCase {
  final CartItemRepository repository;

  CreateCartItemUseCase(this.repository);

  Future<int> createCartItem({
    required int userId,
    required int productId,
    required int variantId,
    required int quantity,
    required double price,
  }) {
    return repository.addCartItem(
      userId: userId,
      productId: productId,
      variantId: variantId,
      quantity: quantity,
      price: price,
    );
  }

  Future<int> checkCartItemExists({
    required int userId,
    required int variantId,
    required int quantity,
  }) {
    return repository.checkCartItemExists(
      userId: userId,
      variantId: variantId,
      quantity: quantity,
    );
  }
}
