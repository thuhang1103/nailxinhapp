import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final AuthRepository Function() getAuthRepository;

  AuthInterceptor({required this.storage, required this.getAuthRepository});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: "token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('onError called with status: ${err.response?.statusCode}');
    // Không refresh token cho chính request refresh token
    if (err.requestOptions.path.contains('/refreshToken')) {
      return handler.next(err);
    }
    // Nếu lỗi 401 thì thử refresh token
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await storage.read(key: "refreshToken");
        print(
          'Đang refresh token...lấy refreshtoken từ storage : $refreshToken',
        );

        if (refreshToken == null) {
          print('Không có refresh token, không thể refresh.');
          return handler.next(err); // không có refreshToken -> fail
        }
        print('Có refresh token, tiến hành refresh...');

        // Lấy token mới từ backend
        final newTokens = await getAuthRepository().refreshToken(refreshToken);
        print('Lấy đc token mới từ backend: $newTokens');

        // Lưu token mới vào storage
        await storage.write(key: "token", value: newTokens["token"]);
        await storage.write(
          key: "refreshToken",
          value: newTokens["refreshToken"],
        );

        // Gọi lại request cũ bằng retryRequest
        final cloneReq = await getAuthRepository().retryRequest(
          err.requestOptions,
          newTokens["token"],
        );

        return handler.resolve(cloneReq); // Trả về response mới cho Flutter
      } catch (e) {
        print('Lỗi khi refresh token: $e');
        // Refresh token thất bại -> logout
        await storage.deleteAll();
        return handler.next(err);
      }
    }

    // Nếu không phải lỗi 401 thì cho đi tiếp
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
