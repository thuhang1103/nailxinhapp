// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerModelImpl _$$CustomerModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomerModelImpl(
      customerId: (json['CustomerID'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
      loyaltyPoints: (json['LoyaltyPoints'] as num?)?.toInt(),
      membershipLevel: json['MembershipLevel'] as String?,
      createdAt: json['CreatedAt'] as String?,
      email: json['Email'] as String?,
      phone: json['Phone'] as String?,
      avatarImage: json['avatarImage'] as String?,
      role: json['Role'] as String?,
    );

Map<String, dynamic> _$$CustomerModelImplToJson(_$CustomerModelImpl instance) =>
    <String, dynamic>{
      'CustomerID': instance.customerId,
      'FullName': instance.fullName,
      'LoyaltyPoints': instance.loyaltyPoints,
      'MembershipLevel': instance.membershipLevel,
      'CreatedAt': instance.createdAt,
      'Email': instance.email,
      'Phone': instance.phone,
      'avatarImage': instance.avatarImage,
      'Role': instance.role,
    };
