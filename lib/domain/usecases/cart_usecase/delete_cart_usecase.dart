import '../../repositories/cart_repository/cart_repository.dart';

class DeleteCartUseCase {
  final CartRepository repository;

  DeleteCartUseCase(this.repository);

  Future<int> deleteCart({required int cartId}) {
    return repository.deleteCart(cartId: cartId);
  }
}
