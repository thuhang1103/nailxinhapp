import 'package:nailxinh/domain/entities/user.dart';
import 'package:nailxinh/domain/repositories/user_repository.dart';
import 'package:nailxinh/datas/models/user_model.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<User>> call() async {
    return await repository.getUsers();
  }
}