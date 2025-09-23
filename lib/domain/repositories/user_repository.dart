import 'package:nailxinh/domain/entities/user.dart';
import 'package:nailxinh/datas/models/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> createUser({
    required String username,
    required String email,
    required String password,
    required String role,
    required String phone,
  });
}
