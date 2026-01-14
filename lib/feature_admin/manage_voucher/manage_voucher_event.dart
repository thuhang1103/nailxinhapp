import '../../domain/entities/vouchers.dart';

abstract class ManageVoucherEvent {}

//fetch_voucher
class GetVoucherEvent extends ManageVoucherEvent {}

class CreateVoucherEvent extends ManageVoucherEvent {}

class UpdateVoucherEvent extends ManageVoucherEvent {
  Voucher voucher;
  UpdateVoucherEvent(this.voucher);
}

class DeleteVoucherEvent extends ManageVoucherEvent {
  Voucher voucher;
  DeleteVoucherEvent(this.voucher);
}

class GetInfoVoucherEvent extends ManageVoucherEvent {
  Voucher voucher;
  GetInfoVoucherEvent(this.voucher);
}

class ChangeCodeEvent extends ManageVoucherEvent {
  final String code;
  ChangeCodeEvent(this.code);
}

class ChangeDescriptionEvent extends ManageVoucherEvent {
  final String description;
  ChangeDescriptionEvent(this.description);
}

class ChangeMinOrderValueEvent extends ManageVoucherEvent {
  final double minOrderValue;
  ChangeMinOrderValueEvent(this.minOrderValue);
}

class ChangeDiscountAmountEvent extends ManageVoucherEvent {
  final double discountAmount;
  ChangeDiscountAmountEvent(this.discountAmount);
}

class ChangeStartDateEvent extends ManageVoucherEvent {
  final DateTime startDate;
  ChangeStartDateEvent(this.startDate);
}

class ChangeEndDateEvent extends ManageVoucherEvent {
  final DateTime endDate;
  ChangeEndDateEvent(this.endDate);
}
