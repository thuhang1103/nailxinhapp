import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/order/order.dart' as entity;

part 'order_model.freezed.dart';
part 'order_model.g.dart';

// helper converters
double? _doubleFromJson(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString());
}

dynamic _doubleToJson(double? v) => v;

DateTime? _dateTimeFromJson(dynamic v) {
  if (v == null) return null;
  if (v is DateTime) return v;
  try {
    return DateTime.parse(v.toString());
  } catch (_) {
    final ms = int.tryParse(v.toString());
    if (ms != null) return DateTime.fromMillisecondsSinceEpoch(ms);
    return null;
  }
}

String? _dateTimeToJson(DateTime? v) => v?.toIso8601String();

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'AddressID') int? addressID,
    @JsonKey(name: 'AddressName') String? addressName,
    @JsonKey(name: 'VoucherID') int? voucherID,
    @JsonKey(
      name: 'TotalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? totalAmount,
    @JsonKey(
      name: 'DiscountAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? discountAmount,
    @JsonKey(
      name: 'FinalAmount',
      fromJson: _doubleFromJson,
      toJson: _doubleToJson,
    )
    double? finalAmount,
    @JsonKey(
      name: 'OrderDate',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? orderDate,
    @JsonKey(
      name: 'UpdatedAt',
      fromJson: _dateTimeFromJson,
      toJson: _dateTimeToJson,
    )
    DateTime? updatedAt,
    @JsonKey(name: 'Paid_Status') String? paidStatus,
    @JsonKey(name: 'Order_Status') String? orderStatus,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  entity.Order toEntity() {
    return entity.Order(
      orderID: orderID,
      addressID: addressID,
      addressName: addressName,
      voucherID: voucherID,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      finalAmount: finalAmount,
      orderDate: orderDate,
      updatedAt: updatedAt,
      paidStatus: paidStatus,
      orderStatus: orderStatus,
    );
  }
}
