import 'dart:convert';
import '../../domain/entities/products.dart';

class ProductModel {
  final int productId;
  final String productName;
  final String? description;
  final double basePrice;
  final int? categoryId;
  final int stockQuantity;
  final int soldQuantity;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int statusProduct;

  ProductModel({
    required this.productId,
    required this.productName,
    this.description,
    required this.basePrice,
    this.categoryId,
    this.stockQuantity = 0,
    this.soldQuantity = 0,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    this.statusProduct = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['ProductID'] as int,
      productName: json['ProductName'],
      description: json['Description'],
      basePrice: double.parse(json['BasePrice'].toString()),
      categoryId: json['CategoryID'],
      stockQuantity: json['StockQuantity'] ?? 0,
      soldQuantity: json['SoldQuantity'] ?? 0,
      imagePath: json['ImagePath'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
      statusProduct: json['Status_Product'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'ProductID': productId,
    'ProductName': productName,
    'Description': description,
    'BasePrice': basePrice,
    'CategoryID': categoryId,
    'StockQuantity': stockQuantity,
    'SoldQuantity': soldQuantity,
    'ImagePath': imagePath,
    'CreatedAt': createdAt.toIso8601String(),
    'UpdatedAt': updatedAt.toIso8601String(),
    'Status_Product': statusProduct,
  };
  Product toEntity() {
    return Product(
      productId: this.productId,
      productName: this.productName,
      description: this.description,
      basePrice: this.basePrice,
      categoryId: this.categoryId,
      stockQuantity: this.stockQuantity,
      soldQuantity: this.soldQuantity,
      imagePath: this.imagePath,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      statusProduct: this.statusProduct,
    );
  }
}
