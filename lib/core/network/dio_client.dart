import 'package:dio/dio.dart';

class DioClient {
  static Dio create(Interceptor interceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://172.20.10.2:5000/api",
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(interceptor);
    return dio;
  }
}
