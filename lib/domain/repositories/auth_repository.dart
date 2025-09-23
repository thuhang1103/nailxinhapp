import '../entities/user_token.dart';
import 'package:dio/dio.dart';

abstract class AuthRepository {
  Future<UserToken> login({required String username, required String password});
  Future<String> logout();
  Future<String> getRole();
  Future<Map<String, dynamic>> refreshToken(String refreshToken);
  Future<dynamic> retryRequest(RequestOptions opts, String accessToken);
  // đăng ký customer
  Future<void> sendOtp(String email);
  Future<String> verifyOtp(String email, String otp);
  Future<int> registerCustomer({
    required String email,
    required String password,
    required String username,
    required String registrationToken,
  });
}
