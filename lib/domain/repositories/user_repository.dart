import 'package:nailxinh/domain/entities/user.dart';
import 'package:nailxinh/datas/models/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}