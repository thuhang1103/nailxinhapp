import '../repositories/cart_item_repository/cart_item_repository.dart';
import '../repositories/point_repository.dart';
import '../entities/point.dart';
import '../repositories/voucher_repository.dart';
import '../entities/vouchers.dart';

class VoucherUseCase {
  final VoucherRepository repository;

  VoucherUseCase(this.repository);

  Future<List<Voucher>> getAllVoucher() {
    return repository.getAllVoucher();
  }

  Future<Voucher> getMaxVoucher() {
    return repository.getMaxVoucher();
  }

  Future<List<Voucher>> getVoucherAvailable(double total) {
    return repository.getVoucherAvailable(total);
  }

  Future<int> createVoucher(
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  ) {
    return repository.createVoucher(
      code,
      description,
      minOrderValue,
      discountAmount,
      startDate,
      endDate,
    );
  }

  Future<void> updateVoucher(
    int id,
    String code,
    String description,
    double minOrderValue,
    double discountAmount,
    DateTime startDate,
    DateTime endDate,
  ) {
    return repository.updateVoucher(
      id,
      code,
      description,
      minOrderValue,
      discountAmount,
      startDate,
      endDate,
    );
  }

  Future<void> deleteVoucher(int id) {
    return repository.deleteVoucher(id);
  }
}
