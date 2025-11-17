import '../../entities/products.dart';
import '../../entities/product_detail.dart';

abstract class SearchProductRepository {
  Future<List<Product>> getByName(String name);
  Future<List<Product>> getByCategory(int categoryId);
  Future<ProductDetail> getById(int id);
  Future<List<Product>> getByStatus(int status);
  Future<List<Product>> getAll();
}
