//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import './../../domain/entities/order/order.dart';
import './../../domain/entities/order/order_detail.dart';

part 'get_order_state.freezed.dart';

@freezed
class GetOrderState with _$GetOrderState {
  const factory GetOrderState({
    @Default([]) List<Order> orders,

    @Default(CommonState.initial()) CommonState getOrderState,
  }) = _GetOrderState;
}

GetOrderState initial() => GetOrderState();
