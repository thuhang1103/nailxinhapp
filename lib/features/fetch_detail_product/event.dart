abstract class ProductDetailEvent {
  const ProductDetailEvent();
}
// ...existing code...

class FetchProductDetail extends ProductDetailEvent {
  final int? productId;
  const FetchProductDetail({this.productId});
}
