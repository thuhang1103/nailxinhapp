import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../models/cart_item_model.dart';
import '../../models/option_value_model.dart';
import '../../models/option_model.dart';
import '../../../core/appException.dart';
//entity
import '../../../domain/entities/cart_item.dart';

abstract class CartItemData {
  /// return created CartItemID (>0) or throw
  Future<int> addCartItem({
    required int userId,
    required int productId,
    required int variantId,
    int quantity = 1,
    required double price,
  });
  Future<int> updateCartItem({
    required int cartItemId,
    int? quantity,
    int? variantId,
    int? isSelected,
  });
  Future<bool> deleteCartItem({required int cartItemId});
  Future<CartItemModel?> getById({required int cartItemId});
  Future<List<CartItemModel>> getAllByUserId({required int userId});
  Future<int> getUserID();
  //optionvalue
  Future<List<OptionValueModel>> getOptionValues({required int optionID});
  Future<List<OptionModel>> getOptionByProductID({required int productID});
  Future<int> getProductVariantID({
    required int valueID1,
    required int? valueID2,
  });
  Future<int> checkCartItemExists({
    required int userId,
    required int variantId,
    required int quantity,
  });
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
    required int userId,
    required int productId,
    required int variantId,
    int quantity = 1,
    required double price,
  }) async {
    final res = await dio.post(
      '$basePath/add',
      data: {
        'UserID': userId,
        'ProductID': productId,
        'VariantID': variantId,
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
    int? variantId,
    int? isSelected,
  }) async {
    final payload = <String, dynamic>{};
    if (quantity != null) payload['Quantity'] = quantity;
    if (variantId != null) payload['VariantID'] = variantId;
    if (isSelected != null) payload['is_selected'] = isSelected;

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

  @override
  Future<int> getUserID() async {
    try {
      final res = await dio.get('/auth/getUserID');
      final data = res.data;
      if (data == null || data['ok'] != true) {
        throw Exception("API trả dữ liệu không hợp lệ");
      }
      final userId = data['UserID'];
      return int.tryParse(userId.toString()) ?? 0;
    } catch (e) {
      print("Error in getUserID: $e");
      return 0;
    }
  }

  @override
  Future<List<OptionValueModel>> getOptionValues({
    required int optionID,
  }) async {
    try {
      final res = await dio.get('/products/variant-values/$optionID');
      final list = _normalizeToListOfMap(res.data);
      return list.map((m) => OptionValueModel.fromJson(m)).toList();
    } on DioError catch (e) {
      final status = e.response?.statusCode;

      // an toàn lấy message
      String? message;
      final respData = e.response?.data;
      if (respData is Map<String, dynamic>) {
        message = respData['message']?.toString();
      } else if (respData != null) {
        message = respData.toString();
      }

      if (status != null) {
        if (status >= 500) throw const ServerException();
        if (status >= 400) throw BusinessException(message);
      }

      throw const UnknownException();
    } catch (e) {
      if (e is FormatException || e is TypeError) throw const ParseException();
      if (e is AppException) rethrow;
      throw const UnknownException();
    }
  }

  @override
  Future<List<OptionModel>> getOptionByProductID({
    required int productID,
  }) async {
    try {
      final res = await dio.get('/products/variant-options/$productID');
      final list = _normalizeToListOfMap(res.data);

      return list.map((m) => OptionModel.fromJson(m)).toList();
    } on DioError catch (e) {
      final status = e.response?.statusCode;

      String? message;
      final respData = e.response?.data;
      if (respData is Map<String, dynamic>) {
        message = respData['message']?.toString();
      } else if (respData != null) {
        message = respData.toString();
      }

      if (status != null) {
        if (status >= 500) throw const ServerException();
        if (status >= 400) throw BusinessException(message);
      }

      throw const UnknownException();
    } catch (e) {
      if (e is FormatException || e is TypeError) throw const ParseException();
      if (e is AppException) rethrow;
      throw const UnknownException();
    }
  }

  @override
  Future<int> getProductVariantID({
    required int valueID1,
    required int? valueID2,
  }) async {
    try {
      print('Getting variant ID for valueID1: $valueID1, valueID2: $valueID2');
      final res = await dio.get(
        '/products/variantID',
        queryParameters: {
          'option1ValueId': valueID1,
          if (valueID2 != null) 'option2ValueId': valueID2,
        },
      );
      final data = res.data;
      print('Response data: $data');

      if (data is Map<String, dynamic>) {
        final vid = data['variantId'] ?? data['variantID'] ?? data['variantid'];
        if (vid != null) return int.tryParse(vid.toString()) ?? 0;
      }

      throw const UnknownException();
    } on DioError catch (e) {
      final status = e.response?.statusCode;

      // safe extract message
      String? message;
      final respData = e.response?.data;
      if (respData is Map<String, dynamic>) {
        message = respData['message']?.toString();
      } else if (respData != null) {
        message = respData.toString();
      }

      if (status != null) {
        if (status >= 500) throw const ServerException();
        if (status >= 400) throw BusinessException(message);
      }

      throw const UnknownException();
    } catch (e) {
      if (e is FormatException || e is TypeError) throw const ParseException();
      if (e is AppException) rethrow;
      throw const UnknownException();
    }
  }

  @override
  Future<int> checkCartItemExists({
    required int userId,
    required int variantId,
    required int quantity,
  }) async {
    try {
      final res = await dio.post(
        '$basePath/check-exists',
        data: {
          'userId': userId,
          'variantId': variantId,
          'addQuantity': quantity,
        },
      );

      if (res.statusCode == 200) {
        final value = res.data['existsItem'];
        return int.tryParse(value.toString()) ?? 0;
      }

      final respData = res.data;
      String? message;
      if (respData is Map<String, dynamic>)
        message = respData['message']?.toString();
      else if (respData != null)
        message = respData.toString();

      if (res.statusCode != null) {
        final status = res.statusCode!;
        if (status >= 500) throw const ServerException();
        if (status >= 400) throw BusinessException(message);
      }

      throw const UnknownException();
    } on DioError catch (e) {
      // map DioError -> AppException
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.error is Exception) {
        if (e.error is SocketException) throw const NetworkException();
      }

      final status = e.response?.statusCode;
      final respData = e.response?.data;
      String? message;
      if (respData is Map<String, dynamic>)
        message = respData['message']?.toString();
      else if (respData != null)
        message = respData.toString();

      if (status != null) {
        if (status >= 500) throw const ServerException();
        if (status >= 400) throw BusinessException(message);
      }

      throw const UnknownException();
    } catch (e) {
      if (e is FormatException || e is TypeError) throw const ParseException();
      if (e is AppException) rethrow;
      throw const UnknownException();
    }
  }
}
