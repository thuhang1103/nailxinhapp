import '../datasources/spending_data.dart';
import '../../domain/repositories/spending_repository.dart';
import '../../domain/entities/spending.dart';

class SpendingRepositoryImpl implements SpendingRepository {
  final SpendingData data;

  SpendingRepositoryImpl(this.data);

  @override
  Future<double> getCurrentMonthSpending() {
    return data.getCurrentMonthSpending();
  }

  @override
  Future<List<MonthlySpending>> getMonthlySpendingCurrentYear() {
    return data.getMonthlySpendingCurrentYear();
  }

  @override
  Future<int> countCompletedOrdersCurrentMonth() {
    return data.countCompletedOrdersCurrentMonth();
  }

  @override
  Future<double> sumCurrentYear() {
    return data.sumCurrentYear();
  }

  @override
  Future<int> countCompletedOrdersCurrentYear() {
    return data.countCompletedOrdersCurrentYear();
  }
}
