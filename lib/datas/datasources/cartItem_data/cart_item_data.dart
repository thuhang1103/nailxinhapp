import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/cart_item_model.dart';
//entity
import '../../../domain/entities/cart_item.dart';

abstract class CartItemData {
  /// return created CartItemID (>0) or throw
  Future<int> addCartItem({
    required int cartId,
    required int productId,
    int quantity = 1,
    required double price,
  });
  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    bool? isSelected,
  });
  Future<bool> deleteCartItem({required int cartItemId});
  Future<CartItemModel?> getById({required int cartItemId});
  Future<List<CartItemModel>> getAllByUserId({required int userId});
}

class CartItemDataImpl implements CartItemData {
  final Dio dio;
  final String basePath;

  CartItemDataImpl(this.dio, {this.basePath = '/cart_items'});

  List<Map<String, dynamic>> _normalizeToListOfMap(dynamic data) {
    if (data == null) return [];
    if (data is List) return data.whereType<Map<String, dynamic>>().toList();
    if (data is Map<String, dynamic>) {
      // backend might wrap payload in { data: [...] }
      if (data['data'] is List) {
        return (data['data'] as List)
            .whereType<Map<String, dynamic>>()
            .toList();
      }
      return [data];
    }
    if (data is String) {
      try {
        final decoded = json.decode(data);
        if (decoded is List)
          return decoded.whereType<Map<String, dynamic>>().toList();
        if (decoded is Map<String, dynamic>) {
          if (decoded['data'] is List) {
            return (decoded['data'] as List)
                .whereType<Map<String, dynamic>>()
                .toList();
          }
          return [decoded];
        }
      } catch (_) {}
    }
    return [];
  }

  @override
  Future<int> addCartItem({
    required int cartId,
    required int productId,
    int quantity = 1,
    required double price,
  }) async {
    final res = await dio.post(
      '$basePath/add',
      data: {
        'CartID': cartId,
        'ProductID': productId,
        'Quantity': quantity,
        'Price': price,
      },
    );

    final data = res.data;
    if (data is Map<String, dynamic>) {
      if (data['CartItemID'] != null) {
        return int.tryParse(data['CartItemID'].toString()) ?? 0;
      }
      if (data['insertId'] != null) {
        return int.tryParse(data['insertId'].toString()) ?? 0;
      }
    }
    throw Exception('Unexpected addCartItem response: ${res.data}');
  }

  @override
  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    bool? isSelected,
  }) async {
    final payload = <String, dynamic>{};
    if (quantity != null) payload['Quantity'] = quantity;
    if (isSelected != null) payload['is_selected'] = isSelected ? 1 : 0;

    if (payload.isEmpty) {
      throw ArgumentError(
        'At least one of quantity or isSelected must be provided',
      );
    }

    final res = await dio.patch('$basePath/update/$cartItemId', data: payload);
    final data = res.data;

    if (data is Map<String, dynamic>) {
      if (data['affectedRows'] != null) {
        return int.tryParse(data['affectedRows'].toString()) ?? 0;
      }
      if (data['affected'] != null) {
        return int.tryParse(data['affected'].toString()) ?? 0;
      }
    }

    // if backend returns 200 with message but no affectedRows, assume success = 1
    if (res.statusCode == 200) return 1;

    throw Exception('Unexpected updateCartItem response: ${res.data}');
  }

  @override
  Future<bool> deleteCartItem({required int cartItemId}) async {
    final res = await dio.delete('$basePath/delete/$cartItemId');
    final data = res.data;
    if (data is Map<String, dynamic>) {
      // controller returns message on success
      if (data.containsKey('message')) return true;
      // or may return affectedRows
      if (data['affectedRows'] != null) {
        return (int.tryParse(data['affectedRows'].toString()) ?? 0) > 0;
      }
    }
    // fallback: 200 -> success
    if (res.statusCode == 200) return true;
    return false;
  }

  @override
  Future<CartItemModel?> getById({required int cartItemId}) async {
    final res = await dio.get('$basePath/$cartItemId');
    final data = res.data;
    final list = _normalizeToListOfMap(data);
    if (list.isEmpty) return null;
    return CartItemModel.fromJson(list.first);
  }

  @override
  Future<List<CartItemModel>> getAllByUserId({required int userId}) async {
    final res = await dio.get('$basePath/user/$userId');
    final list = _normalizeToListOfMap(res.data);
    return list.map((m) => CartItemModel.fromJson(m)).toList();
  }
}
