import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/address/districts.dart' as entity;

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
class DistrictModel with _$DistrictModel {
  const DistrictModel._();

  const factory DistrictModel({
    @JsonKey(name: 'name') String? districtName,
    @JsonKey(name: 'code') int? districtID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'province_code') int? provinceCode,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  entity.Districts toEntity() {
    return entity.Districts(
      name: districtName,
      code: districtID,
      divisionType: divisionType,
      codename: codename,
      provinceCode: provinceCode,
    );
  }
}
