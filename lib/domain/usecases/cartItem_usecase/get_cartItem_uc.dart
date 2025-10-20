import '../../repositories/cart_item_repository/cart_item_repository.dart';
//entity
import '../../entities/cart_item.dart';

class GetCartItemUseCase {
  final CartItemRepository repository;

  GetCartItemUseCase(this.repository);

  Future<CartItem?> getCartItem({required int cartItemId}) {
    return repository.getById(cartItemId: cartItemId);
  }
}
