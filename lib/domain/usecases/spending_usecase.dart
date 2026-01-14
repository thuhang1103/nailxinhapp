import '../repositories/spending_repository.dart';
import '../entities/spending.dart';

class SpendingUseCase {
  final SpendingRepository repository;

  SpendingUseCase(this.repository);

  /// Trả về tổng chi tiêu của tháng hiện tại (as double)
  Future<double> getCurrentMonthSpending() {
    return repository.getCurrentMonthSpending();
  }

  /// Trả về danh sách chi tiêu theo tháng trong năm hiện tại
  Future<List<MonthlySpending>> getMonthlySpendingCurrentYear() {
    return repository.getMonthlySpendingCurrentYear();
  }

  /// Đếm số đơn hoàn thành trong tháng hiện tại
  Future<int> countCompletedOrdersCurrentMonth() {
    return repository.countCompletedOrdersCurrentMonth();
  }

  /// Tổng tiền đã hoàn thành trong năm hiện tại
  Future<double> sumCurrentYear() {
    return repository.sumCurrentYear();
  }

  /// Đếm số đơn hoàn thành trong năm hiện tại
  Future<int> countCompletedOrdersCurrentYear() {
    return repository.countCompletedOrdersCurrentYear();
  }
}
