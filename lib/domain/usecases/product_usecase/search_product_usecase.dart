import '../../entities/products.dart';
import '../../repositories/product_repository/search_product_repository.dart';

class SearchProductUseCase {
  final SearchProductRepository repository;

  SearchProductUseCase(this.repository);

  Future<List<Product>> searchByName(String name) {
    return repository.getByName(name);
  }

  Future<List<Product>> searchByCategory(int categoryId) {
    return repository.getByCategory(categoryId);
  }

  Future<Product> searchById(int id) {
    return repository.getById(id);
  }

  Future<List<Product>> searchByStatus(int status) {
    return repository.getByStatus(status);
  }

  Future<List<Product>> getAllProducts() {
    return repository.getAll();
  }
}
