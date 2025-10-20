import '../../repositories/cart_item_repository/cart_item_repository.dart';

class CreateCartItemUseCase {
  final CartItemRepository repository;

  CreateCartItemUseCase(this.repository);

  Future<int> createCartItem({
    required int cartId,
    required int productId,
    required int quantity,
    required double price,
  }) {
    return repository.addCartItem(
      cartId: cartId,
      productId: productId,
      quantity: quantity,
      price: price,
    );
  }
}
