import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/address/address.dart' as entity;

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
    @JsonKey(name: 'AddressID') int? id,
    @JsonKey(name: 'RecipientName') String? name,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'ProvinceCode') int? provinceCode,
    @JsonKey(name: 'DistrictCode') int? districtCode,
    @JsonKey(name: 'WardCode') int? wardCode,
    @JsonKey(name: 'StreetAddress') String? streetAddress,
    @JsonKey(name: 'FullAddress') String? fullAddress,
    @JsonKey(name: 'Province') String? provinceName,
    @JsonKey(name: 'District') String? districtName,
    @JsonKey(name: 'Ward') String? wardName,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  entity.Address toEntity() {
    return entity.Address(
      id: id,
      phone: phone,
      provinceCode: provinceCode,
      districtCode: districtCode,
      wardCode: wardCode,
      streetAddress: streetAddress,
      fullAddress: fullAddress,
      provinceName: provinceName,
      districtName: districtName,
      wardName: wardName,
    );
  }
}
