import '../entities/spending.dart';

abstract class SpendingRepository {
  /// Trả về tổng chi tiêu của tháng hiện tại (as double)
  Future<double> getCurrentMonthSpending();

  /// Trả về danh sách chi tiêu theo tháng trong năm hiện tại
  Future<List<MonthlySpending>> getMonthlySpendingCurrentYear();

  /// Đếm số đơn hoàn thành trong tháng hiện tại
  Future<int> countCompletedOrdersCurrentMonth();

  /// Tổng tiền đã hoàn thành trong năm hiện tại
  Future<double> sumCurrentYear();

  /// Đếm số đơn hoàn thành trong năm hiện tại
  Future<int> countCompletedOrdersCurrentYear();
}
