class Product {
  final int productId;
  final String productName;
  final String? description;
  final double price;
  final int? categoryId;
  final int stockQuantity;
  final int soldQuantity;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int statusProduct;

  const Product({
    required this.productId,
    required this.productName,
    this.description,
    required this.price,
    this.categoryId,
    this.stockQuantity = 0,
    this.soldQuantity = 0,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    this.statusProduct = 0,
  });
}
