import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/usertoken_model.dart';
import '../../domain/entities/user_token.dart';
import 'package:dio/dio.dart';

abstract class AuthData {
  Future<Map<String, dynamic>> refreshToken(String refreshToken);
  Future<Response<dynamic>> retryRequest(
    RequestOptions opts,
    String accessToken,
  );
  Future<String> getRole();
  Future<String> logout();
}

class AuthDataImpl implements AuthData {
  final Dio dio;

  AuthDataImpl(this.dio);
  @override
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    print('vào hàm  refreshToken: ui $refreshToken');
    final response = await dio.post(
      '/auth/refreshToken',
      data: {"refreshToken": refreshToken},
    );
    print('lấy đc refreshToken : ${response.data}');
    return response.data;
  }

  Future<Response<dynamic>> retryRequest(
    RequestOptions opts,
    String accessToken,
  ) async {
    print('Đang retry request với accessToken mới: $accessToken');
    // Clone lại request cũ để tránh ảnh hưởng trực tiếp tới opts gốc
    final newOptions = Options(
      method: opts.method,
      headers: {
        ...opts.headers,
        "Authorization": "Bearer $accessToken", // set token mới
      },
      responseType: opts.responseType,
      contentType: opts.contentType,
      sendTimeout: opts.sendTimeout,
      receiveTimeout: opts.receiveTimeout,
    );

    // Gọi lại request với token mới
    return dio.request<dynamic>(
      opts.path,
      data: opts.data,
      queryParameters: opts.queryParameters,
      options: newOptions,
    );
  }

  @override
  Future<String> getRole() async {
    try {
      print('Đang lấy role...');
      final response = await dio.get('/auth/role');
      print('Response getRole: ${response.data}');
      // AuthInterceptor sẽ tự động gắn access token vào header
      return response.data["role"];
    } catch (e) {
      throw Exception("Không thể lấy role: $e");
    }
  }

  @override
  Future<String> logout() async {
    try {
      print('Đang logout...');
      final response = await dio.post('/auth/logout');
      print('Response logout: ${response.data}');
      return response.data["message"];
    } catch (e) {
      throw Exception("Logout failed: $e");
    }
  }
}
