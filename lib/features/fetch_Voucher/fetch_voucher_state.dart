//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import '../../../domain/entities/vouchers.dart';

part 'fetch_voucher_state.freezed.dart';

@freezed
class VoucherState with _$VoucherState {
  const factory VoucherState({
    @Default([]) List<Voucher> vouchers,
    Voucher? maxVoucher,
    @Default(CommonState.initial()) CommonState voucherState,
  }) = _VoucherState;
}
