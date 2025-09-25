import '../repositories/user_repository.dart';

class CheckUserExistsUseCase {
  final UserRepository repository;
  CheckUserExistsUseCase(this.repository);

  Future<bool> email(String email) {
    return repository.isEmailExists(email: email);
  }

  Future<bool> username(String username) {
    return repository.isUsernameExists(username: username);
  }
}
