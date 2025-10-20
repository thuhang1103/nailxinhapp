import '../../repositories/cart_item_repository/cart_item_repository.dart';
//entity

class DeleteCartItemUseCase {
  final CartItemRepository repository;

  DeleteCartItemUseCase(this.repository);

  Future<bool> deleteCartItem({required int cartItemId}) {
    return repository.deleteCartItem(cartItemId: cartItemId);
  }
}
