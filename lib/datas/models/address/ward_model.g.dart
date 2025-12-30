// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WardModelImpl _$$WardModelImplFromJson(Map<String, dynamic> json) =>
    _$WardModelImpl(
      wardName: json['name'] as String?,
      wardID: (json['code'] as num?)?.toInt(),
      divisionType: json['division_type'] as String?,
      codename: json['codename'] as String?,
      districtCode: (json['district_code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WardModelImplToJson(_$WardModelImpl instance) =>
    <String, dynamic>{
      'name': instance.wardName,
      'code': instance.wardID,
      'division_type': instance.divisionType,
      'codename': instance.codename,
      'district_code': instance.districtCode,
    };
