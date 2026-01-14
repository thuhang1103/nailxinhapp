//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import './../../domain/entities/order/order.dart';
import './../../domain/entities/order/order_detail.dart';
import './../../domain/entities/spending.dart';

part 'get_spending_state.freezed.dart';

@freezed
class GetSpendingState with _$GetSpendingState {
  const factory GetSpendingState({
    @Default([]) List<MonthlySpending> monthly,
    @Default(0) double totalMonth,
    @Default(0) double totalYear,
    @Default(0) int countMonth,
    @Default(0) int countYear,
    @Default(CommonState.initial()) CommonState getSpendingState,
  }) = _GetSpendingState;
}

GetSpendingState initial() => GetSpendingState();
