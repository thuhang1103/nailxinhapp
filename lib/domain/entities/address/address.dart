import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const Address._();

  const factory Address({
    int? id,
    String? name,
    String? phone,
    int? provinceCode,
    int? districtCode,
    int? wardCode,
    String? streetAddress,
    String? fullAddress,
    String? provinceName,
    String? districtName,
    String? wardName,
  }) = _Address;
}
