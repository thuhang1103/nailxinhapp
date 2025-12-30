import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/address/provinces.dart' as entity;

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
class ProvinceModel with _$ProvinceModel {
  const ProvinceModel._();

  const factory ProvinceModel({
    @JsonKey(name: 'name') String? provinceName,
    @JsonKey(name: 'code') int? provinceID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'phone_code') int? phoneCode,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  entity.Provinces toEntity() {
    return entity.Provinces(
      name: provinceName,
      code: provinceID,
      divisionType: divisionType,
      codename: codename,
      phoneCode: phoneCode,
    );
  }
}
