import '../repositories/customer_repository/customer_repository.dart';
import '../entities/profile.dart';

class CustomerUseCase {
  final CustomerRepository repository;

  CustomerUseCase(this.repository);

  Future<Profile?> getCustomerProfile() {
    return repository.getCustomerProfile();
  }

  Future<Map<String, dynamic>> updateCustomerProfile({
    required String fullName,
    required String phone,
  }) {
    return repository.updateCustomerProfile(fullName: fullName, phone: phone);
  }

  Future<bool> deleteAccount() {
    return repository.deleteAccount();
  }
}
