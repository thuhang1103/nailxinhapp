import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/order/order_detail.dart' as entity;

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  const OrderDetailModel._();

  const factory OrderDetailModel({
    @JsonKey(name: 'OrderDetailID') int? orderDetailID,
    @JsonKey(name: 'OrderID') int? orderID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'VariantName') String? variantName,
    @JsonKey(name: 'ImagePath') String? imagePath,
    @JsonKey(name: 'Quantity') int? quantity,
    @JsonKey(name: 'Price') double? price,
    @JsonKey(name: 'Total') double? total,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  entity.OrderDetail toEntity() {
    return entity.OrderDetail(
      orderDetailID: orderDetailID,
      orderID: orderID,
      productID: productID,
      productName: productName,
      variantName: variantName,
      imagePath: imagePath,
      quantity: quantity,
      price: price,
      total: total,
    );
  }
}
