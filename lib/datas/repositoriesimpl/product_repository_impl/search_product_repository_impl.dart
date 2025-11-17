import '../../../datas/datasources/product_data/search_products.dart';
import '../../../domain/repositories/product_repository/search_product_repository.dart';
import '../../../domain/entities/products.dart';
import '../../../domain/entities/product_detail.dart';

class SearchProductRepositoryImpl implements SearchProductRepository {
  final SearchProductData productData;

  SearchProductRepositoryImpl(this.productData);

  @override
  Future<List<Product>> getByName(String name) {
    return productData.getByName(name);
  }

  @override
  Future<List<Product>> getByCategory(int categoryId) {
    return productData.getByCategory(categoryId);
  }

  @override
  Future<ProductDetail> getById(int id) {
    return productData.getById(id);
  }

  @override
  Future<List<Product>> getByStatus(int status) {
    return productData.getByStatus(status);
  }

  @override
  Future<List<Product>> getAll() {
    return productData.getAll();
  }
}
