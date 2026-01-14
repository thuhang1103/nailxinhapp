import 'package:bloc/bloc.dart';

import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
import './manage_voucher_event.dart';
import './manage_voucher_state.dart';
import '../../core/helper.dart';
//usecase
import '../../domain/usecases/voucher_usecase.dart';

class ManageVoucherBloc extends Bloc<ManageVoucherEvent, ManageVoucherState> {
  final VoucherUseCase voucherUseCase;
  ManageVoucherBloc({required this.voucherUseCase})
    : super(const ManageVoucherState()) {
    // register handlers
    on<GetVoucherEvent>(_onGetVoucher);
    on<CreateVoucherEvent>(_onCreateVoucher);
    on<UpdateVoucherEvent>(_onUpdateVoucher);
    on<DeleteVoucherEvent>(_onDeleteVoucher);
    on<ChangeCodeEvent>(_onChangeCode);
    on<ChangeDescriptionEvent>(_onChangeDescription);
    on<ChangeMinOrderValueEvent>(_onChangeMinOrderValue);
    on<ChangeDiscountAmountEvent>(_onChangeDiscountAmount);
    on<ChangeStartDateEvent>(_onChangeStartDate);
    on<ChangeEndDateEvent>(_onChangeEndDate);
    on<GetInfoVoucherEvent>(_onGetInfoVoucher);
  }

  Future<void> _onGetVoucher(
    GetVoucherEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    emit(state.copyWith(getvoucherState: const CommonState.loading()));

    try {
      final vouchers = await voucherUseCase.getAllVoucher();
      final maxVoucher = await voucherUseCase.getMaxVoucher();

      emit(
        state.copyWith(
          vouchers: vouchers,
          maxVoucher: maxVoucher,
          getvoucherState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getvoucherState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onCreateVoucher(
    CreateVoucherEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    emit(state.copyWith(createVoucherState: const CommonState.loading()));

    try {
      await voucherUseCase.createVoucher(
        state.code ?? '',
        state.description ?? '',
        state.minOrderValue ?? 0,
        state.discountAmount ?? 0,
        state.startDate ?? DateTime.now(),
        state.endDate ?? DateTime.now(),
      );
      emit(state.copyWith(createVoucherState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          createVoucherState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onUpdateVoucher(
    UpdateVoucherEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    emit(state.copyWith(updateVoucherState: const CommonState.loading()));

    try {
      print('Vào bloc cập nhật');
      await voucherUseCase.updateVoucher(
        event.voucher.voucherId ?? 0,
        state.code ?? '',
        state.description ?? '',
        state.minOrderValue ?? 0,
        state.discountAmount ?? 0,
        state.startDate ?? DateTime.now(),
        state.endDate ?? DateTime.now(),
      );
      emit(state.copyWith(updateVoucherState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          updateVoucherState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteVoucher(
    DeleteVoucherEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    emit(state.copyWith(deleteVoucherState: const CommonState.loading()));

    try {
      print('Vào bloc xoá');
      await voucherUseCase.deleteVoucher(event.voucher.voucherId ?? 0);
      emit(state.copyWith(deleteVoucherState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          updateVoucherState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onChangeCode(
    ChangeCodeEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(code: event.code));
    } catch (e) {}
  }

  Future<void> _onChangeDescription(
    ChangeDescriptionEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(description: event.description));
    } catch (e) {}
  }

  Future<void> _onChangeMinOrderValue(
    ChangeMinOrderValueEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(minOrderValue: event.minOrderValue));
    } catch (e) {}
  }

  Future<void> _onChangeDiscountAmount(
    ChangeDiscountAmountEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(discountAmount: event.discountAmount));
    } catch (e) {}
  }

  Future<void> _onChangeStartDate(
    ChangeStartDateEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(startDate: event.startDate));
    } catch (e) {}
  }

  Future<void> _onChangeEndDate(
    ChangeEndDateEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(state.copyWith(endDate: event.endDate));
    } catch (e) {}
  }

  Future<void> _onGetInfoVoucher(
    GetInfoVoucherEvent event,
    Emitter<ManageVoucherState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          code: event.voucher.code,
          description: event.voucher.description,
          minOrderValue: (event.voucher.minOrderValue ?? 0).toDouble(),
          discountAmount: event.voucher.discount,
          startDate: event.voucher.startTime,
          endDate: event.voucher.endTime,
        ),
      );
    } catch (e) {}
  }
}
