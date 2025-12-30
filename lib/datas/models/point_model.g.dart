// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointModelImpl _$$PointModelImplFromJson(Map<String, dynamic> json) =>
    _$PointModelImpl(
      customerID: (json['CustomerID'] as num?)?.toInt(),
      loyaltyPoints: (json['LoyaltyPoints'] as num?)?.toInt(),
      membershipLevel: json['MembershipLevel'] as String?,
      lastDailyPointAt: json['LastDailyPointAt'] == null
          ? null
          : DateTime.parse(json['LastDailyPointAt'] as String),
    );

Map<String, dynamic> _$$PointModelImplToJson(_$PointModelImpl instance) =>
    <String, dynamic>{
      'CustomerID': instance.customerID,
      'LoyaltyPoints': instance.loyaltyPoints,
      'MembershipLevel': instance.membershipLevel,
      'LastDailyPointAt': instance.lastDailyPointAt?.toIso8601String(),
    };
