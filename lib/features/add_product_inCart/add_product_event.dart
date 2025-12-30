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

class LoadFullOptions extends CartEvent {
  final int productId;
  LoadFullOptions(this.productId);
}

class SelectValue extends CartEvent {
  final int optionId;
  final int valueID;
  SelectValue(this.optionId, this.valueID);
}

class ChangeQuantity extends CartEvent {
  final int quantity;
  ChangeQuantity(this.quantity);
}

class AddToCart extends CartEvent {
  final int productId;
  AddToCart(this.productId);
}

class ResetState extends CartEvent {}
