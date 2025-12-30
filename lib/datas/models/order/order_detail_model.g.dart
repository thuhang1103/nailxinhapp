// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$OrderDetailModelImpl(
  orderDetailID: (json['OrderDetailID'] as num?)?.toInt(),
  orderID: (json['OrderID'] as num?)?.toInt(),
  productID: (json['ProductID'] as num?)?.toInt(),
  productName: json['ProductName'] as String?,
  variantName: json['VariantName'] as String?,
  imagePath: json['ImagePath'] as String?,
  quantity: (json['Quantity'] as num?)?.toInt(),
  price: (json['Price'] as num?)?.toDouble(),
  total: (json['Total'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$OrderDetailModelImplToJson(
  _$OrderDetailModelImpl instance,
) => <String, dynamic>{
  'OrderDetailID': instance.orderDetailID,
  'OrderID': instance.orderID,
  'ProductID': instance.productID,
  'ProductName': instance.productName,
  'VariantName': instance.variantName,
  'ImagePath': instance.imagePath,
  'Quantity': instance.quantity,
  'Price': instance.price,
  'Total': instance.total,
};
