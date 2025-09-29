import 'package:dio/dio.dart';
import '../../models/product_model.dart';
import '../../../domain/entities/products.dart';

abstract class SearchProductData {
  Future<List<Product>> getByName(String name);
  Future<List<Product>> getByCategory(int categoryId);
  Future<Product> getById(int id);
  Future<List<Product>> getByStatus(int status);
}

class SearchProductDataImpl implements SearchProductData {
  final Dio dio;
  SearchProductDataImpl(this.dio);

  Future<List<Product>> getByName(String name) async {
    final res = await dio.get('/searchName', queryParameters: {'name': name});
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }

  Future<List<Product>> getByCategory(int categoryId) async {
    final res = await dio.get('/category/$categoryId');
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }

  Future<Product> getById(int id) async {
    final res = await dio.get('/id/$id');
    return ProductModel.fromJson(res.data).toEntity();
  }

  Future<List<Product>> getByStatus(int status) async {
    final res = await dio.get('/status/$status');
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }
}
