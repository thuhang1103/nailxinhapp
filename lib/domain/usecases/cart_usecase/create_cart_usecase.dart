import '../../repositories/cart_repository/cart_repository.dart';

class CreateCartUseCase {
  final CartRepository repository;

  CreateCartUseCase(this.repository);

  Future<int> createCart({required int customerId}) {
    return repository.createCart(customerId: customerId);
  }
}
