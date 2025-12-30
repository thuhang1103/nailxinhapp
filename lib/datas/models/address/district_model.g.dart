// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictModelImpl _$$DistrictModelImplFromJson(Map<String, dynamic> json) =>
    _$DistrictModelImpl(
      districtName: json['name'] as String?,
      districtID: (json['code'] as num?)?.toInt(),
      divisionType: json['division_type'] as String?,
      codename: json['codename'] as String?,
      provinceCode: (json['province_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DistrictModelImplToJson(_$DistrictModelImpl instance) =>
    <String, dynamic>{
      'name': instance.districtName,
      'code': instance.districtID,
      'division_type': instance.divisionType,
      'codename': instance.codename,
      'province_code': instance.provinceCode,
    };
