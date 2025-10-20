import 'dart:convert';

import 'package:dio/dio.dart';
import '../../models/customer_model.dart';
import '../../../domain/entities/customers.dart' as entity;

abstract class CustomerData {
  Future<entity.Customer?> getCustomerByUserId({required int userId});
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

class CustomerDataImpl implements CustomerData {
  final Dio dio;
  final String basePath;

  CustomerDataImpl(this.dio, {this.basePath = '/customers'});

  Map<String, dynamic>? _toMap(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) return data;
    if (data is List && data.isNotEmpty && data.first is Map<String, dynamic>) {
      return data.first as Map<String, dynamic>;
    }
    if (data is String) {
      final s = data.trim();
      if (!(s.startsWith('{') || s.startsWith('['))) return null;
      try {
        final decoded = json.decode(s);
        if (decoded is Map<String, dynamic>) return decoded;
        if (decoded is List &&
            decoded.isNotEmpty &&
            decoded.first is Map<String, dynamic>) {
          return decoded.first as Map<String, dynamic>;
        }
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<entity.Customer?> getCustomerByUserId({required int userId}) async {
    final res = await dio.get('$basePath/user/$userId');
    final m = _toMap(res.data);
    if (m == null) return null;
    return CustomerModel.fromJson(m).toEntity();
  }

  @override
  Future<int?> getCustomerIdByUserId({required int userId}) async {
    final res = await dio.get('$basePath/user/$userId/id');
    final m = _toMap(res.data);
    if (m == null) return null;
    final v = m['CustomerID'] ?? m['customerId'] ?? m['id'];
    if (v == null) return null;
    return int.tryParse(v.toString());
  }

  @override
  Future<int> addCustomer({
    required String fullName,
    required int userId,
  }) async {
    final res = await dio.post(
      '$basePath/add',
      data: {'fullName': fullName, 'userId': userId},
    );

    final m = _toMap(res.data);
    if (m != null) {
      final id = m['CustomerID'] ?? m['insertId'] ?? m['id'];
      return int.tryParse(id?.toString() ?? '') ?? 0;
    }

    // fallback: if backend returns plain number or other structure
    if (res.data is num) return (res.data as num).toInt();
    throw Exception('Unexpected addCustomer response: ${res.data}');
  }

  @override
  Future<int> updateCustomer({
    required int customerId,
    String? fullName,
    int? loyaltyPoints,
    String? membershipLevel,
  }) async {
    final payload = <String, dynamic>{};
    if (fullName != null) payload['fullName'] = fullName;
    if (loyaltyPoints != null) payload['loyaltyPoints'] = loyaltyPoints;
    if (membershipLevel != null) payload['membershipLevel'] = membershipLevel;

    if (payload.isEmpty) return 0;

    final res = await dio.patch('$basePath/update/$customerId', data: payload);
    final m = _toMap(res.data);
    if (m != null) {
      final affected =
          m['affectedRows'] ??
          m['affected'] ??
          m['changedRows'] ??
          m['rowsAffected'];
      return int.tryParse(affected?.toString() ?? '') ??
          (res.statusCode == 200 ? 1 : 0);
    }

    return res.statusCode == 200 ? 1 : 0;
  }

  @override
  Future<bool> deleteCustomer({required int customerId}) async {
    final res = await dio.delete('$basePath/delete/$customerId');
    final m = _toMap(res.data);
    if (m != null) {
      if (m.containsKey('message')) return true;
      final affected = m['affectedRows'] ?? m['affected'];
      if (affected != null) return (int.tryParse(affected.toString()) ?? 0) > 0;
    }
    return res.statusCode == 200;
  }
}
