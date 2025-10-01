import '../../entities/products.dart';

abstract class SearchProductRepository {
  Future<List<Product>> getByName(String name);
  Future<List<Product>> getByCategory(int categoryId);
  Future<Product> getById(int id);
  Future<List<Product>> getByStatus(int status);
  Future<List<Product>> getAll();
}
