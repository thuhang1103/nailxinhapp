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
  Future<String> resetpass({
    required String email,
    required String password,
    required String resetpassToken,
  });
}

class RegisterDataImpl implements RegisterData {
  final Dio dio;
  RegisterDataImpl(this.dio);

  @override
  Future<void> sendOtp(String email) async {
    print('vào được send otp data');
    print('email: $email');
    final res = await dio.post(
      '/auth/sendOtp',
      data: {'email': email},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    print('send otp data thành công data: ${res.data}');
    if (res.statusCode != 200) throw Exception(res.data['message']);
  }

  @override
  Future<String> verifyOtp(String email, String otp) async {
    print('vào được verify otp data');
    print('email và otp: $email, $otp');
    final res = await dio.post(
      '/auth/verifyOtp',
      data: {'email': email, 'otp': otp},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode != 200) throw Exception(res.data['message']);
    print('verify otp data thành công: ${res.data['registrationToken']}');
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
    print('register customer data thành công: ${res.data}');
    return res.data['userId'];
  }

  @override
  Future<String> resetpass({
    required String email,
    required String password,
    required String resetpassToken,
  }) async {
    final res = await dio.post(
      '/auth/resetPassword',
      data: {
        'email': email,
        'password': password,
        'resetpassToken': resetpassToken,
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (res.statusCode != 201) throw Exception(res.data['message']);
    print('đổi mật khẩu thành công: ${res.data}');
    return res.data['userName'];
  }
}
