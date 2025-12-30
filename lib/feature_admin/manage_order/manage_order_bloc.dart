import 'package:flutter_bloc/flutter_bloc.dart';

//common state
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'package:dio/dio.dart';

import '../../feature_admin/manage_order/manage_order_bloc.dart';
import '../../feature_admin/manage_order/manage_order_event.dart';
import '../../feature_admin/manage_order/manage_order_state.dart';
import '../../../domain/usecases/order_usecase.dart';

class ManageOrderBloc extends Bloc<ManageOrderEvent, ManageOrderState> {
  final OrderUseCase orderUseCase;

  ManageOrderBloc({required this.orderUseCase}) : super(initial()) {
    // register handlers
    on<GetOrderDetailEvent>(_onGetOrderDetail);
    on<UpdateOrderEvent>(_onUpdateOrder);
    on<GetOrderEvent>(_onGetOrder);
    on<SelectOrderIdEvent>((event, emit) {
      emit(state.copyWith(orderId: event.orderId));
    });
    on<ResetStateEvent>((event, emit) {
      emit(initial());
    });
  }

  Future<void> _onGetOrder(
    GetOrderEvent event,
    Emitter<ManageOrderState> emit,
  ) async {
    print('vào bloc : ${event.status}');
    emit(state.copyWith(getOrderState: const CommonState.loading()));

    try {
      final orders = await orderUseCase.getOrdersByStatus(status: event.status);
      print('dữ liệu trả về bloc : $orders');
      emit(
        state.copyWith(
          orders: orders,
          getOrderState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getOrderState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onGetOrderDetail(
    GetOrderDetailEvent event,
    Emitter<ManageOrderState> emit,
  ) async {
    emit(state.copyWith(getOrderDetailState: const CommonState.loading()));

    try {
      final orderDetails = await orderUseCase.getOrderDetails(event.orderId);
      print('dữ liệu trả về bloc : $orderDetails');
      emit(
        state.copyWith(
          orderDetails: orderDetails,
          getOrderDetailState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getOrderDetailState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onUpdateOrder(
    UpdateOrderEvent event,
    Emitter<ManageOrderState> emit,
  ) async {
    emit(state.copyWith(updateOrderState: const CommonState.loading()));

    try {
      await orderUseCase.updateOrderStatus(
        orderId: event.orderId,
        status: event.status,
      );
      emit(state.copyWith(updateOrderState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          updateOrderState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }
}
