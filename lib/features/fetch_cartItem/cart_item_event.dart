abstract class CartItemEvent {
  const CartItemEvent();
}
// ...existing code...

class GetCartItemEvent extends CartItemEvent {
  const GetCartItemEvent();
}

// changeisSelected
class ChangeIsSelectedEvent extends CartItemEvent {
  final int cartItemId;
  final int quantity;
  final int isSelected;
  const ChangeIsSelectedEvent({
    required this.cartItemId,
    required this.quantity,
    required this.isSelected,
  });
}

//selectedall
class SelectAllCartItemsEvent extends CartItemEvent {
  final int cartId;
  final int isSelected;
  const SelectAllCartItemsEvent({
    required this.cartId,
    required this.isSelected,
  });
}

// delete cart item
class DeleteCartItemEvent extends CartItemEvent {
  final int cartItemId;
  const DeleteCartItemEvent({required this.cartItemId});
}

//increaseqty
class IncreaseQuantityEvent extends CartItemEvent {
  final int cartItemId;
  const IncreaseQuantityEvent({required this.cartItemId});
}

//decreaseqty
class DecreaseQuantityEvent extends CartItemEvent {
  final int cartItemId;
  const DecreaseQuantityEvent({required this.cartItemId});
}
