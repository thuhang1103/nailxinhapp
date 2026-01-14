import '../datasources/point_data.dart';
import '../../domain/entities/vouchers.dart';
import '../datasources/voucher_data.dart';
import '../../domain/repositories/voucher_repository.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  final VoucherData data;

  VoucherRepositoryImpl(this.data);
  @override
  Future<List<Voucher>> getAllVoucher() {
    return data.getAllVoucher();
  }

  @override
  Future<Voucher> getMaxVoucher() {
    return data.getMaxVoucher();
  }

  @override
  Future<List<Voucher>> getVoucherAvailable(double total) {
    return data.getVoucherAvailable(total);
  }

  @override
  Future<int> createVoucher(
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  ) {
    return data.createVoucher(
      code,
      description,
      minOrderValue,
      discountAmount,
      startDate,
      endDate,
    );
  }

  @override
  Future<void> updateVoucher(
    int id,
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  ) {
    return data.updateVoucher(
      id,
      code,
      description,
      minOrderValue,
      discountAmount,
      startDate,
      endDate,
    );
  }

  @override
  Future<void> deleteVoucher(int id) {
    return data.deleteVoucher(id);
  }
}
