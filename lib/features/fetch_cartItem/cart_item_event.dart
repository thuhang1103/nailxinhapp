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
  final int variantId;
  final int isSelected;
  const ChangeIsSelectedEvent({
    required this.cartItemId,
    required this.quantity,
    required this.variantId,
    required this.isSelected,
  });
}

//selectedall
class SelectAllCartItemsEvent extends CartItemEvent {
  const SelectAllCartItemsEvent();
}

// delete cart item
class DeleteCartItemEvent extends CartItemEvent {
  final int cartItemId;
  const DeleteCartItemEvent({required this.cartItemId});
}

//increaseqty
class IncreaseQuantityEvent extends CartItemEvent {
  final int cartItemId;
  final int stock;
  const IncreaseQuantityEvent({required this.cartItemId, required this.stock});
}

//decreaseqty
class DecreaseQuantityEvent extends CartItemEvent {
  final int cartItemId;
  const DecreaseQuantityEvent({required this.cartItemId});
}
