import 'package:nailxinh/datas/datasources/user_data.dart';
import 'package:nailxinh/domain/repositories/user_repository.dart';
// data/repositories/user_repository_impl.dart
import '../../domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserData DataSource;
  UserRepositoryImpl(this.DataSource);
  @override
  Future<List<User>> getUsers() async {
    return await DataSource.fetchUsers();
  }

  @override
  Future<User> createUser({
    required String username,
    required String email,
    required String password,
    required String role,
    required String phone,
  }) async {
    final user = await DataSource.addUser(
      userName: username,
      email: email,
      password: password,
      role: role,
      phone: phone,
    );
    return user;
  }

  @override
  Future<bool> isEmailExists({required String email}) async {
    return await DataSource.isEmailExists(email: email);
  }

  @override
  Future<bool> isUsernameExists({required String username}) async {
    return await DataSource.isUsernameExists(username: username);
  }
}
