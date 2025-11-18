import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:nailxinh/datas/models/user_model.dart';
import '../../domain/entities/user.dart';
import 'package:dio/dio.dart';

abstract class UserData {
  Future<List<User>> fetchUsers();
  Future<User> addUser({
    required String userName,
    required String email,
    required String password,
    required String role,
    required String phone,
  });
  Future<bool> isEmailExists({required String email});
  Future<bool> isUsernameExists({required String username});
}

class UserDataImpl implements UserData {
  final Dio dio;

  UserDataImpl(this.dio);

  @override
  Future<bool> isUsernameExists({required String username}) async {
    final response = await dio.post(
      '/users/checkUsername',
      data: {'UserName': username},
      options: Options(headers: {'Content-Type': 'application/json'}),
      // Uri.parse('http://192.168.123.3:5000/api/users/checkUsername'),
      // headers: {'Content-Type': 'application/json'},
      // body: jsonEncode({'username': username}),
    );
    if (response.statusCode == 200) {
      final data = response.data;
      return data['exists'] == true;
    } else {
      throw Exception('Kiểm tra username thất bại (${response.statusCode})');
    }
  }

  @override
  Future<bool> isEmailExists({required String email}) async {
    final response = await dio.post(
      '/users/checkEmail',
      data: {'Email': email},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200) {
      final data = response.data;
      return data['exists'] == true;
    } else {
      throw Exception('Kiểm tra email thất bại (${response.statusCode})');
    }
  }

  @override
  Future<List<User>> fetchUsers() async {
    final response = await dio.get('/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final models = data.map((json) => UserModel.fromJson(json)).toList();
      final entities = models.map((model) => model.toEntity()).toList();
      return entities;
    } else {
      throw Exception("Failed to fetch users");
    }
  }

  @override
  Future<User> addUser({
    required String userName,
    required String email,
    required String password,
    required String role,
    required String phone,
  }) async {
    final response = await dio.post(
      '/users',
      data: {
        'UserName': userName,
        'Email': email,
        'Password': password,
        'Role': role,
        'Phone': phone,
      },
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = response.data;
      final model = UserModel.fromJson(data);
      final user = model.toEntity();
      return user;
    } else {
      throw Exception(
        'Tạo user thất bại (${response.statusCode}): ${response.data}',
      );
    }
  }
}
