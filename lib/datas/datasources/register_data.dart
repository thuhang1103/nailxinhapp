import 'package:dio/dio.dart';

abstract class RegisterData {
  Future<void> sendOtp(String email);
  Future<String> verifyOtp(String email, String otp);
  Future<int> registerCustomer({
    required String email,
    required String username,
    required String password,
    required String registrationToken,
  });
}

class RegisterDataImpl implements RegisterData {
  final Dio dio;
  RegisterDataImpl(this.dio);

  @override
  Future<void> sendOtp(String email) async {
    final res = await dio.post(
      '/auth/sendOtp',
      data: {'email': email},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode != 200) throw Exception(res.data['message']);
  }

  @override
  Future<String> verifyOtp(String email, String otp) async {
    final res = await dio.post(
      '/auth/verifyOtp',
      data: {'email': email, 'otp': otp},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode != 200) throw Exception(res.data['message']);
    return res.data['registrationToken'];
  }

  @override
  Future<int> registerCustomer({
    required String email,
    required String username,
    required String password,
    required String registrationToken,
  }) async {
    final res = await dio.post(
      '/auth/registerCustomer',
      data: {
        'email': email,
        'password': password,
        'username': username,
        'registrationToken': registrationToken,
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode != 201) throw Exception(res.data['message']);
    return res.data['userID'];
  }
}
