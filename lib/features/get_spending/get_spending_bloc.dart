import 'package:flutter_bloc/flutter_bloc.dart';

//common state
import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'package:dio/dio.dart';
import '../../../domain/usecases/spending_usecase.dart';
import '../../../domain/entities/spending.dart';
import './get_spending_event.dart';
import './get_spending_state.dart';

class GetSpendingBloc extends Bloc<GetSpendingEvent, GetSpendingState> {
  final SpendingUseCase spendingUseCase;

  GetSpendingBloc({required this.spendingUseCase}) : super(initial()) {
    on<GetSpendingInfo>(_onGetSpendingInfo);
    on<GetSpendingDetails>(_onGetSpendingDetails);
  }

  Future<void> _onGetSpendingInfo(
    GetSpendingInfo event,
    Emitter<GetSpendingState> emit,
  ) async {
    emit(state.copyWith(getSpendingState: const CommonState.loading()));
    try {
      final totalMonth = await spendingUseCase.getCurrentMonthSpending();
      final totalYear = await spendingUseCase.sumCurrentYear();
      final countMonth = await spendingUseCase
          .countCompletedOrdersCurrentMonth();
      final countYear = await spendingUseCase.countCompletedOrdersCurrentYear();
      print(
        'Tháng: $totalMonth, Năm: $totalYear, Đơn tháng: $countMonth, Đơn năm: $countYear',
      );

      emit(
        state.copyWith(
          totalMonth: totalMonth,
          totalYear: totalYear,
          countMonth: countMonth,
          countYear: countYear,
          getSpendingState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getSpendingState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onGetSpendingDetails(
    GetSpendingDetails event,
    Emitter<GetSpendingState> emit,
  ) async {
    emit(state.copyWith(getSpendingState: const CommonState.loading()));
    try {
      final monthly = await spendingUseCase.getMonthlySpendingCurrentYear();

      emit(
        state.copyWith(
          monthly: monthly,
          getSpendingState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getSpendingState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }
}
