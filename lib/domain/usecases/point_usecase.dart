import '../repositories/cart_item_repository/cart_item_repository.dart';
import '../repositories/point_repository.dart';
import '../entities/point.dart';

class PointUseCase {
  final PointRepository repository;

  PointUseCase(this.repository);

  Future<Point> getLoyaltyPoints() {
    return repository.getLoyaltyPoints();
  }

  Future<String> getMembershipLevel() {
    return repository.getMembershipLevel();
  }

  Future<void> addPointsDaily() {
    return repository.addPointsDaily();
  }

  Future<int> getPointsStatus() {
    return repository.getPointsStatus();
  }

  Future<bool> checkCanSpinToday() {
    return repository.checkCanSpinToday();
  }

  Future<int> spinLucky() {
    return repository.spinLucky();
  }
}
