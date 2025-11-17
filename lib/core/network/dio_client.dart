import 'package:dio/dio.dart';

class DioClient {
  static Dio create(Interceptor interceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.123.3:5000/api",
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
      ),
    );

    dio.interceptors.add(interceptor);
    return dio;
  }
}
