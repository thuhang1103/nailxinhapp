//freezed
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/common_state.dart';
import '../../../domain/entities/vouchers.dart';

part 'manage_voucher_state.freezed.dart';

@freezed
class ManageVoucherState with _$ManageVoucherState {
  const factory ManageVoucherState({
    @Default([]) List<Voucher> vouchers,
    Voucher? maxVoucher,
    String? code,
    String? description,
    double? minOrderValue,
    double? discountAmount,
    DateTime? startDate,
    DateTime? endDate,
    @Default(CommonState.initial()) CommonState createVoucherState,
    @Default(CommonState.initial()) CommonState updateVoucherState,
    @Default(CommonState.initial()) CommonState deleteVoucherState,
    @Default(CommonState.initial()) CommonState getvoucherState,
  }) = _ManageVoucherState;
}
