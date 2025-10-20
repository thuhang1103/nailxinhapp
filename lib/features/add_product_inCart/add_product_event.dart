abstract class CartEvent {
  const CartEvent();
}
// ...existing code...

class AddProductToCartEvent extends CartEvent {
  final int cartId;
  final int productId;
  final int quantity;
  final double price;

  const AddProductToCartEvent({
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.price,
  });
}
