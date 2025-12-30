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
}
