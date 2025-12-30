import '../../domain/entities/address/address.dart';
import '../../domain/entities/vouchers.dart';

abstract class FetchOrderEvent {}

class GetDataEvent extends FetchOrderEvent {}

class LoadAddressEvent extends FetchOrderEvent {}

class LoadVoucherEvent extends FetchOrderEvent {}

class SelectAddressEvent extends FetchOrderEvent {
  final Address address;
  SelectAddressEvent(this.address);
}

class SelectVoucherEvent extends FetchOrderEvent {
  final Voucher voucher;
  SelectVoucherEvent(this.voucher);
}

class SelectPointEvent extends FetchOrderEvent {}

class ConfirmOrderEvent extends FetchOrderEvent {}
