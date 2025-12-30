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
}
