import 'package:flutter_bloc/flutter_bloc.dart';

//common state
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'package:dio/dio.dart';
import '../../features/get_order_Customer/get_order_bloc.dart';
import '../../features/get_order_Customer/get_order_event.dart';
import '../../features/get_order_Customer/get_order_state.dart';
import '../../../domain/usecases/order_usecase.dart';

class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  final OrderUseCase orderUseCase;

  GetOrderBloc({required this.orderUseCase}) : super(initial()) {
    on<GetOrder>(_onGetOrder);
  }

  Future<void> _onGetOrder(GetOrder event, Emitter<GetOrderState> emit) async {
    emit(state.copyWith(getOrderState: const CommonState.loading()));
    try {
      final orders = await orderUseCase.getMyOrders(status: event.status);

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
}
