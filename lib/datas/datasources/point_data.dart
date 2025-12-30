import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/helper.dart';

import '../../core/appException.dart';
//entity
import '../../domain/entities/point.dart';
//model
import '../models/point_model.dart';

abstract class PointData {
  Future<Point> getLoyaltyPoints();
  Future<String> getMembershipLevel();
  Future<void> addPointsDaily();
  Future<int> getPointsStatus();
  Future<bool> checkCanSpinToday();
  Future<int> spinLucky();
}

class PointDataImpl implements PointData {
  final Dio dio;
  final String basePath;

  PointDataImpl(this.dio, {this.basePath = '/points'});
  @override
  Future<Point> getLoyaltyPoints() async {
    try {
      print('Fetching loyalty points...');
      final response = await dio.get('$basePath/loyalty-points');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw ServerException();
      }

      dynamic data = response.data;

      if (data is String) {
        data = jsonDecode(data);
      }
      if (data is! Map<String, dynamic>) {
        throw ParseException();
      }
      print('Loyalty points data received: $data');

      final model = PointModel.fromJson(data);
      return model.toEntity();
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<String> getMembershipLevel() async {
    try {
      print('Fetching membership level...');
      final response = await dio.get('$basePath/membership-level');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw const ServerException();
      }

      dynamic data = response.data;
      if (data is String) {
        data = jsonDecode(data);
      }
      print('Membership level data received: ${data['MembershipLevel']}');

      if (data is Map<String, dynamic>) {
        final level = data['MembershipLevel'];
        if (level is String) return level;
        throw const ParseException();
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
  Future<void> addPointsDaily() async {
    try {
      final response = await dio.post('$basePath/add-points');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) {
        throw const ServerException();
      }

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map<String, dynamic>) throw const ParseException();

      final msg = data['message']?.toString();
      final affected =
          int.tryParse((data['affectedRows'] ?? 0).toString()) ?? 0;

      if (affected <= 0) {
        throw BusinessException(msg ?? 'Không thể cộng điểm');
      }

      return;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<int> getPointsStatus() async {
    try {
      print('Fetching points status...');
      final response = await dio.get('$basePath/points-status');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw const ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map<String, dynamic>) throw const ParseException();
      final canClaimToday = data['canClaimToday'];
      print('Points status data received: $data');
      return int.tryParse(canClaimToday?.toString() ?? '') ?? 0;
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }

  @override
  Future<bool> checkCanSpinToday() async {
    try {
      final response = await dio.get('$basePath/can-spin-today');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw const ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map<String, dynamic>) throw const ParseException();

      final canSpin = data['canSpin'];

      if (canSpin is bool) return canSpin;
      if (canSpin is num) return canSpin.toInt() != 0;
      if (canSpin is String) return canSpin.toLowerCase() == 'true';
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
  Future<int> spinLucky() async {
    try {
      final response = await dio.post('$basePath/spin-lucky');
      final status = response.statusCode ?? 0;
      if (status < 200 || status >= 300) throw const ServerException();

      dynamic data = response.data;
      if (data is String) data = jsonDecode(data);
      if (data is! Map<String, dynamic>) throw const ParseException();

      final success = data['success'];
      final points = data['pointsReceived'];

      if (success is bool && success == true) {
        final pts = int.tryParse(points?.toString() ?? '') ?? 0;
        return pts;
      }

      final message = data['message']?.toString();
      throw BusinessException(message ?? 'Không thể quay thưởng');
    } on DioException catch (e) {
      throw mapDioExceptionToAppException(e);
    } on FormatException catch (_) {
      throw const ParseException();
    } catch (e) {
      throw BusinessException(e.toString());
    }
  }
}
