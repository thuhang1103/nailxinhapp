import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/helper.dart';

import '../../core/appException.dart';
//entity
import '../../domain/entities/order/order.dart';
import '../../domain/entities/order/order_detail.dart';

//model
import '../models/order/order_model.dart';
import '../models/order/order_detail_model.dart';

abstract class OrderData {
  Future<int> createOrder({
    required int addressId,
    required String addressName,
    int? voucherId,
    required double totalAmount,
    double discountAmount = 0,
  });

  Future<List<Order>> getMyOrders({String status = ''});
  Future<List<Order>> getOrdersByStatus({required String status});
  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
  });

  Future<int> createOrderDetail({
    required int orderId,
    required int productId,
    required String productName,
    required String variantName,
    required String imagePath,
    required int quantity,
    required double price,
  });

  Future<List<OrderDetail>> getOrderDetailsByOrderId(int orderId);
}

class OrderDataImpl implements OrderData {
  final Dio dio;
  final String basePath;

  OrderDataImpl(this.dio, {this.basePath = '/orders'});

  @override
  Future<int> createOrder({
    required int addressId,
    required String addressName,
    int? voucherId,
    required double totalAmount,
    double discountAmount = 0,
  }) async {
    try {
      final payload = {
        'addressId': addressId,
        'addressName': addressName,
        'voucherId': voucherId,
        'totalAmount': totalAmount,
        'discountAmount': discountAmount,
      };

      final res = await dio.post('$basePath/create', data: payload);
      final status = res.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw ServerException();
      }

      dynamic data = res.data;
      if (data is String) data = jsonDecode(data);
      if (data is Map<String, dynamic> && data.containsKey('OrderID')) {
        return (data['OrderID'] as num).toInt();
      }

      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<List<Order>> getMyOrders({String status = ''}) async {
    try {
      final res = await dio.get(
        '$basePath/my',
        queryParameters: {'status': status},
      );
      final statusCode = res.statusCode ?? 0;
      if (statusCode < 200 || statusCode >= 300) throw ServerException();

      dynamic data = res.data;
      if (data is String) data = jsonDecode(data);
      if (data is! List) throw const ParseException();

      return (data as List)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<List<Order>> getOrdersByStatus({required String status}) async {
    try {
      print('vào data: $status');
      final res = await dio.get(
        '$basePath/get-all',
        queryParameters: {'status': status},
      );
      final statusCode = res.statusCode ?? 0;
      if (statusCode < 200 || statusCode >= 300) throw ServerException();

      dynamic data = res.data as List;
      if (data is String) data = jsonDecode(data);
      if (data is! List) throw const ParseException();
      print('dữ liệu trả về: $data');

      final kqqq = data
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>).toEntity())
          .toList();

      print('dữ liệu trả về cho bloc : $kqqq');
      return kqqq;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
  }) async {
    try {
      print('Update order status request: $orderId, $status');
      final res = await dio.put(
        '$basePath/update-order',
        data: {'orderId': orderId, 'status': status},
      );
      final statusCode = res.statusCode ?? 0;
      print('Update order status response: $statusCode');
      if (statusCode < 200 || statusCode >= 300) {
        // try parse error message from body
        dynamic body = res.data;
        print('Error response: $body');
        if (body is String) {
          try {
            body = jsonDecode(body);
          } catch (_) {}
        }
        if (body is Map && body.containsKey('error')) {
          throw BusinessException(body['error'].toString());
        }
        throw ServerException();
      }
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<int> createOrderDetail({
    required int orderId,
    required int productId,
    required String productName,
    required String variantName,
    required String imagePath,
    required int quantity,
    required double price,
  }) async {
    try {
      final payload = {
        'orderId': orderId,
        'productId': productId,
        'quantity': quantity,
        'price': price,
      };

      final res = await dio.post(
        '$basePath/create-order-detail',
        data: payload,
      );
      final statusCode = res.statusCode ?? 0;
      if (statusCode < 200 || statusCode >= 300) throw ServerException();

      dynamic data = res.data;
      if (data is String) data = jsonDecode(data);
      if (data is Map<String, dynamic> && data.containsKey('OrderDetailID')) {
        return (data['OrderDetailID'] as num).toInt();
      }
      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<List<OrderDetail>> getOrderDetailsByOrderId(int orderId) async {
    try {
      final res = await dio.get('$basePath/order-details/$orderId');
      final statusCode = res.statusCode ?? 0;
      if (statusCode < 200 || statusCode >= 300) throw ServerException();

      dynamic data = res.data as List;
      if (data is String) data = jsonDecode(data);
      if (data is! List) throw const ParseException();

      return data
          .map(
            (e) =>
                OrderDetailModel.fromJson(e as Map<String, dynamic>).toEntity(),
          )
          .toList();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
