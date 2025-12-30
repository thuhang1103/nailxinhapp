import '../../../domain/entities/customers.dart';
import '../../../domain/repositories/customer_repository/customer_repository.dart';
import '../datasources/customer_data/customer_data.dart';
import '../../domain/entities/profile.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerData data;

  CustomerRepositoryImpl(this.data);

  @override
  Future<Customer?> getCustomerByUserId({required int userId}) async {
    return await data.getCustomerByUserId(userId: userId);
  }

  @override
  Future<int?> getCustomerIdByUserId({required int userId}) async {
    return await data.getCustomerIdByUserId(userId: userId);
  }

  @override
  Future<int> addCustomer({
    required String fullName,
    required int userId,
  }) async {
    final id = await data.addCustomer(fullName: fullName, userId: userId);
    if (id <= 0) throw Exception('Failed to add customer');
    return id;
  }

  @override
  Future<int> updateCustomer({
    required int customerId,
    String? fullName,
    int? loyaltyPoints,
    String? membershipLevel,
  }) async {
    final affected = await data.updateCustomer(
      customerId: customerId,
      fullName: fullName,
      loyaltyPoints: loyaltyPoints,
      membershipLevel: membershipLevel,
    );
    return affected;
  }

  @override
  Future<bool> deleteCustomer({required int customerId}) async {
    return await data.deleteCustomer(customerId: customerId);
  }

  @override
  Future<Profile?> getCustomerProfile() async {
    return await data.getCustomerProfile();
  }

  @override
  Future<Map<String, dynamic>> updateCustomerProfile({
    required String fullName,
    required String phone,
  }) async {
    return await data.updateCustomerProfile(fullName: fullName, phone: phone);
  }

  @override
  Future<bool> deleteAccount() async {
    return await data.deleteAccount();
  }
}
