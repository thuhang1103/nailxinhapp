import 'package:dio/dio.dart';
import '../../core/appException.dart';

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
  Future<int> addCustomer({required int userId, required String fullName});
  Future<int> createCart({required int customerId});
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
    print('register customer data thành công: ${res.data}');
    return res.data['userId'];
  }

  @override
  Future<int> addCustomer({
    required int userId,
    required String fullName,
  }) async {
    try {
      final res = await dio.post(
        '/customers/add',
        data: {'userid': userId, 'fullName': fullName},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;

        if (data is! Map<String, dynamic>) {
          throw const ParseException();
        }
        final idVal = data['CustomerID'];

        if (idVal == null) {
          throw const ParseException();
        }

        return int.tryParse(idVal.toString()) ?? (throw const ParseException());
      }

      throw BusinessException(res.data?['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw const NetworkException();
      }
      final serverMsg = e.response?.data?['message'];
      if (serverMsg != null) {
        throw BusinessException(serverMsg);
      }
      throw const ServerException();
    } catch (e) {
      throw const UnknownException();
    }
  }

  @override
  Future<int> createCart({required int customerId}) async {
    try {
      final res = await dio.post(
        '/carts/create',
        data: {'CustomerID': customerId},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;
        if (data is! Map<String, dynamic>) {
          throw const ParseException();
        }
        final idVal = data['CartID'];
        if (idVal == null) {
          throw const ParseException();
        }
        final idParsed = int.tryParse(idVal.toString());
        if (idParsed == null) {
          throw const ParseException();
        }
        return idParsed;
      }

      throw BusinessException(res.data?['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw const NetworkException();
      }
      final msg = e.response?.data?['message'];
      if (msg != null) {
        throw BusinessException(msg);
      }
      throw const ServerException();
    } catch (e) {
      throw const UnknownException();
    }
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
