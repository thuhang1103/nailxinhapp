import '../entities/point.dart';

abstract class PointRepository {
  Future<Point> getLoyaltyPoints();
  Future<String> getMembershipLevel();
  Future<void> addPointsDaily();
  Future<int> getPointsStatus();
  Future<bool> checkCanSpinToday();
  Future<int> spinLucky();
}
