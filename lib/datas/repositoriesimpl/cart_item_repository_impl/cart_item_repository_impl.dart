// lib/datas/repositoriesimpl/cart_item_repository_impl/cart_item_repository_impl.dart
import '../../../datas/datasources/cartItem_data/cart_item_data.dart';
import '../../../domain/repositories/cart_item_repository/cart_item_repository.dart';
import '../../../domain/entities/cart_item.dart';

class CartItemRepositoryImpl implements CartItemRepository {
  final CartItemData data;

  CartItemRepositoryImpl(this.data);

  @override
  Future<int> addCartItem({
    required int cartId,
    required int productId,
    int quantity = 1,
    required double price,
  }) async {
    final insertId = await data.addCartItem(
      cartId: cartId,
      productId: productId,
      quantity: quantity,
      price: price,
    );
    if (insertId <= 0) {
      throw Exception('Failed to add cart item');
    }
    return insertId;
  }

  @override
  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    int? isSelected,
  }) async {
    final affected = await data.updateCartItem(
      cartItemId: cartItemId,
      quantity: quantity,
      isSelected: isSelected,
    );
    return affected;
  }

  @override
  Future<bool> deleteCartItem({required int cartItemId}) async {
    final ok = await data.deleteCartItem(cartItemId: cartItemId);
    return ok;
  }

  @override
  Future<CartItem?> getById({required int cartItemId}) async {
    final model = await data.getById(cartItemId: cartItemId);
    return model?.toEntity();
  }

  @override
  Future<List<CartItem>> getAllByUserId({required int userId}) async {
    final models = await data.getAllByUserId(userId: userId);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<int> getUserID() async {
    final userId = await data.getUserID();
    return userId;
  }
}
