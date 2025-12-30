import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/point.dart' as entity;

part 'point_model.freezed.dart';
part 'point_model.g.dart';

@freezed
class PointModel with _$PointModel {
  const PointModel._();

  const factory PointModel({
    @JsonKey(name: 'CustomerID') int? customerID,
    @JsonKey(name: 'LoyaltyPoints') int? loyaltyPoints,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
    @JsonKey(name: 'LastDailyPointAt') DateTime? lastDailyPointAt,
  }) = _PointModel;

  factory PointModel.fromJson(Map<String, dynamic> json) =>
      _$PointModelFromJson(json);

  entity.Point toEntity() {
    return entity.Point(
      customerID: customerID,
      loyaltyPoints: loyaltyPoints,
      membershipLevel: membershipLevel,
      lastDailyPointAt: lastDailyPointAt,
    );
  }
}
