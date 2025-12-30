import '../../entities/cart_item.dart';
import '../../entities/option_value.dart';
import '../../entities/option.dart';
import '../../entities/full_option.dart';

abstract class CartItemRepository {
  Future<int> addCartItem({
    required int userId,
    required int productId,
    required int variantId,
    required int quantity,
    required double price,
  });

  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    int? variantId,
    int? isSelected,
  });

  Future<bool> deleteCartItem({required int cartItemId});

  Future<CartItem?> getById({required int cartItemId});

  Future<List<CartItem>> getAllByUserId({required int userId});
  Future<int> getUserID();
  //optionvalue
  Future<List<OptionValue>> getOptionValues({required int optionID});
  Future<List<Option>> getOptionByProductID({required int productID});
  Future<int> getVariantIDByOptions({
    required int valueID1,
    required int? valueID2,
  });
  Future<int> checkCartItemExists({
    required int userId,
    required int variantId,
    required int quantity,
  });
}
