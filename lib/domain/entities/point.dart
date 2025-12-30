import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';

@freezed
class Point with _$Point {
  const Point._();

  const factory Point({
    int? customerID,
    int? loyaltyPoints,
    String? membershipLevel,
    DateTime? lastDailyPointAt,
  }) = _Point;
}
