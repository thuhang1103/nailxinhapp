import '../../entities/cart_item.dart';
import 'package:dio/dio.dart';

abstract class CartItemRepository {
  Future<int> addCartItem({
    required int cartId,
    required int productId,
    required int quantity,
    required double price,
  });

  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    bool? isSelected,
  });

  Future<bool> deleteCartItem({required int cartItemId});

  Future<CartItem?> getById({required int cartItemId});

  Future<List<CartItem>> getAllByUserId({required int userId});
}
