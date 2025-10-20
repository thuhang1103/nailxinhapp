import '../../entities/customers.dart';

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
}
