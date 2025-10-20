import '../../repositories/cart_item_repository/cart_item_repository.dart';
//entity
import '../../entities/cart_item.dart';

class GetAllCartItemUseCase {
  final CartItemRepository repository;

  GetAllCartItemUseCase(this.repository);

  Future<List<CartItem>> getAllCartItems({required int userId}) {
    return repository.getAllByUserId(userId: userId);
  }
}
