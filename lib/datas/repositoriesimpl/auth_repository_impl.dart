import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/login_data.dart';
import '../../domain/entities/user_token.dart';
import '../datasources/auth_data.dart';
import 'package:dio/dio.dart';
import '../datasources/register_data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LoginData remoteDataSource;
  final FlutterSecureStorage secureStorage;
  final AuthData authData;
  final RegisterData registerData;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.secureStorage,
    this.authData,
    this.registerData,
  );

  @override
  Future<UserToken> login({
    required String username,
    required String password,
  }) async {
    final result = await remoteDataSource.login(
      username: username,
      password: password,
    );

    final token = result.accessToken;
    final refreshToken = result.refreshToken;

    // Lưu token an toàn vào SecureStorage
    await secureStorage.write(key: 'token', value: token);
    await secureStorage.write(key: 'refreshToken', value: refreshToken);

    return result;
  }

  @override
  Future<String> logout() async {
    final result = await authData.logout();
    return result;
  }

  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: 'refreshToken');
  }

  @override
  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    return await authData.refreshToken(refreshToken);
  }

  @override
  Future<Response<dynamic>> retryRequest(
    RequestOptions opts,
    String accessToken,
  ) {
    return authData.retryRequest(opts, accessToken);
  }

  Future<void> deleteTokens() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'refreshToken');
  }

  @override
  Future<String> getRole() async {
    return authData.getRole();
  }

  // đăng ký customer
  @override
  Future<void> sendOtp(String email) {
    return registerData.sendOtp(email);
  }

  @override
  Future<String> verifyOtp(String email, String otp) {
    return registerData.verifyOtp(email, otp);
  }

  @override
  Future<int> registerCustomer({
    required String email,
    required String password,
    required String username,
    required String registrationToken,
  }) {
    return registerData.registerCustomer(
      email: email,
      password: password,
      username: username,
      registrationToken: registrationToken,
    );
  }
}
