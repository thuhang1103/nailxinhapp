import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../repositories/auth_repository.dart';
import '../../domain/entities/user_token.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<UserToken> execute(String userName, String password) async {
    final tokenData = await repository.login(
      username: userName,
      password: password,
    );
    return tokenData;
  }
}
