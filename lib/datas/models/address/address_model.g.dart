// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: (json['AddressID'] as num?)?.toInt(),
      name: json['RecipientName'] as String?,
      phone: json['Phone'] as String?,
      provinceCode: (json['ProvinceCode'] as num?)?.toInt(),
      districtCode: (json['DistrictCode'] as num?)?.toInt(),
      wardCode: (json['WardCode'] as num?)?.toInt(),
      streetAddress: json['StreetAddress'] as String?,
      fullAddress: json['FullAddress'] as String?,
      provinceName: json['Province'] as String?,
      districtName: json['District'] as String?,
      wardName: json['Ward'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'AddressID': instance.id,
      'RecipientName': instance.name,
      'Phone': instance.phone,
      'ProvinceCode': instance.provinceCode,
      'DistrictCode': instance.districtCode,
      'WardCode': instance.wardCode,
      'StreetAddress': instance.streetAddress,
      'FullAddress': instance.fullAddress,
      'Province': instance.provinceName,
      'District': instance.districtName,
      'Ward': instance.wardName,
    };
