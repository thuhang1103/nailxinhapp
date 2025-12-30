import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  const Order._();

  const factory Order({
    int? orderID,
    int? addressID,
    String? addressName,
    int? voucherID,
    double? totalAmount,
    double? discountAmount,
    double? finalAmount,
    DateTime? orderDate,
    DateTime? updatedAt,
    String? paidStatus,
    String? orderStatus,
  }) = _Order;
}
