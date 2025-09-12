import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nailxinh/datas/models/user_model.dart';
import '../../domain/entities/user.dart';


abstract class UserData {
  Future<List<User>> fetchUsers();
}

class UserDataImpl implements UserData {
  final http.Client client;

  UserDataImpl(this.client);

  @override
  Future<List<User>> fetchUsers() async {
   final response = await client.get(Uri.parse('http://192.168.1.211:5000/api/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final models = data.map((json) => UserModel.fromJson(json)).toList();
      final entities = models.map((model) => model.toEntity()).toList();
      return entities;
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}