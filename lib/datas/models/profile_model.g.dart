// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      userName: json['UserName'] as String?,
      fullName: json['FullName'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      membershipLevel: json['MembershipLevel'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'UserName': instance.userName,
      'FullName': instance.fullName,
      'Phone': instance.phone,
      'Email': instance.email,
      'MembershipLevel': instance.membershipLevel,
    };
