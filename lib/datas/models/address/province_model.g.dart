// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceModelImpl _$$ProvinceModelImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceModelImpl(
      provinceName: json['name'] as String?,
      provinceID: (json['code'] as num?)?.toInt(),
      divisionType: json['division_type'] as String?,
      codename: json['codename'] as String?,
      phoneCode: (json['phone_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProvinceModelImplToJson(_$ProvinceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.provinceName,
      'code': instance.provinceID,
      'division_type': instance.divisionType,
      'codename': instance.codename,
      'phone_code': instance.phoneCode,
    };
