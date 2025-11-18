import 'package:dio/dio.dart';
import '../../models/product_model.dart';
import '../../models/product_detail_model.dart';
import '../../../domain/entities/products.dart';
import '../../../domain/entities/product_detail.dart';
import 'dart:convert';

abstract class SearchProductData {
  Future<List<Product>> getByName(String name);
  Future<List<Product>> getByCategory(int categoryId);
  Future<ProductDetail> getById(int id);
  Future<List<Product>> getByStatus(int status);
  Future<List<Product>> getAll();
}

class SearchProductDataImpl implements SearchProductData {
  final Dio dio;
  SearchProductDataImpl(this.dio);

  Future<List<Product>> getByName(String name) async {
    final res = await dio.get(
      '/products/searchName',
      queryParameters: {'name': name},
    );
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }

  Future<List<Product>> getByCategory(int categoryId) async {
    final res = await dio.get('/products/category/$categoryId');
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }

  Future<ProductDetail> getById(int id) async {
    final res = await dio.get('/products/id/$id');

    final data = res.data;
    Map<String, dynamic>? productJson;

    if (data is Map<String, dynamic>) {
      productJson = data;
    } else if (data is List &&
        data.isNotEmpty &&
        data.first is Map<String, dynamic>) {
      productJson = data.first as Map<String, dynamic>;
    } else if (data is String) {
      try {
        final parsed = json.decode(data);
        if (parsed is Map<String, dynamic>) {
          productJson = parsed;
        } else if (parsed is List &&
            parsed.isNotEmpty &&
            parsed.first is Map<String, dynamic>) {
          productJson = parsed.first as Map<String, dynamic>;
        }
      } catch (e, st) {
        print('Error parsing getById JSON response: $e');
        print(st.toString());
        rethrow;
      }
    }

    if (productJson == null) {
      throw Exception('Unexpected response format for getById: ${res.data}');
    }
    // final test = ProductDetailModel.fromJson(productJson).toEntity();
    // print("ProductDetail: $test");

    return ProductDetailModel.fromJson(productJson).toEntity();
  }

  Future<List<Product>> getByStatus(int status) async {
    final res = await dio.get('/products/status/$status');
    final List data = res.data as List;

    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }

  Future<List<Product>> getAll() async {
    final res = await dio.get('/products/all');
    final List data = res.data as List;
    return data.map((json) => ProductModel.fromJson(json).toEntity()).toList();
  }
}
