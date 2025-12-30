import 'package:dio/dio.dart';

class DioClient {
  static Dio create(Interceptor interceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.8:5000/api",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(interceptor);
    return dio;
  }
}
