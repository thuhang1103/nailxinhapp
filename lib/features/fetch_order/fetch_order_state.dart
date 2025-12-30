//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/common_state.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/order/order.dart';
import '../../domain/entities/order/order_detail.dart';
import '../../domain/entities/address/address.dart';
import '../../domain/entities/vouchers.dart';
import '../../domain/entities/point.dart';

part 'fetch_order_state.freezed.dart';

@freezed
class FetchOrderState with _$FetchOrderState {
  const factory FetchOrderState({
    final List<CartItem>? cartitems,
    @Default([]) List<Address> addresses,
    @Default([]) List<Voucher> vouches,
    final Address? addressDefault,
    final Point? point,
    final Voucher? voucher,

    @Default(0) int usePoint,
    @Default(0) double total,
    @Default(0) double finalAmount,
    @Default(0) int totalItems,
    @Default(0) int wardCode,
    @Default('') String recipientName,
    @Default('') String phone,
    @Default('') String province,
    @Default('') String district,
    @Default('') String ward,
    @Default('') String streetAddress,

    @Default(CommonState.initial()) CommonState loadDataState,
    @Default(CommonState.initial()) CommonState confirmOrderState,
  }) = _FetchOrderState;
}
