import 'package:dio/dio.dart';
import '../../domain/entities/user_token.dart';
import '../models/usertoken_model.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/auth_interceptor.dart';

abstract class LoginData {
  Future<UserToken> login({required String username, required String password});
}

class LoginDataImpl implements LoginData {
  final Dio dio;

  // Inject Dio vào constructor
  LoginDataImpl(this.dio);

  @override
  Future<UserToken> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/auth/login', // dùng relative path vì baseUrl đã được set trong DioClient
        data: {'UserName': username, 'Password': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      // Dio trả response.data đã parse sẵn JSON
      if (response.statusCode == 200) {
        final model = UserTokenModel.fromJson(response.data);
        return model.toEntity();
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } on DioError catch (e) {
      // Xử lý lỗi Dio
      if (e.response != null) {
        throw Exception('Login failed: ${e.response?.data}');
      } else {
        throw Exception('Login failed: ${e.message}');
      }
    }
  }
}
