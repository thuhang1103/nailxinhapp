import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail.freezed.dart';

@freezed
class OrderDetail with _$OrderDetail {
  const OrderDetail._();

  const factory OrderDetail({
    int? orderDetailID,
    int? orderID,
    int? productID,
    String? productName,
    String? variantName,
    String? imagePath,
    int? quantity,
    double? price,
    double? total,
  }) = _OrderDetail;
}
