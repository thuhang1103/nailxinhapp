import '../repositories/auth_repository.dart';

class GetRoleUseCase {
  final AuthRepository repository;

  GetRoleUseCase(this.repository);

  Future<String> call() async {
    return await repository.getRole();
  }
}
