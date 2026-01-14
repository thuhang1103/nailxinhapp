import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/helper.dart';

import '../../core/appException.dart';
//entity
import '../../domain/entities/spending.dart';

abstract class SpendingData {
  Future<double> getCurrentMonthSpending();
  Future<List<MonthlySpending>> getMonthlySpendingCurrentYear();
  Future<int> countCompletedOrdersCurrentMonth();
  Future<double> sumCurrentYear();
  Future<int> countCompletedOrdersCurrentYear();
}

class SpendingDataImpl implements SpendingData {
  final Dio dio;
  final String basePath;

  SpendingDataImpl(this.dio, {this.basePath = '/spendings'});

  @override
  Future<double> getCurrentMonthSpending() async {
    try {
      final response = await dio.get('$basePath/current-month');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map && data is! Map<String, dynamic>) throw ParseException();

      final raw = (data as Map).containsKey('TotalSpending')
          ? data['TotalSpending']
          : 0;
      final value = double.tryParse(raw?.toString() ?? '') ?? 0.0;
      print(value);
      return value;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<List<MonthlySpending>> getMonthlySpendingCurrentYear() async {
    try {
      final response = await dio.get('$basePath/monthly');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);

      if (data is! List) return <MonthlySpending>[];

      final list = (data as List).map((e) {
        final m = Map<String, dynamic>.from(e as Map);
        return MonthlySpending(
          year: int.tryParse(m['Year']?.toString() ?? '') ?? 0,
          month: int.tryParse(m['Month']?.toString() ?? '') ?? 0,
          totalSpending:
              double.tryParse(m['TotalSpending']?.toString() ?? '') ?? 0.0,
        );
      }).toList();

      return list;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<int> countCompletedOrdersCurrentMonth() async {
    try {
      final response = await dio.get('$basePath/completed-orders/count');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is Map && data.containsKey('CompletedOrderCount')) {
        return int.tryParse(data['CompletedOrderCount'].toString()) ?? 0;
      }
      throw ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<double> sumCurrentYear() async {
    try {
      final response = await dio.get('$basePath/total-amount');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map && data is! Map<String, dynamic>) throw ParseException();

      final raw = (data as Map).containsKey('TotalAmount')
          ? data['TotalAmount']
          : 0;

      final value = double.tryParse(raw?.toString() ?? '') ?? 0.0;
      return value;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<int> countCompletedOrdersCurrentYear() async {
    try {
      final response = await dio.get('$basePath/completed-orders/count/year');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is Map && data.containsKey('CompletedOrderCount')) {
        return int.tryParse(data['CompletedOrderCount'].toString()) ?? 0;
      }
      throw ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
