import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/appException.dart';
//entity
import '../../domain/entities/vouchers.dart';
//helper
import '../../core/helper.dart';
//model
import '../models/voucher_model.dart';

abstract class VoucherData {
  Future<List<Voucher>> getAllVoucher();
  Future<Voucher> getMaxVoucher();
  Future<List<Voucher>> getVoucherAvailable(double total);
  // create / update / delete
  Future<int> createVoucher(
    String Code,
    String Description,
    double MinOrderValue,
    double DiscountAmount,
    DateTime StartDate,
    DateTime EndDate,
  );
  Future<void> updateVoucher(
    int id,
    String Code,
    String Description,
    double MinOrderValue,
    double DiscountAmount,
    DateTime StartDate,
    DateTime EndDate,
  );
  Future<void> deleteVoucher(int id);
}

class VoucherDataImpl implements VoucherData {
  final Dio dio;
  final String basePath;
  VoucherDataImpl(this.dio, {this.basePath = '/vouchers'});

  @override
  Future<List<Voucher>> getAllVoucher() async {
    try {
      print('Fetching all vouchers...');
      final response = await dio.get('$basePath/all');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw const ServerException();
      }

      dynamic data = response.data;
      if (data is String) {
        data = jsonDecode(data);
      }

      // Nếu server trả về list trực tiếp
      if (data is List) {
        final List<Voucher> vouchers = data.map<Voucher>((item) {
          if (item is Map<String, dynamic>) {
            final model = VoucherModel.fromJson(item);
            return model.toEntity();
          } else {
            throw const ParseException();
          }
        }).toList();
        return vouchers;
      }

      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<Voucher> getMaxVoucher() async {
    try {
      print('Fetching max voucher...');
      final response = await dio.get('$basePath/max');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw const ServerException();
      }

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);

      if (data is Map<String, dynamic>) {
        final model = VoucherModel.fromJson(data);
        return model.toEntity();
      }
      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<List<Voucher>> getVoucherAvailable(double total) async {
    try {
      final response = await dio.get('$basePath/available?total=$total');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw const ServerException();
      }

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);

      if (data is List) {
        final List<Voucher> vouchers = data.map<Voucher>((item) {
          if (item is Map<String, dynamic>) {
            final model = VoucherModel.fromJson(item);
            return model.toEntity();
          } else {
            throw const ParseException();
          }
        }).toList();
        return vouchers;
      }
      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<int> createVoucher(
    String Code,
    String Description,
    double MinOrderValue,
    double DiscountAmount,
    DateTime StartDate,
    DateTime EndDate,
  ) async {
    try {
      final response = await dio.post(
        '$basePath/create',
        data: {
          'Code': Code,
          'Description': Description,
          'MinOrderValue': MinOrderValue,
          'DiscountAmount': DiscountAmount,
          'StartDate': StartDate.toIso8601String(),
          'EndDate': EndDate.toIso8601String(),
        },
      );
      final status = response.statusCode ?? 0;
      // controller returns 201 with { id: voucherId }
      if (status != 201) {
        final body = response.data;
        final msg = (body is Map && body['error'] != null)
            ? body['error'].toString()
            : body.toString();
        throw BusinessException(msg);
      }

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is Map && data.containsKey('id')) {
        return int.tryParse(data['id'].toString()) ?? 0;
      }
      throw const ParseException();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> updateVoucher(
    int id,
    String Code,
    String Description,
    double MinOrderValue,
    double DiscountAmount,
    DateTime StartDate,
    DateTime EndDate,
  ) async {
    try {
      final response = await dio.put(
        '$basePath/update/$id',
        data: {
          'Code': Code,
          'Description': Description,
          'MinOrderValue': MinOrderValue,
          'DiscountAmount': DiscountAmount,
          'StartDate': StartDate.toIso8601String(),
          'EndDate': EndDate.toIso8601String(),
        },
      );
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        final body = response.data;
        final msg = (body is Map && body['error'] != null)
            ? body['error'].toString()
            : body.toString();
        throw BusinessException(msg);
      }
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<void> deleteVoucher(int id) async {
    try {
      final response = await dio.delete('$basePath/delete/$id');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        final body = response.data;
        final msg = (body is Map && body['error'] != null)
            ? body['error'].toString()
            : body.toString();
        throw BusinessException(msg);
      }
      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
