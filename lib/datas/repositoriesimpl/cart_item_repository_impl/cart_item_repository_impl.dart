// lib/datas/repositoriesimpl/cart_item_repository_impl/cart_item_repository_impl.dart
import '../../../datas/datasources/cartItem_data/cart_item_data.dart';
import '../../../domain/repositories/cart_item_repository/cart_item_repository.dart';
import '../../../domain/entities/cart_item.dart';
import '../../../domain/entities/option_value.dart';
import '../../../domain/entities/option.dart';

class CartItemRepositoryImpl implements CartItemRepository {
  final CartItemData data;

  CartItemRepositoryImpl(this.data);

  @override
  Future<int> addCartItem({
    required int userId,
    required int productId,
    required int variantId,
    int quantity = 1,
    required double price,
  }) async {
    final insertId = await data.addCartItem(
      userId: userId,
      productId: productId,
      variantId: variantId,
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
    int? variantId,
    int? isSelected,
  }) async {
    final affected = await data.updateCartItem(
      cartItemId: cartItemId,
      quantity: quantity,
      variantId: variantId,
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

  @override
  Future<List<OptionValue>> getOptionValues({required int optionID}) async {
    final models = await data.getOptionValues(optionID: optionID);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Option>> getOptionByProductID({required int productID}) async {
    final models = await data.getOptionByProductID(productID: productID);
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<int> getVariantIDByOptions({
    required int valueID1,
    required int? valueID2,
  }) async {
    final variantId = await data.getProductVariantID(
      valueID1: valueID1,
      valueID2: valueID2,
    );
    return variantId;
  }

  @override
  Future<int> checkCartItemExists({
    required int userId,
    required int variantId,
    required int quantity,
  }) async {
    final cartItemId = await data.checkCartItemExists(
      userId: userId,
      variantId: variantId,
      quantity: quantity,
    );
    return cartItemId;
  }
}
