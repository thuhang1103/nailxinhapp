import '../datasources/point_data.dart';
import '../../domain/repositories/point_repository.dart';
import '../../domain/entities/point.dart';

class PointRepositoryImpl implements PointRepository {
  final PointData data;

  PointRepositoryImpl(this.data);

  @override
  Future<Point> getLoyaltyPoints() {
    return data.getLoyaltyPoints();
  }

  @override
  Future<String> getMembershipLevel() {
    return data.getMembershipLevel();
  }

  @override
  Future<void> addPointsDaily() {
    return data.addPointsDaily();
  }

  @override
  Future<int> getPointsStatus() {
    return data.getPointsStatus();
  }

  @override
  Future<bool> checkCanSpinToday() {
    return data.checkCanSpinToday();
  }

  @override
  Future<int> spinLucky() {
    return data.spinLucky();
  }
}
