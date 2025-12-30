import 'package:freezed_annotation/freezed_annotation.dart';

part 'vouchers.freezed.dart';

@freezed
class Voucher with _$Voucher {
  const Voucher._(); // private ctor for custom getters

  const factory Voucher({
    int? voucherId,
    String? code,
    String? description,
    @Default(0.0) double discount,
    int? minOrderValue,
    DateTime? startTime,
    DateTime? endTime,
  }) = _Voucher;
}
