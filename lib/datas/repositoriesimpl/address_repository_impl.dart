import '../../domain/repositories/address_repository.dart';
import '../../datas/datasources/address_data.dart';

//entity
import '../../domain/entities/address/address.dart';
import '../../domain/entities/address/districts.dart';
import '../../domain/entities/address/ward.dart';
import '../../domain/entities/address/provinces.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressData data;

  AddressRepositoryImpl(this.data);

  @override
  Future<List<Provinces>> getProvinces() {
    return data.getProvinces();
  }

  @override
  Future<List<Districts>> getDistricts(int provinceCode) {
    return data.getDistricts(provinceCode);
  }

  @override
  Future<List<Ward>> getWards(int districtCode) {
    return data.getWards(districtCode);
  }

  @override
  Future<List<Address>> getAddress() {
    return data.getAddress();
  }

  @override
  Future<Address> getAddressDefault() {
    return data.getAddressDefault();
  }

  @override
  Future<void> addAddress(
    int provinceCode,
    int districtCode,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
  ) {
    return data.addAddress(
      provinceCode,
      districtCode,
      wardCode,
      recipientName,
      phone,
      province,
      district,
      ward,
      streetAddress,
    );
  }

  @override
  Future<void> updateAddress(
    int addressId,
    int provinceCode,
    int districtCode,
    int wardCode,
    String recipientName,
    String phone,
    String province,
    String district,
    String ward,
    String streetAddress,
  ) {
    return data.updateAddress(
      addressId,
      provinceCode,
      districtCode,
      wardCode,
      recipientName,
      phone,
      province,
      district,
      ward,
      streetAddress,
    );
  }

  @override
  Future<void> deleteAddress(int addressId) {
    return data.deleteAddress(addressId);
  }
}
