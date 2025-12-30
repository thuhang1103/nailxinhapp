import '../entities/address/address.dart';
import '../entities/address/districts.dart';
import '../entities/address/ward.dart';
import '../entities/address/provinces.dart';

abstract class AddressRepository {
  Future<List<Provinces>> getProvinces();
  Future<List<Districts>> getDistricts(int provinceCode);
  Future<List<Ward>> getWards(int districtCode);
  Future<List<Address>> getAddress();
  Future<Address> getAddressDefault();
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
  );
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
  );
  Future<void> deleteAddress(int addressId);
}
