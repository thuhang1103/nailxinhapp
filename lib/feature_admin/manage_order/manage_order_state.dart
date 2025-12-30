//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import './../../domain/entities/order/order.dart';
import './../../domain/entities/order/order_detail.dart';

part 'manage_order_state.freezed.dart';

@freezed
class ManageOrderState with _$ManageOrderState {
  const factory ManageOrderState({
    @Default([]) List<Order> orders,
    @Default([]) List<OrderDetail> orderDetails,
    int? orderId,

    @Default(CommonState.initial()) CommonState getOrderState,
    @Default(CommonState.initial()) CommonState getOrderDetailState,
    @Default(CommonState.initial()) CommonState updateOrderState,
  }) = _ManageOrderState;
}

ManageOrderState initial() => ManageOrderState();
