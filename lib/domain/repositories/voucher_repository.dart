import 'package:dio/dio.dart';
import 'dart:convert';
import '../entities/vouchers.dart';

abstract class VoucherRepository {
  Future<List<Voucher>> getAllVoucher();
  Future<Voucher> getMaxVoucher();
  Future<List<Voucher>> getVoucherAvailable(double total);
  Future<int> createVoucher(
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  );
  Future<void> updateVoucher(
    int id,
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  );
  Future<void> deleteVoucher(int id);
}
