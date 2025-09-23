import '../repositories/auth_repository.dart';

class RefreshTokenUseCase {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  Future<Map<String, dynamic>> call(String refreshToken) async {
    return await repository.refreshToken(refreshToken);
  }
}
