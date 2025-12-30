import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/address/ward.dart' as entity;
part 'ward_model.freezed.dart';
part 'ward_model.g.dart';

@freezed
class WardModel with _$WardModel {
  const WardModel._();

  const factory WardModel({
    @JsonKey(name: 'name') String? wardName,
    @JsonKey(name: 'code') int? wardID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'district_code') int? districtCode,
  }) = _WardModel;

  factory WardModel.fromJson(Map<String, dynamic> json) =>
      _$WardModelFromJson(json);

  entity.Ward toEntity() {
    return entity.Ward(
      name: wardName,
      code: wardID,
      divisionType: divisionType,
      codename: codename,
      districtCode: districtCode,
    );
  }
}
