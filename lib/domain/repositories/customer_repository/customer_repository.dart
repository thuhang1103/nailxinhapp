import '../../entities/customers.dart';
import '../../entities/profile.dart';

abstract class CustomerRepository {
  Future<Customer?> getCustomerByUserId({required int userId});
  Future<int?> getCustomerIdByUserId({required int userId});
  Future<int> addCustomer({required String fullName, required int userId});
  Future<int> updateCustomer({
    required int customerId,
    String? fullName,
    int? loyaltyPoints,
    String? membershipLevel,
  });
  Future<bool> deleteCustomer({required int customerId});
  Future<Profile?> getCustomerProfile();
  Future<Map<String, dynamic>> updateCustomerProfile({
    required String fullName,
    required String phone,
  });
  Future<bool> deleteAccount();
}
