import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vouchers.dart' as entity;

part 'voucher_model.freezed.dart';
part 'voucher_model.g.dart';

@freezed
class VoucherModel with _$VoucherModel {
  const VoucherModel._();

  const factory VoucherModel({
    @JsonKey(name: 'VoucherID') int? voucherId,
    @JsonKey(name: 'Code') String? code,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'DiscountAmount') int? discountAmount,
    @JsonKey(name: 'MinOrderValue') int? minOrderValue,
    @JsonKey(name: 'StartDate') DateTime? startDate, // thêm
    @JsonKey(name: 'EndDate') DateTime? endDate,
  }) = _VoucherModel;

  factory VoucherModel.fromJson(Map<String, dynamic> json) =>
      _$VoucherModelFromJson(json);

  entity.Voucher toEntity() {
    return entity.Voucher(
      voucherId: voucherId,
      code: code,
      description: description,
      discount: discountAmount?.toDouble() ?? 0.0,
      minOrderValue: minOrderValue,
      startTime: startDate,
      endTime: endDate,
    );
  }
}
