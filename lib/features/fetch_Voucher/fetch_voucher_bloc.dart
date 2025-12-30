import 'package:bloc/bloc.dart';

import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
import 'fetch_voucher_event.dart';
import 'fetch_voucher_state.dart';
import '../../core/helper.dart';
//usecase
import '../../domain/usecases/voucher_usecase.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherUseCase voucherUseCase;
  VoucherBloc({required this.voucherUseCase}) : super(const VoucherState()) {
    // register handlers
    on<FetchVoucherEvent>(_onLoadVoucherData);
    on<GetMaxVoucherEvent>(_onGetMaxVoucher);
  }

  Future<void> _onLoadVoucherData(
    FetchVoucherEvent event,
    Emitter<VoucherState> emit,
  ) async {
    emit(state.copyWith(voucherState: const CommonState.loading()));

    try {
      final vouchers = await voucherUseCase.getAllVoucher();
      final maxVoucher = await voucherUseCase.getMaxVoucher();
      print('Loaded voucher data: $vouchers, maxVoucher: $maxVoucher');

      emit(
        state.copyWith(
          vouchers: vouchers,
          maxVoucher: maxVoucher,
          voucherState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          voucherState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onGetMaxVoucher(
    GetMaxVoucherEvent event,
    Emitter<VoucherState> emit,
  ) async {
    try {
      final maxVoucher = await voucherUseCase.getMaxVoucher();
      emit(state.copyWith(maxVoucher: maxVoucher));
    } catch (e) {
      emit(
        state.copyWith(
          voucherState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }
}
