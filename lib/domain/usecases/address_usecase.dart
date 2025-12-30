import '../entities/address/address.dart';
import '../entities/address/districts.dart';
import '../entities/address/ward.dart';
import '../entities/address/provinces.dart';
import '../../domain/repositories/address_repository.dart';

class AddressUseCase {
  final AddressRepository repository;

  AddressUseCase(this.repository);

  Future<List<Provinces>> getProvinces() {
    return repository.getProvinces();
  }

  Future<List<Districts>> getDistricts(int provinceCode) {
    return repository.getDistricts(provinceCode);
  }

  Future<List<Ward>> getWards(int districtCode) {
    return repository.getWards(districtCode);
  }

  Future<List<Address>> getAddress() {
    return repository.getAddress();
  }

  Future<Address> getAddressDefault() {
    return repository.getAddressDefault();
  }

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
    return repository.addAddress(
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
    return repository.updateAddress(
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

  Future<void> deleteAddress(int addressId) {
    return repository.deleteAddress(addressId);
  }
}
