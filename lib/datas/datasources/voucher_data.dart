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
}
