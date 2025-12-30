import 'package:dio/dio.dart';
import 'dart:convert';
import '../entities/vouchers.dart';

abstract class VoucherRepository {
  Future<List<Voucher>> getAllVoucher();
  Future<Voucher> getMaxVoucher();
  Future<List<Voucher>> getVoucherAvailable(double total);
}
