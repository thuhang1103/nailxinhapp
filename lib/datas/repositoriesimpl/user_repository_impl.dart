import 'package:nailxinh/datas/datasources/user_data.dart';
import 'package:nailxinh/domain/repositories/user_repository.dart';



// data/repositories/user_repository_impl.dart
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  final UserData DataSource;
  UserRepositoryImpl(this.DataSource);
  @override
  Future<List<User>> getUsers() async {
    return await DataSource.fetchUsers();
  }
}