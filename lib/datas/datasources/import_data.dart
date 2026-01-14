import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/helper.dart';

import '../../core/appException.dart';
//entity
import '../../domain/entities/point.dart';
//model
import '../models/point_model.dart';

abstract class ImportData {
  Future<int> createImportInventory({
    String note = '',
    required double totalAmount,
    DateTime? createdAt,
  });
}

class ImportDataImpl implements ImportData {
  final Dio dio;
  final String basePath;

  ImportDataImpl(this.dio, {this.basePath = '/imports'});

  @override
  Future<int> createImportInventory({
    String note = '',
    required double totalAmount,
    DateTime? createdAt,
  }) async {
    try {
      final body = <String, dynamic>{
        'note': note,
        'totalAmount': totalAmount,
        if (createdAt != null) 'createdAt': createdAt.toIso8601String(),
      };

      final response = await dio.post(
        '$basePath/import',
        data: body,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final status = response.statusCode ?? 0;
      if (status == 201) {
        dynamic data = response.data;
        if (data is String) data = jsonDecode(data);
        if (data is Map<String, dynamic> && data['id'] != null) {
          return (data['id'] as num).toInt();
        }
        throw ParseException();
      } else if (status >= 400 && status < 500) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
