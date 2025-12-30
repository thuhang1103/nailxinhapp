abstract class EditAddressEvent {}

class GetAddressEvent extends EditAddressEvent {}

class UpdateAddressEvent extends EditAddressEvent {
  final int addressId;
  UpdateAddressEvent({required this.addressId});
}

class AddAddressEvent extends EditAddressEvent {}

class DeleteAddressEvent extends EditAddressEvent {
  final int addressId;
  DeleteAddressEvent({required this.addressId});
}

class GetProvinceEvent extends EditAddressEvent {}

class GetDistrictEvent extends EditAddressEvent {
  final int provinceCode;
  GetDistrictEvent(this.provinceCode);
}

class GetWardEvent extends EditAddressEvent {
  final int districtCode;
  GetWardEvent(this.districtCode);
}

class SelectProvinceEvent extends EditAddressEvent {
  final int provinceCode;
  final String provinceName;
  SelectProvinceEvent(this.provinceCode, this.provinceName);
}

class SelectDistrictEvent extends EditAddressEvent {
  final int districtCode;
  final String districtName;
  SelectDistrictEvent(this.districtCode, this.districtName);
}

class SelectWardEvent extends EditAddressEvent {
  final int wardCode;
  final String wardName;
  SelectWardEvent(this.wardCode, this.wardName);
}

//street
class StreetChanged extends EditAddressEvent {
  final String street;
  StreetChanged(this.street);
}

class RecipientNameChanged extends EditAddressEvent {
  final String recipientName;
  RecipientNameChanged(this.recipientName);
}

//phone

class PhoneChanged extends EditAddressEvent {
  final String recipientPhone;
  PhoneChanged(this.recipientPhone);
}
