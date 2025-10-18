abstract class CartEvent {
  const CartEvent();
}
// ...existing code...

class AddProductToCart extends CartEvent {
  final int? productId;
  const AddProductToCart({this.productId});
}
