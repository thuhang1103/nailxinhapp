import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<void> sendOtp(String email) {
    return repository.sendOtp(email);
  }

  Future<String> verifyOtp(String email, String otp) {
    return repository.verifyOtp(email, otp);
  }

  Future<int> registerCustomer({
    required String email,
    required String password,
    required String username,
    required String registrationToken,
  }) {
    return repository.registerCustomer(
      email: email,
      password: password,
      username: username,
      registrationToken: registrationToken,
    );
  }

  Future<String> resetpass({
    required String email,
    required String password,
    required String resetpassToken,
  }) {
    return repository.resetpass(
      email: email,
      password: password,
      resetpassToken: resetpassToken,
    );
  }
}
