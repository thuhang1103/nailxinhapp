import '../../../domain/repositories/cart_repository/cart_repository.dart';
import '../../datasources/cart_data/cart_data.dart';

class CartRepositoryImpl implements CartRepository {
  final CartData data;

  CartRepositoryImpl(this.data);

  @override
  Future<int> createCart({required int customerId}) async {
    try {
      final cartId = await data.createCart(customerId: customerId);
      return cartId;
    } catch (e) {
      // có thể log ở đây nếu muốn
      rethrow;
    }
  }

  @override
  Future<int> deleteCart({required int cartId}) async {
    try {
      final affected = await data.deleteCart(cartId: cartId);
      return affected;
    } catch (e) {
      // có thể log ở đây nếu muốn
      rethrow;
    }
  }
}
